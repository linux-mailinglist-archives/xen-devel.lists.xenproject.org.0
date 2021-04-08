Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564735843E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 15:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107334.205197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUS1-0002Rm-Hu; Thu, 08 Apr 2021 13:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107334.205197; Thu, 08 Apr 2021 13:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUUS1-0002R4-EU; Thu, 08 Apr 2021 13:12:01 +0000
Received: by outflank-mailman (input) for mailman id 107334;
 Thu, 08 Apr 2021 13:11:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUURz-0002Qy-K9
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 13:11:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.46]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 877fb7ec-2d2b-424a-aa2a-818596cbc921;
 Thu, 08 Apr 2021 13:11:56 +0000 (UTC)
Received: from AM5PR0601CA0070.eurprd06.prod.outlook.com (2603:10a6:206::35)
 by AS8PR08MB6726.eurprd08.prod.outlook.com (2603:10a6:20b:39a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 13:11:54 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::51) by AM5PR0601CA0070.outlook.office365.com
 (2603:10a6:206::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 13:11:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 13:11:53 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Thu, 08 Apr 2021 13:11:53 +0000
Received: from d3925506afc0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95794414-5C0B-43E0-AA07-92427182CB03.1; 
 Thu, 08 Apr 2021 13:11:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3925506afc0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Apr 2021 13:11:45 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5775.eurprd08.prod.outlook.com (2603:10a6:800:1a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 13:11:44 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 13:11:44 +0000
Received: from [192.168.0.22] (82.8.129.65) by
 LO4P123CA0302.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Thu, 8 Apr 2021 13:11:43 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 877fb7ec-2d2b-424a-aa2a-818596cbc921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhhRmmau+R88fUQjlPhSsMADOnZzFIKHSvO/yan1u5E=;
 b=7BwOgrQCapJLFSeNL9kZq/39Tg2S1nQyW74WJtUZl+dkZnaxvfoiwYZJ2pZ4bFGL3ydsZLQFozdAsVYDi1SEvlNwN/mcchde8nn+McO+DmnAPzPJ99GFLIZXAaU3RhVKRFt+WKruOFiWmodaSgLMZR5Mh/pgSq2+jcbzIYCpYHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbef8f516c2ff840
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csEEZINXl5oo6veIt6QcKetPNPQtfordGOnuxhnvZsGUVW0r9sLcT1WssWiidqdXR6eNwNFdoY8FLGAcXKw3dIRhZpzb73DYvTKyTK+XOvone+xJhL0niyl44C/4IUu9Yq5y3iGFlpRf/ZBH9x8mUxRWb3kjZkl8Lm3WX3NEzyTwADfGJg2awzc4mRQNSqy+TnyyMoB0uZo7NFvhYHr2Rk+zJHQQrYaEm1ZTVQGIPYX54zomYfdzhsA71fJSrGEp24M959r0xbGRG91085Ru/1fBs2XdZyeiJKYkJtMameaSaqTFuhUhipgS+HMdW35dfoXXJZD/e7JNXO9Mz4Aj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhhRmmau+R88fUQjlPhSsMADOnZzFIKHSvO/yan1u5E=;
 b=euqkvwgubVQc6cXm245D7cJ8X2im4IgJ67b/USoEXLVneKBeEal6BFk9gqA64p+6dZnep8muBgTzjBfHLoz4/xpxCsIF8ksjmza19mMMu4TejhYifVjpIOssWWp0cFH1bCJikoc5SQIy2hRw5MyB1O6knRbWQ5QoaIswGIlfxi5rOlZ0c3sjsHrcv7fv7aAKq5oJj3YLRvv6/ja15Q8XQ+I//aQzMZFvm8uMr8L2W2yzMolSGKT/PfJYxbIhCLfRh3xAYXjTh7CsoHTO7gnF/5IqMfYBES+SIA45YvrBnRnuHTf/JOWBpj8fPQihOEea2ut6higDTofbjMTgPrTPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhhRmmau+R88fUQjlPhSsMADOnZzFIKHSvO/yan1u5E=;
 b=7BwOgrQCapJLFSeNL9kZq/39Tg2S1nQyW74WJtUZl+dkZnaxvfoiwYZJ2pZ4bFGL3ydsZLQFozdAsVYDi1SEvlNwN/mcchde8nn+McO+DmnAPzPJ99GFLIZXAaU3RhVKRFt+WKruOFiWmodaSgLMZR5Mh/pgSq2+jcbzIYCpYHI=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 2/4] xen/arm: Handle cases when hardware_domain is NULL
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <b79f363c-2220-f187-6840-23205ef37e1e@suse.com>
Date: Thu, 8 Apr 2021 14:11:39 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4F221E20-0ABA-499D-A810-4A2A4F20F17D@arm.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-3-luca.fancellu@arm.com>
 <b79f363c-2220-f187-6840-23205ef37e1e@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0302.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::19) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4a3aaa4-5a96-4039-bebb-08d8fa8fe141
