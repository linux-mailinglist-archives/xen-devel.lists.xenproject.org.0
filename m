Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B53BC7FE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150877.278915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gbz-00032v-Or; Tue, 06 Jul 2021 08:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150877.278915; Tue, 06 Jul 2021 08:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gbz-000312-KL; Tue, 06 Jul 2021 08:39:23 +0000
Received: by outflank-mailman (input) for mailman id 150877;
 Tue, 06 Jul 2021 08:39:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2YU=L6=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1m0gbx-00030n-Ce
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:39:21 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5caaf0dd-3e9e-4a93-bbcb-1f232d64fe2b;
 Tue, 06 Jul 2021 08:39:18 +0000 (UTC)
Received: from AS8PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:312::9)
 by PAXPR08MB6814.eurprd08.prod.outlook.com (2603:10a6:102:137::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Tue, 6 Jul
 2021 08:39:15 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::a) by AS8PR04CA0034.outlook.office365.com
 (2603:10a6:20b:312::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 6 Jul 2021 08:39:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 08:39:15 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97");
 Tue, 06 Jul 2021 08:39:14 +0000
Received: from 0a9efa466d37.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D60F816-EAF9-4DEB-966F-5F88B68FE022.1; 
 Tue, 06 Jul 2021 08:38:55 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a9efa466d37.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 08:38:55 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6303.eurprd08.prod.outlook.com (2603:10a6:102:e5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 08:38:53 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::4a9:5afa:372e:97f5%3]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 08:38:52 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 08:38:52 +0000
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
X-Inumbo-ID: 5caaf0dd-3e9e-4a93-bbcb-1f232d64fe2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88e5uJnjocZiQ6y05001YrnecmL77XSZOL2kC/SajeQ=;
 b=z7gW6c6o0LQp0czI4l8AMzxA6OYqXn4gy3KQeLc3PzePQkWw/kSIapA8jQIy8Hei1310JFHQHQWOt2NesJDbq0EysqnCmxkZUX6kKcqh/I3pbneC7KCs/fV5lQ5wQfQ7y2VC4+rnp7c98GxUb3E6QrLQXAKAeESaNdmKcKeYdzQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72b4b8ce17b6003c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pim82woxXXklO7SHjnPVDmcK0XLqU0PD2xY510IzNLWONBw71lzjZwxDR+ZpHhsQDP+2uxRA8QM9hmp28gb6KrgrzGKKN5k+3zyKksY13QX/E2I0aT6PybbnPBu4uw6fTVrRrCaTV4C7Mnr+3LJDKx7ur7GKFnTnTgZIESHnJHllz+19z5F7IkbfMakzxPHMtIOKwGH7628W+F8QIbQKMckr3iu8OUCUAxJr77VS2RT6jAl3MgZHEJsD3MJ0EYkBi1uqnUE78xozOkD+91MHhqoOLv9o93nfVpJWnTnZwvuCMuFBjrWBWRdIFNOsOTPWk4YbFgfMt656+Qg7gJXM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88e5uJnjocZiQ6y05001YrnecmL77XSZOL2kC/SajeQ=;
 b=aIqsbphX0oxzvJKJ4fGSYGCv19eumOLQUlrhpGC7z6n/Ue7FvWsxha2pV5+9zn9X+3AqdQH1NITsyzW8Wak/ky3VIGlL9x3AI/1Cwveb5Nv0ZWWrPDb4Z8o7AT1vSZkKXtpDkfAfs2MqPQFFyVhvzucKNN4RtSIRPU6G2ukfVnY86DLtHrXaibs6caEbyDxOPMTIWYsLT/yYga02aK1XOx5ZqWWoXwvzsWCgKByqE7wRe/MR2a2DgIZsR68Gmf1mOQIkBHNVAjz4PNijQ8c84gLw4awiOmN6CCznFY5sZ7ADc8h7WmWz6ksddLqkoRk/P5lp3q3YUe2ysaLKeyeXpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88e5uJnjocZiQ6y05001YrnecmL77XSZOL2kC/SajeQ=;
 b=z7gW6c6o0LQp0czI4l8AMzxA6OYqXn4gy3KQeLc3PzePQkWw/kSIapA8jQIy8Hei1310JFHQHQWOt2NesJDbq0EysqnCmxkZUX6kKcqh/I3pbneC7KCs/fV5lQ5wQfQ7y2VC4+rnp7c98GxUb3E6QrLQXAKAeESaNdmKcKeYdzQ=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v7 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <90673e86-cbf3-8a21-4251-e77f22327485@suse.com>
Date: Tue, 6 Jul 2021 09:38:46 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <63B52FB3-A436-4B19-9E26-052626E8BDAE@arm.com>
References: <20210705105103.14509-1-luca.fancellu@arm.com>
 <20210705105103.14509-10-luca.fancellu@arm.com>
 <f1f026fb-33e4-4d18-5718-ae9f9f42327d@suse.com>
 <54ADD75F-83DC-4891-914D-B85FBA69B440@arm.com>
 <90673e86-cbf3-8a21-4251-e77f22327485@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce0c4d87-1d10-4251-5e6b-08d940598972
X-MS-TrafficTypeDiagnostic: PA4PR08MB6303:|PAXPR08MB6814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6814C59BCB9737F692584865E41B9@PAXPR08MB6814.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /ezGm+ddS/RgxCw373/vY9wd39FywYk3ip9u8TCzwlfo8JQv0WhiPYR7DP1ui/fwGlU1nCfBGgTdJ/LuaIj7LrFh6+x8aKqIJawozkWH+O2r5bAyQoa6QkLpV624uwLmAqrCGPlcSHB7g1btPquonKwsv9LzEG7IWGHFmAo0iqCs/mug1gZJ7rix+jZ778XUiSSiYZOnLHwn1rJ8mhwwWkmmvxKdIcjmEw+XLKBGa10r+CMZjVfoOU4E8aJTRFMlwYkiw0Iw96lQGpgxj6JS0HXHFCwLN/I+RqJxKgO0bDoCFT44MxJb8cJ6fpWhxFDjI9cy04rmpi87nCkeztwUkxQNMRCkRPOX68v8MEJCV+7PeprzlfbaoMfgqgOuECEMTgJSVdXvPBZ1y+SP8m8T1lSpZu8lS9f6fK+pRYKW+QmLu20v/7RlEQGLNk03iwl8U2GOMf9t9yzWlZW2f/50yWWWfXwTvLvxOQI4GWSfoPrMoQAUkg40K7eTh4DOaCA1OoKcmOLRTEHWeTcyAgWAdaYFT/BeiTO2FdryVQ37q50o2IE4saFWGlIKEuZdwycWwaCdwX4n6ogPhL7LyVepOvw0ORcFCz12qg7/HlR+Yv66J+97rpVwQdx/euqjGzBU+/s+cRLLOIPhsOjv1BhcIMiYdTW47DSo5NjRjJjIVzBDjhcdY00MzfQeRim2KSub3HGlm8xlKVGKw4givueX/n7+ESV8HCCqxmXVwMhEKPkjIOpdsiPIj1tSG+Kue18m69J/wo+UVyzszApP7xOk/fqXLi0aJZpnvEU398uqynNG15JYygoYq/cP15NxR5mo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(346002)(136003)(366004)(376002)(54906003)(44832011)(2906002)(86362001)(186003)(6512007)(83380400001)(316002)(38350700002)(6486002)(38100700002)(36756003)(478600001)(16526019)(8936002)(4326008)(956004)(6916009)(66556008)(66476007)(6666004)(2616005)(26005)(8676002)(5660300002)(966005)(33656002)(52116002)(66946007)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OUhoRWlLOWdkSkxDOGdHL0YwVHgwUGtMY1B2MFUvUFI3WS9raDVjRWo5SVNZ?=
 =?utf-8?B?M3VvQU1TZ0FmMVhoTGNHVWtNV1Q3WU0va2t4RnA3U3BlakFoV2dZNGZtSUF2?=
 =?utf-8?B?eEx6ZmxIQjVTZUJNTVlTdnZmZndnUHRUbUtBdExOR3VGZGJ6c0NONkxCSE13?=
 =?utf-8?B?Z1BFRW82TlBncEQrVi9CZVp4VnRzRDIvQkRqb3FROXV2NGRpUmdhZHJlb1pS?=
 =?utf-8?B?cC9IckNiTUR6T2hIakR5U1Q1T0MxS1FvbGU1U25qajJjRFlpRmtCZDE1cTF2?=
 =?utf-8?B?K3d6VTdKcGpEQk9DUWhJK3pIT2pNMUI0UUh3MWYwRFdoZVJEMUNZSmt4US8v?=
 =?utf-8?B?S2lnK0lsRU80WGkrTEU0b3Mwa3FFSjZXUVlHVUlwT2VUeVZieXBFQ1RVM3dt?=
 =?utf-8?B?ZTBMU2RwTGh6b1VRUlM5VEFKYUdiakkwWlhoS2tYVzV4MzhjL3FnYjd5WGRm?=
 =?utf-8?B?alhySEVWcEp3MVBmd21WN3VnSHBxTURWS1Y2TlM5TkRKL1F3VW5iSytoVjV2?=
 =?utf-8?B?eW1sS0pYK3FESVRiOVFDTU1IYUV1RXRQZTRsZjV2dXRvOCtzYzZWT3k3NzJi?=
 =?utf-8?B?NmdFV2xON1h5Ri9pbFhnYjRjeGozUXFMNVVhZW1NZWN6NW42MVpiZVR2eENp?=
 =?utf-8?B?ejBIUkFLZ2NHa2pQNkxqb3RaR2lPdkE5MFlIVXZOZk5vOGt2U2d2MS9VVjk2?=
 =?utf-8?B?VkdJUHN0TXlrV1Y4emVCT1RLUVFlL2hOTG1aY1ZlT0Jwcm5XOXkxeXhtSFFq?=
 =?utf-8?B?YWNTM2tKamlGbmJHM0QvLzgvVEs3S2FzWDlHNStiVkRrVEZDQkVxK1VBWndF?=
 =?utf-8?B?ZkROQjJ5dERjR3RMaHhmQ3dvZjRBcjhXYXNmdmQ1aTJ1Wmd6czJORXVFMkRB?=
 =?utf-8?B?NlZubEMwSm8xMkZ4Z1Rubm0yOHFxbDFTZkxDT0R6RGtWZDFVdXhTdlpiUUJU?=
 =?utf-8?B?eVVFZmlHNjBPM1puT29hRzZRZXZ6WTJhbEEwc0g5NnRNZFpRWkIzUnQvMmRk?=
 =?utf-8?B?ZzF4clIxaXNxVzV6eXhqdWlsd09MMytzZkZsSElvby85WW9MbnlJRVp3Vllk?=
 =?utf-8?B?VC8rV0ozaFpOcUlQeElLR28rTERhQ1pVMUVOZ3BOTzkyWTQ4QkJMUzEyRzd3?=
 =?utf-8?B?a3hPeFRWbzMvV1BHZHVBaUthbG1xSUV6NndJM3VBak1EekUxSTlibmc5akhR?=
 =?utf-8?B?VGdDb3I1bko2RGNBakpHSkFQVis0M2I0ZkJ0VmdSb1FDVlZ1K3JwQlM4UFZM?=
 =?utf-8?B?TkJtVDBrbDVmaGh4NW9uaVYrU3h1ak5pS25vdFBVSjhSY3ptTHBtZlpYU0lO?=
 =?utf-8?B?V3ROSm9YL2Y2N0loMUVEaFQ2UHBkSXpvcUQ3T3F6ZWUzYWk3Z2lXV0VDZXFh?=
 =?utf-8?B?dlRlbm5VMjlqZVg3TFRjSmExbzFMMmZMTjZiSVhuL0wwNW5lcEI3RXVYdGdm?=
 =?utf-8?B?RXZjVDZtVkxZYVpNMTg5N0NKaUptSTgzdjg0YU8wTFptdG1oODA2ald4NnFI?=
 =?utf-8?B?amM0Y3VsTGFRRFdscDRaTEhudEFsRUFSRlJPcFYzUVVEb29KVG40aUxkUHFw?=
 =?utf-8?B?cFpsZjU5RlNiYXRiTXplZ0s3a2JGRDB4VTdBaTZJOVZLbXZZdGJWUUg5My8v?=
 =?utf-8?B?Rys0UFVtbTNGL1ZrTGdVSVk1WkFvN3BOaU02WEVyQXZ0a2gvRWxNdEhQclp0?=
 =?utf-8?B?bGJXbHJJWXYrMXFPVFJlaHNLcnQwTFd6SUp4SHBlMHpJSW5KNnFrMmtmZ3gv?=
 =?utf-8?Q?J7L66vAahqFOoOkXi4m9VID10h8vc7amT96iqLi?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6303
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b567bfa-1b89-434a-460a-08d940597c09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rYUjFb+FPoFBRA0VhLm3p8RgB3TEs2CRBJqebxSfvsfy0aC0QeoT1OEWMtyG5Nr3sc/Xi7R2Xh/Pa3hz+BdOwaMmvO5+fdGBovPgositUhDznK3vW+MtOp7BgI6RPr8uDBFTkgojT0j+Qrwm7yJNmytAZi9aFVNqxXUtfVjlpds6zcOBlbjpiywEFbVdZRpw/ulHxMabL6I5M3phSIHO32z4j87TAisl82E89h3N4Yy5q2MTLve1uT8Q7MEIsUdUPYqR8dxe4903cou9YyA5CiuZbBE2SpajNh+xo65MxhHKKD3OmQxEb1unoKItTlt5YYq8JR4tHzrs0qQvKoO/9jBHHbdeWbQTCXHt7KMyL/dOdfkrMqzKLzkFbMKqRRdFfSkG/c9oZXQThz7RPARsMNIxS9/8Ag3ZMsPbzvT6xpY28G9r9SdjSQuUkPErzunNERgbd7rYtHJq+T4081EL0m9rowIC+d0MJBUy3E7d2CzDTBX+ACz488Ar/2SbrddXuZnVbLNhuTp07VRyQZ8flCNSrowDV1VY8gN9wskPh2n9xaxqCROJi4jLLk2mthFlcqVKSWqhnz10C779UqdCa8h8WH7J6OurULSo9Zx6mfLSKO2frwZvK+DcBUUjTs+G63YPR6aBBD5KyDrzWH2ZndmbWtC6ppiRS1JcgQ4ojT/HQdm8vGZ0r2wLoznKy2Z7Vy6FJWM1AGCMXAhbQvNpH8Dd8JkpgswhC8DWlG9Min+EBUSFjfW/bMfS2fhMIj4j04hPP5X4wPHUCObL05WIk4iq9K44ucyAideKh9U3wTI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39840400004)(376002)(396003)(36840700001)(46966006)(5660300002)(316002)(956004)(54906003)(2616005)(336012)(186003)(36860700001)(81166007)(356005)(26005)(86362001)(6666004)(6512007)(70206006)(36756003)(2906002)(83380400001)(966005)(44832011)(82310400003)(53546011)(8676002)(47076005)(6486002)(8936002)(4326008)(478600001)(6506007)(33656002)(70586007)(6862004)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 08:39:15.0267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0c4d87-1d10-4251-5e6b-08d940598972
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6814



