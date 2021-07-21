Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CF3D09D6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 09:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159145.292766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m66nQ-0002Br-ON; Wed, 21 Jul 2021 07:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159145.292766; Wed, 21 Jul 2021 07:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m66nQ-00028V-KE; Wed, 21 Jul 2021 07:37:36 +0000
Received: by outflank-mailman (input) for mailman id 159145;
 Wed, 21 Jul 2021 07:37:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCq8=MN=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m66nO-00028P-2z
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 07:37:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81cbd398-e9f6-11eb-8c09-12813bfff9fa;
 Wed, 21 Jul 2021 07:37:31 +0000 (UTC)
Received: from AS8PR04CA0188.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::13)
 by HE1PR0802MB2393.eurprd08.prod.outlook.com (2603:10a6:3:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 07:37:25 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::a) by AS8PR04CA0188.outlook.office365.com
 (2603:10a6:20b:2f3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 07:37:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 07:37:24 +0000
Received: ("Tessian outbound 664b93226e0b:v99");
 Wed, 21 Jul 2021 07:37:24 +0000
Received: from 558697d06e3c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4223BC7-12CA-4CEC-9F0D-AF87965C8C8C.1; 
 Wed, 21 Jul 2021 07:37:13 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 558697d06e3c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Jul 2021 07:37:13 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4512.eurprd08.prod.outlook.com (2603:10a6:803:f4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 07:37:11 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 07:37:11 +0000
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
X-Inumbo-ID: 81cbd398-e9f6-11eb-8c09-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0o6LQ/OB/7EFiQjCrKXlXZmbZvDPHc8Hf+xn7JjKnc=;
 b=DKIVjlrOCuaMU4gke+jjEF/ufVmkazDnPF6Gv6vdHOcMI8a5CbJm3qjFsvkYJAILefClc778S77Ok58hq2XFMTGDcRdFDnjrmVhynMEsrs+oTJdde6QwKEJRFDEUW5tU+enFrSYJHbBAgqB4LYJ+K1JYMnDkIszjWVAI1UTcyx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUL3K1xD0NdI47Alzk1xBrvl1j/ghEElh2hBv/8cqEhns0ksx4iujci44CZ/HaKgq9e4KIcC1KBVGcBGpBSZz+kY6xTq3S4+ZOiK6Zre/bdOoArwIPCYcHRVmdXhcp/nc/Kijg54E7qEFV1UEZ9YyO2we3deabHBIT00IQ7p6w8NL6Ar1GH2q5IuqBF3hk+FWSx6lWEmHl1U5/x9UXDYyx9THXJXaApIxbvTso5z4wpnP+x9hMszq8DzS7RnCAZooUi7WQby17SR/bpFjnWyaDisaPRj1DP+N4BHvDY+WuyM4+K0flUpTxTecH/GSK6vA73Yc+oFRsVk5fIFuG6DdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0o6LQ/OB/7EFiQjCrKXlXZmbZvDPHc8Hf+xn7JjKnc=;
 b=KKH0k+loy4yu5Yj8FdeiOy+rmLS4XewWkpplRuVDjj+BnrkAvlHvNEcigcg4Ek9Ngl+7iF2BmV1R/vMXqFWjwhzpyoqeGkFLiR5xLfJUt5WnB+fYH+vvHkqIS6HmyutWtA3MvbSIO9LoGtyKlM5545OQ4zsFzmVWNoYqpu07j9yAGllzmWKEOG5lBo+wdsoOpTkkVW4odNY8wm+kCEhPNoeoBkswHcAAZSAaols1RHDdSh3Bb3cx3Ob9ziWI/a2IfOE9u1n5ZwzGlsn/n7ulIYqKuCF/JMZ5oU8knLgdXqPeYk0Byt2vL2Da3CnWfNPMvSKD6VKXTht2E1xyd6BRlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0o6LQ/OB/7EFiQjCrKXlXZmbZvDPHc8Hf+xn7JjKnc=;
 b=DKIVjlrOCuaMU4gke+jjEF/ufVmkazDnPF6Gv6vdHOcMI8a5CbJm3qjFsvkYJAILefClc778S77Ok58hq2XFMTGDcRdFDnjrmVhynMEsrs+oTJdde6QwKEJRFDEUW5tU+enFrSYJHbBAgqB4LYJ+K1JYMnDkIszjWVAI1UTcyx4=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH V3 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
Thread-Topic: [PATCH V3 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
Thread-Index: AQHXeTjq+y3FueirQkOYkBcn9nCNvqtKDb8AgAMBuBA=
Date: Wed, 21 Jul 2021 07:37:11 +0000
Message-ID:
 <VE1PR08MB5215344641EB2E350FAE1D8AF7E39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-9-penny.zheng@arm.com>
 <48c59068-296e-7060-1352-f07338833378@suse.com>
In-Reply-To: <48c59068-296e-7060-1352-f07338833378@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4E962547B3411A438EA6295E02656FC0.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5b1616a0-1208-468b-ac44-08d94c1a6202
x-ms-traffictypediagnostic: VI1PR08MB4512:|HE1PR0802MB2393:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB239365EE3B3212588D49C243F7E39@HE1PR0802MB2393.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2150;OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZbYBRZyoI1B+VOM9k2WmKc4SVikrWrWFcxf0WyGfL8rejvOsLuUpzn9AsgIhErWnVJ/3/1+rXn//GlaaK9+hbbv45e3+ZKfBc5f4G8wSF2Fd0YCWENxllOZpaVXI6h+M+0Ji6I7WkiY/mbCPpDVS4Hz4M8QVfVEZLlt34C0+pqeCw57uM9Mp+z6FrpqwnTWMbSL1/qOHPi752SKmSrT2GfzwnRmJHBm+cqDB1DNczfbYsz6UMOodG9k59UX/1VoyOW1kq7O43Qg1YbGgAH7L92XXqy7Mf1SqivNCUzBZkaZ0ZXiwqvHLhAgkIjEEpWd4CAGLPb5MHM51K64TswpvfV1AqePKTuYxI/c2FR9cq/gt/HJl7YVq22NATjhALxOjH8gcOo029niKHjrXP6rO2vyEcQeh/Sm9OXXET7PJr6TCD+/tZHRi1cvmYCpx+DoNk0PGWFyn1aw7MdkKqq+2DXe7MjxK2TvDD4UnJXtRdBuXWAFPRLlZNDCT2wq/xQkkP1+7j25mxG9wr1sTLAwVhe3Quu/fbvASUiXRoxuYQEOLpZdRIwF+BQtk+GqdQc7cczzgQQV79QViY+RqGbjSQhIsR2pDsFM9MYj0l7iTbiPerdvtQYJOrVkc0LrzmKIQZt3DB0PzAIcw0qHh+Jj5UahBxXs0YmxejIMArIhOJWiMRRnUc/EBwj2NpxJPM+1c0EuH64haQY0TKpH69z2Pjg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(39850400004)(396003)(122000001)(26005)(316002)(64756008)(7696005)(66446008)(186003)(83380400001)(6506007)(478600001)(38100700002)(76116006)(33656002)(52536014)(71200400001)(53546011)(86362001)(4326008)(6916009)(2906002)(55016002)(66476007)(66946007)(8936002)(8676002)(5660300002)(54906003)(66556008)(9686003)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z296aGg5MEhZZDNicXZLYXBQMEN2cFFHNDBhN3RnWmFWZUFSc0J6bWwwZjJm?=
 =?utf-8?B?azFJaDc5UjMwSzdNWTlLMUhDYW9vSGNBWmlPeVdkRzJzWTRyNXM4UDJMdUNv?=
 =?utf-8?B?K1E3aWZoK01CcTFtTEwvUXFyS1o4K204VElYT1Q4cXJJdmpob1g5SUlkd3BL?=
 =?utf-8?B?ZE9iVDJQU2huWC9UVDdvZkdkcVpQRnR5UnhxbWxxVnBaWTE1cjdac2J0VFFq?=
 =?utf-8?B?a0M2TnlBOHZqNTVldExnQ2FremZFSTUvMEhMRjNFUzF3SUZBUjlEMUFjK3R3?=
 =?utf-8?B?NHg2RitGNW1SclFBSU5OTFc1S29TbGpoTXBYUWMvZXVhQjFmcTNDa3VjVjFy?=
 =?utf-8?B?SUl3WHk3QnFqZWVyRlhnNUZpd3o5OEJxSnpSK1BmUDEzNW55VnU2NUdFRGVI?=
 =?utf-8?B?SnhwVy9pcHZjU3Znb25oUWM4bWxRRWlnV2k2SVY3bEdOWk5qS3U3TU9ZOFBs?=
 =?utf-8?B?M0xDUEw0ZWdzcm1JNTFwNUxaNGlNNVgxTGdMWEpKL0U5Z1c5TUtqZGdlZXVI?=
 =?utf-8?B?SHc4bHNaQmF2NnVhRktZY0ZKNERQREdRTk4rWGs4aUs3ZE5JdmRRNDJkRHNQ?=
 =?utf-8?B?Z2JNZmkzamFMWm9QeERidFR2L3BLY1o2T2ZET3l4MThOVEUyV0dRVG1OcHlj?=
 =?utf-8?B?VlF0VEEwcm1RRHRMbGNpMWhNWDF3UXM0RlE1blBKVXczNDQ1QnpaKytWUjFS?=
 =?utf-8?B?cGx1bGRxeGZXM1lJQ3VqbUJrR0ZEYWJVeWFPaW1BZnVITmtOVzV6RGhoSmtY?=
 =?utf-8?B?RlJQVVdLVGRYakhUTVNNL3VoWnFyL2FWcnZ6RnRiQkV0K1EzSCtrVUJXZ1ow?=
 =?utf-8?B?UEU2dm1aQ0VMUllHYW5rRTEvMitpM3JiOHpaZENPUEg4em9rdVJjSjVKYkJK?=
 =?utf-8?B?RDMzU2hyYUlEOEhrOTVSM1B4bjhmeFNVU3B0YmlJL2U3dTN3bnVDalJEK3hZ?=
 =?utf-8?B?RkpybHRJT05jSmNVbzkzblVwL0lIYll1WUJsbXYwVWhQL21PSTVLajJIUG5z?=
 =?utf-8?B?UzhNSUJxM3ZaOGZCRC9yUStGamFKVmZLYkNYTC82Q1dlaUpmeTBocGUvSUJr?=
 =?utf-8?B?bGxrRmVmLzZVeWpqVFNhME1xK3BRcW1IdGNyTjhuL2tSSW1SQ3pKYmZpRFhI?=
 =?utf-8?B?WUZVM09OdzRPYzVXakhoc3RtV2t0ZHFla2ZiTHRnSy9sUG9rd3ZtTzJJQ1Rw?=
 =?utf-8?B?NmFGWXJsUCtpNVlrQi9TVjFDbHQyY05ST1dWWWRxVHhrOHJkMGZJWi92K0sy?=
 =?utf-8?B?OVVHTXErVXlvWEErVHU1TzRIdk9HanBxR2FYbVpVRGZpMWVHMUVncUhsNTBs?=
 =?utf-8?B?QklTL1c4L1R2cGR4NlRRZzNhODlNOGhoL1F5dDRVR2crRHpLTW5oMnFPYUVE?=
 =?utf-8?B?OVpITkhocUxObUZCUTEzbG16aHhQOGFQZnBDb1ZZZW5wT3poWkErNkJKK2E4?=
 =?utf-8?B?Q2VRRU9RVktPbFFma243T0hKZmVSRDNQNklvdDMzaU50VGZ4TWFuMWpxYkFY?=
 =?utf-8?B?NEhxL1U5OGpWVit6bUlZYjdsRFNETEhiVmpZZTVMRU5MVzdjeDRCWitZa21a?=
 =?utf-8?B?aEFCZ3V0VEpEV1VHQ1BrVmczWUdzV1FNRlZSM3lXSjJCcmwzSzJuRTNKdVFa?=
 =?utf-8?B?SVF6bWZhVVVlVnhZb3hxNmtxOGFqOWYvZFJTNndURnQ5bTNqRDJzSjRWT3lC?=
 =?utf-8?B?Q3hEeTVBcWs3SDVpY3VOd1VOcFBkbWlia3pxL2RCOWpoRzg2NnQrN2daWjN5?=
 =?utf-8?Q?N+01xA90Jd4/tp89Rkz9rE0v1+MkKyC4NEfTfmU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4512
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20b55d95-9ce0-491e-68b8-08d94c1a5a6b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0oBT75GqlvFK7bLQ/7OX2MnAvH6JM+eSuG/zGb2F11IeoXVLBBAtENoznAeYdL9X0Tebq6Goy3CfV9m4fWTojMt40g3A084RO15pDSvOK9IK9isn2fVb/RW6SdJkQxSpU4e/je9GNwhd7BPk8Luz/xbgQKBVKhnPBzvr3kVj6ducmkyUhGRKndoKYrTxs8cV51bFcqTq7q7As0JMmbdW3ru5wpkN5fScGS95AwjRmzXn8x2OEo8biRcu82r1by3Jqhffm3+j56l4OO0xlDA7OjH4iEnVcJg1zPvL8ADLm9CUyJLJHAAgUDTIRr4LeYNEZer6PaORYtBruSuuAUHi3cWc0KvtkudkMRxQ4byw9JIofA8pSGf9x1by6z6SkTqgxM3hlnkHSUzp9na/MzwB9NLhkPrGJkLvLXMPuR5/dVnGTZsdVbdV4FPkx3qBxXdxCgG+WtN7DWfYNLCwcQXxQlibZ4Bevn0awLYnvGjFfVBaKHqmpuu77JeYLpkX7ZZMWoLVPUORa/1phxr25Kb47lr3jlPbzBf0NS/trUiFZj84o4iGl6taR1DDavB9DycZhsQnBbrJDFUc0YD+OFDf9YF9IPhRnyWDy3lAAfTHgSXzx+JWm0/ClyLIcR1Un7/E5Qk2pkH7HCf2EN1/ogOAqdDWyxqRG9HYVfu91NSSNe8ZzgxVLc6eZpMubR3BQnleBgTrpCbiUi84/fCshWn6Zg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(55016002)(33656002)(70206006)(4326008)(26005)(83380400001)(81166007)(2906002)(9686003)(36860700001)(336012)(186003)(508600001)(5660300002)(8676002)(53546011)(82310400003)(86362001)(54906003)(316002)(7696005)(6862004)(52536014)(47076005)(356005)(6506007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 07:37:24.6139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1616a0-1208-468b-ac44-08d94c1a6202
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2393

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTksIDIwMjEgNToy
NiBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYzIDA4LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYWNxdWlyZV9zdGF0
aWNtZW1fcGFnZXMNCj4gYW5kIGFjcXVpcmVfZG9tc3RhdGljX3BhZ2VzDQo+IA0KPiBPbiAxNS4w
Ny4yMDIxIDA3OjE4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBAQCAtMTA2NSw2ICsxMDY5LDcz
IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19oZWFwX3BhZ2VzKA0KPiA+ICAgICAg
cmV0dXJuIHBnOw0KPiA+ICB9DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZ
DQo+ID4gKy8qDQo+ID4gKyAqIEFjcXVpcmUgbnJfbWZucyBjb250aWd1b3VzIHJlc2VydmVkIHBh
Z2VzLCBzdGFydGluZyBhdCAjc21mbiwgb2YNCj4gPiArICogc3RhdGljIG1lbW9yeS4NCj4gPiAr
ICovDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICphY3F1aXJlX3N0YXRpY21lbV9wYWdl
cyh1bnNpZ25lZCBsb25nIG5yX21mbnMsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBzbWZuLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50DQo+ID4gK21lbWZs
YWdzKQ0KPiANCj4gVGhpcyBhbmQgdGhlIG90aGVyIGZ1bmN0aW9uIG5vdCBiZWluZyBfX2luaXQs
IGFuZCB0aGVyZSBuZWl0aGVyIGJlaW5nIGFueSBjYWxsZXINCj4gbm9yIGFueSBmcmVlaW5nLCBh
IHF1ZXN0aW9uIGlzIHdoZXRoZXIgX19pbml0IHdhbnRzIGFkZGluZzsgcGF0Y2ggMTAgc3VnZ2Vz
dHMNCj4gc28uIFRoZSBsYWNrIG9mIGZyZWVpbmcgaW4gcGFydGljdWxhciBtZWFucyB0aGF0IGRv
bWFpbnMgY3JlYXRlZCB1c2luZyBzdGF0aWMNCj4gbWVtb3J5IHdvbid0IGJlIHJlc3RhcnRhYmxl
LCByZXF1aXJpbmcgYSBob3N0IHJlYm9vdCBpbnN0ZWFkLg0KPiANCg0KUmlnaHQgbm93LCBhbGwg
ZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0aW9uIGdldCBjb25zdHJ1Y3RlZCB0aHJvdWdoIGRldmlj
ZSB0cmVlLCBpbg0KYm9vdC11cCB0aW1lLiAgIl9faW5pdCIgaXMgcHJlZmVycmVkLg0KDQo+ID4g
K3sNCj4gPiArICAgIGJvb2wgbmVlZF90bGJmbHVzaCA9IGZhbHNlOw0KPiA+ICsgICAgdWludDMy
X3QgdGxiZmx1c2hfdGltZXN0YW1wID0gMDsNCj4gPiArICAgIHVuc2lnbmVkIGxvbmcgaTsNCj4g
PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiA+ICsNCj4gPiArICAgIC8qIEZvciBub3cs
IGl0IG9ubHkgc3VwcG9ydHMgcHJlLWNvbmZpZ3VyZWQgc3RhdGljIG1lbW9yeS4gKi8NCj4gPiAr
ICAgIGlmICggIW1mbl92YWxpZChzbWZuKSB8fCAhbnJfbWZucyApDQo+ID4gKyAgICAgICAgcmV0
dXJuIE5VTEw7DQo+ID4gKw0KPiA+ICsgICAgc3Bpbl9sb2NrKCZoZWFwX2xvY2spOw0KPiA+ICsN
Cj4gPiArICAgIHBnID0gbWZuX3RvX3BhZ2Uoc21mbik7DQo+ID4gKw0KPiA+ICsgICAgZm9yICgg
aSA9IDA7IGkgPCBucl9tZm5zOyBpKysgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIC8qDQo+
ID4gKyAgICAgICAgICogUmVmZXJlbmNlIGNvdW50IG11c3QgY29udGludW91c2x5IGJlIHplcm8g
Zm9yIGZyZWUgcGFnZXMNCj4gPiArICAgICAgICAgKiBvZiBzdGF0aWMgbWVtb3J5KFBHQ19yZXNl
cnZlZCkuDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAgICAgaWYgKCBwZ1tpXS5jb3VudF9p
bmZvICE9IChQR0Nfc3RhdGVfZnJlZSB8IFBHQ19yZXNlcnZlZCkgKQ0KPiA+ICsgICAgICAgIHsN
Cj4gPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4gPiArICAgICAgICAgICAgICAg
ICAgICJwZ1slbHVdIFN0YXRpYyBNRk4gJSJQUklfbWZuIiBjPSUjbHggdD0lI3hcbiIsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICBpLCBtZm5feChwYWdlX3RvX21mbihwZyArIGkpKSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8sIHBnW2ldLnRsYmZsdXNoX3RpbWVz
dGFtcCk7DQo+ID4gKyAgICAgICAgICAgIEJVRygpOw0KPiA+ICsgICAgICAgIH0NCj4gPiArDQo+
ID4gKyAgICAgICAgaWYgKCAhKG1lbWZsYWdzICYgTUVNRl9ub190bGJmbHVzaCkgKQ0KPiA+ICsg
ICAgICAgICAgICBhY2N1bXVsYXRlX3RsYmZsdXNoKCZuZWVkX3RsYmZsdXNoLCAmcGdbaV0sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnRsYmZsdXNoX3RpbWVzdGFtcCk7
DQo+ID4gKw0KPiA+ICsgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICogUHJlc2VydmUgZmxhZyBQ
R0NfcmVzZXJ2ZWQgYW5kIGNoYW5nZSBwYWdlIHN0YXRlDQo+ID4gKyAgICAgICAgICogdG8gUEdD
X3N0YXRlX2ludXNlLg0KPiA+ICsgICAgICAgICAqLw0KPiA+ICsgICAgICAgIHBnW2ldLmNvdW50
X2luZm8gPSAoUEdDX3Jlc2VydmVkIHwgUEdDX3N0YXRlX2ludXNlKTsNCj4gPiArICAgICAgICAv
KiBJbml0aWFsaXNlIGZpZWxkcyB3aGljaCBoYXZlIG90aGVyIHVzZXMgZm9yIGZyZWUgcGFnZXMu
ICovDQo+ID4gKyAgICAgICAgcGdbaV0udS5pbnVzZS50eXBlX2luZm8gPSAwOw0KPiA+ICsgICAg
ICAgIHBhZ2Vfc2V0X293bmVyKCZwZ1tpXSwgTlVMTCk7DQo+ID4gKw0KPiA+ICsgICAgICAgIC8q
DQo+ID4gKyAgICAgICAgICogRW5zdXJlIGNhY2hlIGFuZCBSQU0gYXJlIGNvbnNpc3RlbnQgZm9y
IHBsYXRmb3JtcyB3aGVyZSB0aGUNCj4gPiArICAgICAgICAgKiBndWVzdCBjYW4gY29udHJvbCBp
dHMgb3duIHZpc2liaWxpdHkgb2YvdGhyb3VnaCB0aGUgY2FjaGUuDQo+ID4gKyAgICAgICAgICov
DQo+ID4gKyAgICAgICAgZmx1c2hfcGFnZV90b19yYW0obWZuX3gocGFnZV90b19tZm4oJnBnW2ld
KSksDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAhKG1lbWZsYWdzICYgTUVNRl9u
b19pY2FjaGVfZmx1c2gpKTsNCj4gDQo+IEluZGVudGF0aW9uLg0KPiANCj4gPiArICAgIH0NCj4g
PiArDQo+ID4gKyAgICBpZiAoIG5lZWRfdGxiZmx1c2ggKQ0KPiA+ICsgICAgICAgIGZpbHRlcmVk
X2ZsdXNoX3RsYl9tYXNrKHRsYmZsdXNoX3RpbWVzdGFtcCk7DQo+ID4gKw0KPiA+ICsgICAgc3Bp
bl91bmxvY2soJmhlYXBfbG9jayk7DQo+IA0KPiBJJ20gcHJldHR5IHN1cmUgSSBkaWQgY29tbWVu
dCBiZWZvcmUgb24gdGhlIGZsdXNoX3BhZ2VfdG9fcmFtKCkgYmVpbmcgaW5zaWRlDQo+IHRoZSBs
b2NrZWQgcmVnaW9uIGhlcmUuIFdoaWxlIFhTQS0zNjQgZG9lc24ndCBhcHBseSBoZXJlIGJlY2F1
c2UgeW91IGRvbid0DQo+IGRlZmVyIHNjcnViYmluZyAoeWV0KSwgdGhlIGZsdXNoaW5nIG1heSBz
dGlsbCB0YWtlIHRvbyBsb25nIHRvIGhhcHBlbiBpbnNpZGUgdGhlDQo+IGxvY2tlZCByZWdpb24u
IE9mIGNvdXJzZSB0aGVyZSdzIGEgZGVwZW5kZW5jeSBoZXJlIG9uIHdoZW4gZXhhY3RseSB0aGUg
Y2FsbChzKQ0KPiB0byB0aGlzIGNvZGUgd2lsbCBoYXBwZW4uIEluIHBhcnRpY3VsYXIgaWYgb3Ro
ZXIgRG9tVS1zIGNhbiBhbHJlYWR5IGJlIHJ1bm5pbmcNCj4gYXQgdGhhdCBwb2ludCwgdGhpcyBt
YXkgbm90IGJlIHRvbGVyYWJsZSBieSBzb21lIG9mIHRoZW0uIFlldCBpZiB0aGlzIGlzDQo+IGlu
dGVudGlvbmFsIGFuZCBkZWVtZWQgbm90IGEgcHJvYmxlbSwgdGhlbiBJJ2QgaGF2ZSBraW5kIG9m
IGV4cGVjdGVkIHRoZQ0KPiBkZXNjcmlwdGlvbiB0byBtZW50aW9uIHRoaXMgZGlmZmVyZW5jZSBm
cm9tIGFsbG9jX2hlYXBfcGFnZXMoKSwgd2hpY2ggeW91IHNheQ0KPiB0aGlzIGlzIGFuIGVxdWl2
YWxlbnQgb2YuDQo+IA0KDQpTb3JyeSBmb3IgbWlzc2luZyB0aGUgY29tbWVudHMgb24gdGhlIGZs
dXNoX3BhZ2VfdG9fcmFtKCkgYmVpbmcgaW5zaWRlIHRoZQ0KbG9ja2VkIHJlZ2lvbi4NCg0KVGFr
aW5nIGEgd2hpbGUgcmVhZGluZyB0aGUgWFNBLTM2NCwgeW91J3JlIHJpZ2h0LCBlc3BlY2lhbGx5
IHdpdGggYXN5bmNocm9ub3VzDQpzY3J1YmJpbmcgaW4gdGhlIHRvLWRvIGxpc3QsIHB1dHRpbmcg
Y2xlYW5pbmcgY2FjaGUgb3V0c2lkZSBvZiB0aGUgbG9ja2VkIHJlZ2lvbg0KaXMgbmVjZXNzYXJ5
IGhlcmUuDQoNCj4gPiBAQCAtMjQxMSw2ICsyNDgzLDQyIEBAIHN0cnVjdCBwYWdlX2luZm8gKmFs
bG9jX2RvbWhlYXBfcGFnZXMoDQo+ID4gICAgICByZXR1cm4gcGc7DQo+ID4gIH0NCj4gPg0KPiA+
ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPiArLyoNCj4gPiArICogQWNxdWlyZSBu
cl9tZm5zIGNvbnRpZ3VvdXMgcGFnZXMsIHN0YXJ0aW5nIGF0ICNzbWZuLCBvZiBzdGF0aWMNCj4g
PiArbWVtb3J5LA0KPiA+ICsgKiB0aGVuIGFzc2lnbiB0aGVtIHRvIG9uZSBzcGVjaWZpYyBkb21h
aW4gI2QuDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgcGFnZV9pbmZvICphY3F1aXJlX2RvbXN0YXRp
Y19wYWdlcygNCj4gPiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIG5y
X21mbnMsIG1mbl90IHNtZm4sDQo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IG1lbWZsYWdzKQ0K
PiA+ICt7DQo+ID4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwZyA9IE5VTEw7DQo+ID4gKw0KPiA+
ICsgICAgQVNTRVJUKCFpbl9pcnEoKSk7DQo+ID4gKw0KPiA+ICsgICAgcGcgPSBhY3F1aXJlX3N0
YXRpY21lbV9wYWdlcyhucl9tZm5zLCBzbWZuLCBtZW1mbGFncyk7DQo+ID4gKyAgICBpZiAoICFw
ZyApDQo+ID4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gKw0KPiA+ICsgICAgLyogUmlnaHQg
bm93LCBNRU1GX25vX293bmVyIGNhc2UgaXMgbWVhbmluZ2xlc3MgaGVyZS4gKi8NCj4gPiArICAg
IEFTU0VSVChkKTsNCj4gPiArICAgIGlmICggbWVtZmxhZ3MgJiBNRU1GX25vX3JlZmNvdW50ICkN
Cj4gPiArICAgIHsNCj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGk7DQo+ID4gKw0KPiA+ICsg
ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbnJfbWZuczsgaSsrICkNCj4gPiArICAgICAgICAgICAg
cGdbaV0uY291bnRfaW5mbyB8PSBQR0NfZXh0cmE7DQo+ID4gKyAgICB9DQo+IA0KPiBXaXRoIE1F
TUZfbm9fb3duZXIgbm93IGNhbGxlZCBvdXQgYXMgbWVhbmluZ2xlc3MgaGVyZSwgd2hhdCBhYm91
dA0KPiBNRU1GX25vX3JlZmNvdW50Pw0KPiANCg0KSSBjb3VsZCBub3QgdGhpbmsgb2YgYSBjYXNl
IHdoZXJlICJtZW1mbGFncyAmIE1FTUZfbm9fcmVmY291bnQiIGlzIG5lZWRlZCByaWdodCBub3cu
DQoNCkFsbCBhY3F1aXJlZCBwYWdlcyBhcmUgZm9yIGd1ZXN0IFJBTSByaWdodCBub3csIGV4dHJh
IHBhZ2VzIGxpa2UgZ3JhbnQgdGFibGUsIGV0YywgYXJlIG5vdCBzdXBwb3J0ZWQNCm9uIGRvbWFp
biBvbiBzdGF0aWMgYWxsb2NhdGlvbiwgZXZlbiBtb3JlLCBhbnkgZG9tMC1sZXNzIGRvbWFpbi4N
Cg0KSSdsbCByZW1vdmUgdGhpcyBwYXJ0IGFuZCBwdXQgYSBmZXcgY29tbWVudHMgb24gaXQuDQoN
Cj4gSmFuDQoNCkNoZWVycw0KUGVubnkNCg0K