X-MS-TrafficTypeDiagnostic: VE1PR08MB5775:|AS8PR08MB6726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB67266EA2DB65EB6744529B06E4749@AS8PR08MB6726.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TQVdMTJWpyy4OZipiYMDs2RNCqAWngpBY8iSDrxaJHC9GfXHMEhdu2lGQ6epExo6jmTaICGKEK/oNU3d5d0gODEGLZsRW/g2ISvTPn+rT2hd37gHcCOOd77oGm37qLST1pivJvSwwl/jlUYqI2aYGs4VUeafudw3SlS5G9cNvjAh6UaAomOaPcUcZG1KE9gPOknDdxmL3sRNnV89+M46icngys3Vh2y/Ct8vfOWHhN8UC+k/xIyJTPy2rIhDMNK0yXKKeQRk0ulGQpJtSi8yuKv4Mhs4MJV/OA2qeuzopG0p4fpjb2MuhNsNqQc5RZMQyb+/wICQNoYry2Ecd0iiXdf7MUFlPHgOg0vwwlPnhh9RQXaMlhH5SPNTt2ks8hMIrAqsmYaI5JZMM/tw7pulQmNFV8aczXHdqFp81hVbx3VRo4ykGt/yEeA3aiN/M3S0LCpU395oni114YIZrsLwu536pVTVxMCBgZDkJLms78z2zyU0XF6dUF4ELRHqvAAFrM8XIXekRiRf6yVNV1V1j44IWoh0sqt3xmwbHlxqWXs2LGZged5PY0Xrmr071llqKO1IQML5LbKgwcq3ztMzNvePynCAjwBnOB9TkOPjsCp18+t5owi9SCVh/qQe1wj2pBQdEf7f8bIrQ7y6tUmqIVc75/Gh2tYMNdNmivrFNz0TIi7oa52vbEZmGtqRw55c0EEpOZim0pmLdqDaOmLX9QGVn6g3l8vlI+VZIWOtolY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(33656002)(956004)(316002)(38100700001)(2616005)(52116002)(66476007)(2906002)(66946007)(4326008)(53546011)(66556008)(36756003)(38350700001)(6486002)(6666004)(186003)(5660300002)(16526019)(54906003)(8676002)(478600001)(44832011)(86362001)(6916009)(8936002)(26005)(16576012)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?R0lyWlVRT3RlRU8zWFA1cE1hZ21DcnBnNWdhYUVTdXRmZklUWUxvMDh0ek81?=
 =?utf-8?B?LzVpcWxMSURraHBQYjAzSCtTUEJ3UWV1RERwbXZ3RzNWMVZLTkdRYjhpRnYz?=
 =?utf-8?B?MUZUUEI4V1ZmYlF0K3Y0Z2F5NTNQWHBzYm81eU5PZlR3UEdaUll5cGxqS2Zx?=
 =?utf-8?B?NU9ocXlxQk9QMUNtajBvNllUbHUzK0NrUzFoK2NQS0hwdTF0RnprZThDV3Vq?=
 =?utf-8?B?ejgreEN0aGdiVXZvQ3Y5MW1BQnpvaU50L2l3VC9aQm1pWHBUd1c2Vm9PQ1Na?=
 =?utf-8?B?NExHN3BqRloxUXQyM3UvUjY4TTFCaHdPdjFEOENxVWpuMTlEQVVFOUhpNWt6?=
 =?utf-8?B?TE4rZ1oyNzQyU3ZmT0NqS1lZcFQwdzZRcHlzTXZSeVZiVWY1L3MvU1hoV0lT?=
 =?utf-8?B?S04vRjBhREhCbEd3ejh1R3o0RVV3OTVsa0RENXk5c3prUVMxNXo1MnVXazkv?=
 =?utf-8?B?cUdJc2Mzcms0SlA2TE5sY1ZIZEtQcTdKZGJCS2xLRnhqUWJpb3lFbW9JdmhF?=
 =?utf-8?B?NUNqWlBUWlZnZjkvRUR4U0JkWEF1YTB5cDlINkFzZ0UrMzNYRitOZkxFa00w?=
 =?utf-8?B?ckdvNDhrcXFUYXFZbHF1cFhWb0R0MUp0SFdVNVU0ak9DOWxZM3dZUCtpMkEx?=
 =?utf-8?B?OXJ6c3BCSUQ1ZUQ2WGpYb3JKNGJpU2laeVJPWnlYcnc4RnZmcFlqeHJ4ZVZK?=
 =?utf-8?B?K2VHc1V4bFVYUXVPOW9SaEpnOTJlL0d2YnRscHYxNk9nNG1kYXdvb1ZVc1dV?=
 =?utf-8?B?b3Q3WklOMzdrNnZpYkk4WE5PQm9nUDJTdVZpbDllR0t4YjRSMGdwK1JMZHNh?=
 =?utf-8?B?RVE5K0JBbmVrVTJrTHFHR2prcHhtS3JQSmdaZHdjc2VBbEM3UkZXM2w4bCtK?=
 =?utf-8?B?THBoSTFpUTF2akQxWHIrbG9SLzY3MXdxVXVtYm5WUktNSitKT0MxbWpCbjVx?=
 =?utf-8?B?S3QxcnpaZkE2ZWtiM0lVY3QyYWdIei9Dd3paNFZYL1kvYTN3b2x0czVTSGxB?=
 =?utf-8?B?RTE1NlpIdkFMRnJ1YU5WZlBQcGVsZTZGdVlFRkVhVHJrRi9xTG9vVzZneE5R?=
 =?utf-8?B?akRXTUVLZm9nRkQrWjlDbWxrbjV1bFh0VXRoWUxsREV0VWFYOEpZRzZnRlF0?=
 =?utf-8?B?MEU4a2E0VndMVkhFT0lSNE5hOFhTOE9CTWNGdkpobmQ0c0t6VzcrOHl1MUJ2?=
 =?utf-8?B?Q0NENjFaQU8rTlRLbktPT3loRGNTSkdtNi84WFNnUWFjY3puRW1DcEhqSCtQ?=
 =?utf-8?B?RngwZ1dwRUhJazlPcWpNaFJiZ3p5ZFpiWW9OOTUzS1p6R3RxQUlZU2s4YXJz?=
 =?utf-8?B?Rk1HSXZtMjNUSmtlaWtzNVdYRmpING5wd2pycG9lV3JzaGpqdHJrbFFtNURQ?=
 =?utf-8?B?cnloTUNjUEhhTkpuOCtsaUxtSC9tQmxHbXRuY2oxRDdPK0VwRnVXLzJvRXlP?=
 =?utf-8?B?b1FKNzEzRUpUVjZuZWl2YVZKQ09iSkphSzNHM2R2RE94aWoxZHhxSGljSUc5?=
 =?utf-8?B?NDVjODhZcjlHT21LRXNkN1BJWjhwRlpBd1lpQ0FIeGFWb0Vxc2g4SERyK0x1?=
 =?utf-8?B?TlhkTnI5a050UHJGamZqNytzNWI0ZklZazg0RjZmVGt5dkU4S0tOSmNzT1F4?=
 =?utf-8?B?VlRtbjVYRnIxNFFtN0V4bEFBZ3NOak15ZFllbWN3b1UyMG1VWlhxSXJkWWNp?=
 =?utf-8?B?Q0h1b3pxUXNMcEMvSWRDN0pYcC90dlBLUTVBWUxrK1NSaTdVSHlLK1FRSjFW?=
 =?utf-8?Q?3LPbFaVbAeaHBodnmALiq1KSaydesCfktWgHci5?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5775
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	782d3f6e-295f-40a5-4113-08d8fa8fdb27
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GIjaYc1fBa3dsVhT29YqoSb65bE97GOsD0/UJERg9esUjPqPv9/IJyOAsThULrlfTeSEQgFgtcDCfLIA5hWEiSIuFFdrbmNQRmOBvv/q3gPFxU3D4LIpP+v9arRMgcXJHVKAxUaIvdXTmZJMeUNwT9JxCgwrVRJ+6pvedvqBUgZ1AzkNC8xhEZsSoVoHuGCBJsYCfA6S7K3hyB5ZSN4LoTJrfvLx6jo/h/dgv1ZG/9Re41zr0tVGVoYGR8x73upkaHi6bRGJtZ2VpcCTjDxcwEw787ApD7ul2hKUd4URjua7cYsFmHY/iPGQqBSqzd0288cvpDp5Wo7pwBgbBOK+goRQyytcXxoAcAqV+DSKzvmsEtzwGzK/Doay9KjlBaWWKAAectE36D7ntSGUTKzEZJEKuqbERqsKp61RMjZXUiWO0952Ye77uicv8QV0c656/K6/DMcJYwslRaDF5i8q191x+x+P5jAsFVYbCwKIv8xAm1CropfoLH/zbBhCp5RqgNL7oyzhnYxl/kGZevsH0tx8OTvcIBXIe6ePg7iL8YEe1cPyTrkt0BoX1xeC+F6FAcppjtA70VjGxmCY/J3S1TxisuPBsIfKYHtol3ekYfYTbjgeaQ6QSHpsnAJ+TBTODGEg9qCHTUlvwkHA+tLk2OTeIzPDytY7u6SS/v4L6H0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(82740400003)(70206006)(5660300002)(956004)(44832011)(47076005)(33656002)(356005)(36756003)(6486002)(336012)(16576012)(316002)(8676002)(36860700001)(8936002)(6666004)(6862004)(54906003)(53546011)(82310400003)(186003)(81166007)(86362001)(478600001)(2616005)(4326008)(70586007)(26005)(16526019)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 13:11:53.8565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a3aaa4-5a96-4039-bebb-08d8fa8fe141
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6726