> On 5 Jul 2021, at 14:27, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.07.2021 15:23, Luca Fancellu wrote:
>> Hi Jan,
>>=20
>>> On 5 Jul 2021, at 14:03, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 05.07.2021 12:51, Luca Fancellu wrote:
>>>> Modification to include/public/grant_table.h:
>>>>=20
>>>> 1) Add doxygen tags to:
>>>> - Create Grant tables section
>>>> - include variables in the generated documentation
>>>> - Used @keepindent/@endkeepindent to enclose comment
>>>>  section that are indented using spaces, to keep
>>>>  the indentation.
>>>> 2) Add .rst file for grant table
>>>>=20
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>> v7 changes:
>>>> - commit message changed
>>>> - Add comment about grant table queries and uses
>>>> to the documentation
>>>> v6 changes:
>>>> - Fix misaligned comment
>>>> - Moved comments to make them display in the docs
>>>> - Included more documentation in the docs
>>>> v5 changes:
>>>> - Move GNTCOPY_* define next to the flags field
>>>> v4 changes:
>>>> - Used @keepindent/@endkeepindent doxygen commands
>>>> to keep text with spaces indentation.
>>>> - drop changes to grant_entry_v1 comment, it will
>>>> be changed and included in the docs in a future patch
>>>> - Move docs .rst to "common" folder
>>>> v3 changes:
>>>> - removed tags to skip anonymous union/struct
>>>> - moved back comment pointed out by Jan
>>>> - moved down defines related to struct gnttab_copy
>>>> as pointed out by Jan
>>>> v2 changes:
>>>> - Revert back to anonymous union/struct
>>>> - add doxygen tags to skip anonymous union/struct
>>>> ---
>>>> docs/hypercall-interfaces/arm64.rst           |   1 +
>>>> .../common/grant_tables.rst                   |   9 +
>>>=20
>>> In patch 8 you now add arm32.rst and x86.rst as well, so it's at
>>> least odd that here you alter only one of the three. However, ...
>>>=20
>>>> --- a/docs/hypercall-interfaces/arm64.rst
>>>> +++ b/docs/hypercall-interfaces/arm64.rst
>>>> @@ -8,6 +8,7 @@ Starting points
>>>> .. toctree::
>>>>   :maxdepth: 2
>>>>=20
>>>> +   common/grant_tables
>>>=20
>>> ... to me this seems the wrong way round anyway: I'd rather see
>>> common stuff not be linked from per-arch locations, but per-arch
>>> docs to be down the hierarchy from common ones.
>>=20
>> The things is that common stuff is not really common, if you go and solv=
e every
>> define and so on, you end up with a different content for x86, aarch64, =
arm.
>>=20
>> So you can=E2=80=99t have a common.rst containing the common things beca=
use depending on each
>> platform the content will change.
>=20

Hi Jan,

> Wait - the documentation should be uniform for all architectures.
> If there are architecture specific aspects, then these should imo
> still be mentioned in the common section of the doc, just pointing
> out what those specifics are for which architectures. Architecture
> specific doc pieces ought to cover architecture specific hypercalls
> or sub-functions of common ones.
>=20

Yes that could be a point, to be honest this patch was mainly used to colle=
ct as many feedbacks as possible
and it worked, maybe we can talk about that in the Xen call to see if we ag=
ree on a documentation structure.

For now this work was aimed to reproduce the actual documentation:

https://xenbits.xenproject.org/docs/unstable/hypercall/index.html

Cheers,

Luca

> Jan
>=20


