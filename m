Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799353874D6
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 11:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128969.242088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livlL-0003Ce-FC; Tue, 18 May 2021 09:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128969.242088; Tue, 18 May 2021 09:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livlL-0003AX-C2; Tue, 18 May 2021 09:11:39 +0000
Received: by outflank-mailman (input) for mailman id 128969;
 Tue, 18 May 2021 09:11:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1livlK-0003AR-6O
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 09:11:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 466effdb-cadc-41b2-b751-df7b4013c7e7;
 Tue, 18 May 2021 09:11:35 +0000 (UTC)
Received: from AM6PR08CA0034.eurprd08.prod.outlook.com (2603:10a6:20b:c0::22)
 by AM0PR08MB5252.eurprd08.prod.outlook.com (2603:10a6:208:15a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 09:11:33 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::ca) by AM6PR08CA0034.outlook.office365.com
 (2603:10a6:20b:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Tue, 18 May 2021 09:11:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 09:11:32 +0000
Received: ("Tessian outbound ea2c9a942a09:v92");
 Tue, 18 May 2021 09:11:32 +0000
Received: from 5f4943b216ab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11CB0373-9AE0-4E60-9D65-C9146234ABF9.1; 
 Tue, 18 May 2021 09:11:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f4943b216ab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 09:11:26 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5824.eurprd08.prod.outlook.com (2603:10a6:800:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 09:11:24 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 09:11:24 +0000
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
X-Inumbo-ID: 466effdb-cadc-41b2-b751-df7b4013c7e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q7KXzE/8MKF9VUsFuMvHcTZu5f1VfqfVr7nJoEsK1A=;
 b=Iv384AANHHuGfjuChl76CnUIx9EU08zh6AxI7jFUwfiYUC1AW1TWPsUKoWQmF6RBAj6iWy5WVEJfJuYda+R6xJEPnpeC5vUJbkgSxQoim6GdjbHIlK4pVSr6RD+Ldyrsqd84YWb0Cwtm+lkX4pPaAgtovnE/mV4qUCqTjBGE3PE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkqhRsdP5tX0YzNSqoGQvwoktyoxmuGgUZjHvA3nJWz0Aqju7rViAVmF7zEsuItLb/IGNxn5Wu+b8Amn/VEod/TsQnNHMOAX3sQuCCY8Rl7DI05DDFz5tNTJGCGc2vKp3AWfEw4MOpEk0SA5EcemFgHH6nl4E1xvyzpwvFHwpc+HLhomUX2LGZFNr54bogyQ0w5sgqKFz8vdgUyN51sHGxKFDbl4Kkpe7NIK7MUY2SWWEtLSlEOQ61ypg8iQoA435fJo/JNfeL7FoJm49wSjae3/MjT7C5bDQSt7powYFRem8wJskNjWDImA0NAdpIohmhU7KcWXYaLM710/eaozFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q7KXzE/8MKF9VUsFuMvHcTZu5f1VfqfVr7nJoEsK1A=;
 b=UxS0k/JazVllUCznwx7NYb9y5sE/h5LBxo2maDQydyBsTGcHbh79X/GTlGZt42sm/JqDd7Gyj220sX1uQdQXtgQRj32wt2C2hIO0NGiKaQezSnR50/lGgIBRqtccjs92U/OSgcqLF014TyRMnFpzHmSag1BmXucqid+5qqLmZLZthgUBXeF/mxTJbZB/zlKjZDH2pfxqnnEXOx6S0qxrJC92VKMta+ulwQWnhOe+AHN5jAFPcvJrU+W/IK2IbZJ2PU1n8jcmWqu/X39HqbU5Sh20YXCUXmw5IDp9cuGb5NVe/C0osZzwndXvhqLznyB/K8gzB854mOTcLfyFykoECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Q7KXzE/8MKF9VUsFuMvHcTZu5f1VfqfVr7nJoEsK1A=;
 b=Iv384AANHHuGfjuChl76CnUIx9EU08zh6AxI7jFUwfiYUC1AW1TWPsUKoWQmF6RBAj6iWy5WVEJfJuYda+R6xJEPnpeC5vUJbkgSxQoim6GdjbHIlK4pVSr6RD+Ldyrsqd84YWb0Cwtm+lkX4pPaAgtovnE/mV4qUCqTjBGE3PE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 06/10] xen: replace order with nr_pfns in assign_pages for
 better compatibility
Thread-Topic: [PATCH 06/10] xen: replace order with nr_pfns in assign_pages
 for better compatibility
Thread-Index: AQHXS6W5eIGNu7DPG0i7DMYwhf4hF6ro11yAgAAZR+A=
Date: Tue, 18 May 2021 09:11:24 +0000
Message-ID:
 <VE1PR08MB52153185C5E2C25E798FB376F72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-7-penny.zheng@arm.com>
 <ede08d62-5240-bc52-3475-abdaef1afd30@suse.com>
In-Reply-To: <ede08d62-5240-bc52-3475-abdaef1afd30@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CE5D4A2733D91149A4ECA2E40FEA8EA8.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c98c72e1-d4f3-47d1-8caa-08d919dcee35
x-ms-traffictypediagnostic: VE1PR08MB5824:|AM0PR08MB5252:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB52524DD1BC6188B7BB826508F72C9@AM0PR08MB5252.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UvJRFV8TKPmED4kgqvz3sMlxOo2+raAM7sbohU9g6dTm1Tt+UA/8TOccB3RnHx+Kgdx9KNOqat2+Cay9gBSvTCFL7fn6opiVAc1I+wdW/yqFEOiqqNFP17JczJCtM1KxUjQXevrMF7X34SdWcEjZBNeOXIJdsv7sRoPOljW4SJI2zpIpKFRIh5h2X80KfTmEcXQfjdRlXt9aBuyZLbIV/ikAO28ACxvS2kYbe70t/A4bvVibTXxPi/I0saUCB3Kg9FWfdQhhCxGOjeYmnqtViDn1rA9xUCf79S4dlDTtDs3AXgltdYVSUvmrRKtXMeN7IQJ3RQ1uBkYx1Ynut6ok9uXREUjWJvBZo7YZQ1PRH2M0XluKhF4HLFb9YBQJnSnNevVDfSH23ZUNAzEq6jyNSc21fmombVTkGvwkwHbPd3zC3gPyvzOEAH4bJK+DSkrFkWddL0og9ykxZPCVJ8BQI87J5v1sATB7IaR2IDoVz15IAUpXqpuOw1YC0rNYw6SBya5tK5aV4dMcUyM2Q5k51frR5WldQoROsgYjajLzXloY1o59Z6oFdTYkUiy4TKUhyrMKFmn4OoP7utIst9Dr26AQBWC4gIdbePTZsE/v0k0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(55016002)(8676002)(64756008)(66446008)(9686003)(26005)(66946007)(6916009)(66476007)(76116006)(316002)(71200400001)(66556008)(38100700002)(122000001)(54906003)(52536014)(7696005)(5660300002)(86362001)(8936002)(2906002)(4326008)(33656002)(186003)(53546011)(478600001)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?alRDNkp2QjhLbjFrMGRrOE9Rcm1Ha1dtSXh1T1FBc0w1Qng3clgvNWF3c0Ev?=
 =?utf-8?B?MTZhalhiMXcxRHhBeW5KZ0t2VW45RDB6Q2tMUTZQcVBjV2RTM3pBSVJJbHFR?=
 =?utf-8?B?UzR1ckhRR1R0RkNKLzViMnc1TllVTnpudDl2d0hsblpKNzVpckFibnh6RHNz?=
 =?utf-8?B?T25LQ3N0dkRXZCt6MUwvbTB5ZjhiZkRGb1h2bGRqVm1TeVVPVDRsSzRUVWhU?=
 =?utf-8?B?c01CL2x2Q1pRbzZZc05LR1VjYTZwVXY2dytoSEk1SWkydExLUDhmVFI2N0w5?=
 =?utf-8?B?Z3ZXZlZuL2ZaMTVqOHovVFI0K0ZDaGZiN3Z5V1RQNG5zTFNPdG1qYUxFMGJp?=
 =?utf-8?B?M01pVU5jKzFNUmlQTWI4cnVPKzZFenpHSHdjd2dJWXplTEs4WndJYnZUUkNN?=
 =?utf-8?B?Qmd6RktuUVFTQi8vWEVTeEFSaTd6YU1TcmUvOVZMUjMycUVjbnZ1Ykg3dkc4?=
 =?utf-8?B?RHlFSnZGQjh6YjhsZkZrSTNZRWEzTWVHbk9lKzhJMTdRRTZ0ZEZ0dWE3ZjRU?=
 =?utf-8?B?bWFlaUdGeURyOSttaWdZeERBRElsNElkVERoV2U3TTlTWmJrMXBUK3pjbE5R?=
 =?utf-8?B?VHh0QTMycEhLUGRvNmxLck8yUFlsdDkxWk5RTnRzVHVYYTk0anlJblhYNlJZ?=
 =?utf-8?B?dHBtMzR4WGU3UmdVMHZTTWVaZXNVbkUyVlRNemNCeHVtM3JOTG1WYWlUQU53?=
 =?utf-8?B?UDhVNTJSN1RPdEdIaEVFZEEva1dIeDJrajEzVlZBV01CdnVTUHhKOEo1SHZl?=
 =?utf-8?B?OEc1eGl5UWEwWXJMVnBhNzMvcncra2NIKzQ1eE1sNmZBTitEYXRrcm5keHZX?=
 =?utf-8?B?eGtHNzNoK1BZcE1qNWhSUkhLdUd2UFNUN1MrMTVPMy9oZ1FXR1JWaFJMdDZG?=
 =?utf-8?B?bVZaMXI3alMrcTdGYmtKL2o0RkJYMkJtSENjNWhCencwWmRjT3IxMWY5YXBM?=
 =?utf-8?B?TmxhVWFobUVSOUU1VUM5ZktQbWZsV3JTV2lIRlpudXBwWTJVaDNNbUt2bVVm?=
 =?utf-8?B?NE05clpxWlpHWWtFbnpPeXpvRGdibmtvZXVMQ0t1ellUNE5BempzbFNXMTJp?=
 =?utf-8?B?THp1ODM2ZloybzdzNmVQbS9sOGYzN2VqZjhHTFM4NEFyanFCSm9RZUs0bVpw?=
 =?utf-8?B?ODlyUDh1UEJka3FuR1FWOVV2YkwyRS9BYnlRNW01VjhlYVJiVmpycHRwaEZY?=
 =?utf-8?B?SW8vNVd5T3JUWmZGanJzT3Rvazl0WmZRS1BHeUtZY3JLOWxkV1oxNEp4WkVu?=
 =?utf-8?B?S3NwaDBLVVlsNjB6OUtiVVcycy84TU03alhVRmZxVlJ5VnBGcDdKdlUzTS9C?=
 =?utf-8?B?cU5mWjhONVpkUzhlNlo3OGZpTzVDUHJjb3hkWlFXdmcrWEpQbXB0cjU5OUhv?=
 =?utf-8?B?UVJLalZQcXV5VGc2aXdhZlRDcEVKM2cxdVRjSWN1bVp5elVNRXhUS1NqNk9p?=
 =?utf-8?B?SVo4d0FJNGdVN0lPYnVTL0ltQlRJd1VJck04cDFsb3pRSmpKM1NCZWZ4alBy?=
 =?utf-8?B?d09nVWxnaWFVWDdRT0xGRUc0bEhrazg2T25Cd0VZYi9mWjVRczFtbDlZTG5C?=
 =?utf-8?B?Z0hIOUdiams4RHNHZGJmYkR3NU1uUHBnQ2UxanNsOUV0WXhINDdOciswS3NE?=
 =?utf-8?B?b0dCdHQ5R1RKbndPSEhxZjZCUjFaZkJiV3Z3d0xsb25zcHdydlIyOWZuTTVs?=
 =?utf-8?B?SnZmSXEvblQvMFhFNnN2WGNzZklYYVh2OS9CbUNqQ3BiNS9TaTBWODRObWFS?=
 =?utf-8?Q?eEHBGUo1NPoH7XRpgRuVpv+6VAVJfNXxVsDf2hD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5824
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28e1b53f-4ec0-4df3-8b19-08d919dce92f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6DpRGdIxxnicOr7RDIz/lfbvV+zZsdC5WQvL4YxkNdzt2/NRvGeZeLAQdIdq3ju8YAkIOZ8vsqve6jjuNgTgV/GHdBSv8Ln8DsY92su2N052wCJz0gXQQeryLnQLSnEtFLH6vXZeBg/hxxFk31XzDWLwcs4E7HznUr61XgeZh/BRDkSn4F7GoZ87A5CrehYF5EIMGuB+B6FBYEkwQziIiPpjJP+VDZqlWRIaX9gHteWVxQxFeSwoyhx5T32sg41x+nGKO2/oXNseejL26/cMLcqrjTe/DV6i2+1p4JZqZmg5BuxXsBpHaUE+NtXqXyTN07leS+buoWWIno02dYYNCP6fROVip0UAsMYEDlZB8n+U7Mf2pAgoZbq+sEs1kyJClEUVIBqucqrglNvWT9mMs8pZ9ejnKSqEMOSXLFeHc7Z2PCdzM33veb2F6zdTjhQi5DZjbfAzT4GqBXKFpMugWz30FPJwGSuSlf9OJskdsFVT+109FZIlGn5sEHfS05mgd4F+wek7eWlCjCc3Ph8l2cPm/4K6IAgzesYDxk3ediTCl63ee/RcEJp4OP8kZ0MGAfUf59wVqEjnggfvFb3Vj+G52o5aKeuruL/DySNvxsbne17uXouFXU3fb9ZTxvRTeF7u0oysbtuFuPDZcm7+nI5Wf2KYSW7w56YjFX3iy1c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966006)(36840700001)(86362001)(186003)(356005)(4326008)(26005)(55016002)(33656002)(6862004)(9686003)(36860700001)(81166007)(83380400001)(478600001)(336012)(82740400003)(2906002)(47076005)(52536014)(8676002)(54906003)(53546011)(5660300002)(6506007)(7696005)(70586007)(70206006)(316002)(8936002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:11:32.8322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c98c72e1-d4f3-47d1-8caa-08d919dcee35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5252

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgMzoy
OCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDA2LzEwXSB4ZW46IHJlcGxhY2Ugb3JkZXIgd2l0aCBucl9wZm5zIGlu
IGFzc2lnbl9wYWdlcw0KPiBmb3IgYmV0dGVyIGNvbXBhdGliaWxpdHkNCj4gDQo+IE9uIDE4LjA1
LjIwMjEgMDc6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEZ1bmN0aW9uIHBhcmFtZXRlciBv
cmRlciBpbiBhc3NpZ25fcGFnZXMgaXMgYWx3YXlzIHVzZWQgYXMgMXVsIDw8DQo+ID4gb3JkZXIs
IHJlZmVycmluZyB0byAyQG9yZGVyIHBhZ2VzLg0KPiA+DQo+ID4gTm93LCBmb3IgYmV0dGVyIGNv
bXBhdGliaWxpdHkgd2l0aCBuZXcgc3RhdGljIG1lbW9yeSwgb3JkZXIgc2hhbGwgYmUNCj4gPiBy
ZXBsYWNlZCB3aXRoIG5yX3BmbnMgcG9pbnRpbmcgdG8gcGFnZSBjb3VudCB3aXRoIG5vIGNvbnN0
cmFpbnQsIGxpa2UNCj4gPiAyNTBNQi4NCj4gDQo+IFdoaWxlIEknbSBub3QgZW50aXJlbHkgb3Bw
b3NlZCwgSSdtIGFsc28gbm90IGNvbnZpbmNlZC4gVGhlIG5ldyB1c2VyIGNvdWxkDQo+IGFzIHdl
bGwgYnJlYWsgdXAgdGhlIHJhbmdlIGludG8gc3VpdGFibGUgcG93ZXItb2YtMiBjaHVua3MuIElu
IG5vIGNhc2UgZG8gSQ0KPiB2aWV3IHRoZSB3b3JkaW5nICJjb21wYXRpYmlsaXR5IiBoZXJlIGFz
IGFwcHJvcHJpYXRlLiBUaGVyZSdzIG5vDQo+IGluY29tcGF0aWJpbGl0eSBhdCBwcmVzZW50Lg0K
PiANCg0KWWVzLCBtYXliZSB0aGUgaW5jb21wYXRpYmlsaXR5IGlzIG5vdCB0aGUgZ29vZCBjaG9p
Y2UgaGVyZS4NClN1cmUsIHRoZSBuZXcgdXNlciBkZWZpbml0ZWx5IGNvdWxkIGNob29zZSB0aGUg
d29ya2Fyb3VuZCB0byBicmVhayB1cCB0aGUgcmFuZ2UsIHdoaWxlDQppdCBtYXkgY29zdCBleHRy
YSB0aW1lLiANCkFuZCB3aGlsZSBjb25zaWRlcmluZyBNUFUgc3lzdGVtLCAgbWVtb3J5IHJhbmdl
IHNpemUgaXMgb2Z0ZW4gbm90IGluIHRoZSBwb3dlci1vZi0yLiAgDQoNCj4gSmFuDQoNClRoYW5r
cw0KUGVubnkNCg==