> On 8 Apr 2021, at 11:17, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.04.2021 11:48, Luca Fancellu wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -308,7 +308,7 @@ static int late_hwdom_init(struct domain *d)
>>     struct domain *dom0;
>>     int rv;
>>=20
>> -    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
>> +    if ( !is_hardware_domain(d) || d->domain_id =3D=3D 0 )
>>         return 0;
>>=20
>>     rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
>> @@ -705,7 +705,7 @@ struct domain *domain_create(domid_t domid,
>>     err =3D err ?: -EILSEQ; /* Release build safety. */
>>=20
>>     d->is_dying =3D DOMDYING_dead;
>> -    if ( hardware_domain =3D=3D d )
>> +    if ( is_hardware_domain(d) )
>>         hardware_domain =3D old_hwdom;
>>     atomic_set(&d->refcnt, DOMAIN_DESTROYED);
>=20
> While these may seem like open-coding of is_hardware_domain(), I
> think it would be better to leave them alone. In neither of the two
> cases is it possible for d to be NULL afaics, and hence your
> addition to is_hardware_domain() doesn't matter here.

Yes that is right, the only thing is that we have a nice function
=E2=80=9CIs_hardware_domain=E2=80=9D and we and up comparing =E2=80=9Cmanua=
lly=E2=80=9D.
It looks weird to me, but I can change it back if you don=E2=80=99t agree.

>=20
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -30,7 +30,7 @@ enum domain_type {
>> #endif
>>=20
>> /* The hardware domain has always its memory direct mapped. */
>> -#define is_domain_direct_mapped(d) ((d) =3D=3D hardware_domain)
>> +#define is_domain_direct_mapped(d) (is_hardware_domain(d))
>=20
> Nit: If this was code I'm a maintainer of, I'd ask for the unneeded
> parentheses to be dropped.

Sure I can do that on the next version of the patch

>=20
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1022,7 +1022,7 @@ static always_inline bool is_hardware_domain(const=
 struct domain *d)
>>     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>         return false;
>>=20
>> -    return evaluate_nospec(d =3D=3D hardware_domain);
>> +    return evaluate_nospec((hardware_domain !=3D NULL) && (d =3D=3D har=
dware_domain));
>> }
>=20
> This would be the first instance in the tree of an && expression
> inside evaluate_nospec(). I think the generated code will still be
> okay, but I wonder whether this is really needed. Can you point
> out code paths where d may actually be NULL, and where
>=20
> static always_inline bool is_hardware_domain(const struct domain *d)
> {
>    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>        return false;
>=20
>    if ( !d )
>        return false;
>=20
>    return evaluate_nospec(d =3D=3D hardware_domain);
> }
>=20
> would not behave as intended (i.e. where bad speculation would
> result)? (In any event I think checking d against NULL is preferable
> over checking hardware_domain.)

I agree with you, I will change the code checking if d is NULL the
way it=E2=80=99s written above

Cheers,
Luca

>=20
> Jan


