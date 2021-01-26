Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B541303B54
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:18:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74884.134650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MM3-0002wC-C4; Tue, 26 Jan 2021 11:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74884.134650; Tue, 26 Jan 2021 11:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MM3-0002vp-7p; Tue, 26 Jan 2021 11:17:51 +0000
Received: by outflank-mailman (input) for mailman id 74884;
 Tue, 26 Jan 2021 11:17:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=55K9=G5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l4MM0-0002vj-Tv
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:17:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d94751c-2d7c-441b-96ab-761636f165e5;
 Tue, 26 Jan 2021 11:17:47 +0000 (UTC)
Received: from DB6PR0801CA0066.eurprd08.prod.outlook.com (2603:10a6:4:2b::34)
 by VE1PR08MB5229.eurprd08.prod.outlook.com (2603:10a6:802:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Tue, 26 Jan
 2021 11:17:43 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::a3) by DB6PR0801CA0066.outlook.office365.com
 (2603:10a6:4:2b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Tue, 26 Jan 2021 11:17:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 11:17:43 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Tue, 26 Jan 2021 11:17:43 +0000
Received: from 6524db42a94f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 21806255-57EE-471C-9206-3129BAD4B8DD.1; 
 Tue, 26 Jan 2021 11:17:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6524db42a94f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jan 2021 11:17:37 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3792.eurprd08.prod.outlook.com (2603:10a6:803:bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14; Tue, 26 Jan
 2021 11:17:35 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 11:17:35 +0000
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
X-Inumbo-ID: 6d94751c-2d7c-441b-96ab-761636f165e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+KAi+zGfpbgeFaHfnmZpWrNp5C+JaDdPMeXy06yDU4=;
 b=pPLCliu60R69JYki/lzxniVU+5bOgiP1QIDtd8gS5bdqQUUqv0OlG9eUrjIef52jZT85IN0w4/AWQjkMTph4W25hni9o1w9LQikc9uR5Clvg/7LPIMCryf57Fu4d06aqwi51lMIzim9GmeyagfxRRIMiPTDrw4YfNDOO02xFfQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2937bab51bf12931
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cc0DNY0D5usa90l1jSaTvGr2cvnJCiJDVgtMH3lzHAmHqRHfFnfhSloNdbLszQy2u1r89umjwF6zNhoYsc74uHI3cVaZFGhkX0lNL9Qeo8AGVQn6R3oFczFsaNkaqos0usWBrtLBTURlzSBYBe4Yrm28QYv/jyKQvYu0IzZN2By4tM/2HsvO5lgL4dW65caGOKdP0wT0EruWALscKauf8ks/EDo5/Fw+SkMVPJ5x6uTBgN7XSQQCFwNEO5GSHkIOGEPnMJ9/yKzLLim0YLTxEihwsuvTR+mTeGWMQaOruwUF1D7Mr7N47rOt2rGvq/Q+sagP7woEyI2n/3EM6jYvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+KAi+zGfpbgeFaHfnmZpWrNp5C+JaDdPMeXy06yDU4=;
 b=nxcPUfd/2vKbWeniK216nG23yttwq/hsGP58XlA/EtXGaB3x7BSpC8yimKrVVd9CiT48smTTvgaH+mQsvksWuG0h5NuKPmyjm5CF0lnoBX370wKVLzKPmW8gGxM2QGCIBWRk4bcfDk2GmCMfdgDvYKkIpeIjr/w20U32uGVQMStS/j91QxOAxu6NHrObpIxZlgXiUO0zl5P/WRCi/xBxwKYlvIUOaamot+ZVSJn+Hpiz7oyThrmYA0YuXT+REU3ONbLHdvnwR+5maawrTHfiEnySLdc7nFXySCFisIn7REXFDhBMTK/Ww5rH5gfGE0PWBIN1axaDZAvOGQoapVyriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+KAi+zGfpbgeFaHfnmZpWrNp5C+JaDdPMeXy06yDU4=;
 b=pPLCliu60R69JYki/lzxniVU+5bOgiP1QIDtd8gS5bdqQUUqv0OlG9eUrjIef52jZT85IN0w4/AWQjkMTph4W25hni9o1w9LQikc9uR5Clvg/7LPIMCryf57Fu4d06aqwi51lMIzim9GmeyagfxRRIMiPTDrw4YfNDOO02xFfQk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Topic: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
Thread-Index: AQHW82EN9R2ynrmbqk6EAVX0Oyalkao5otWAgAAc8QCAAAFygIAAAbYA
Date: Tue, 26 Jan 2021 11:17:35 +0000
Message-ID: <5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
 <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
 <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
In-Reply-To: <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23233bd8-b16b-4cc7-41a0-08d8c1ec003b
x-ms-traffictypediagnostic: VI1PR08MB3792:|VE1PR08MB5229:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5229E5C70671FD9FC0E122879DBC0@VE1PR08MB5229.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YQ12AdsKs4cR9sHAkF0YRizGyVnKKtLfwcL/qxTLccQmlnSt3BlnjwcK3FceYmQrhnDbepZbS+rGqhht8KwXPD2VeLC3qu7042n1WTwv//V59C4fmTQB7EzLHm2lZjXegVtHbepVLr9QI950XStdDGtgkEh7i/4m7p53aWrUSBveg0tbhrFYzgiX1w/hRyoDkZYp+9wx5qWcjlIlU2OajCcAJRl/AI9XRC1QBgdSbMtVr4irni7s2AjZAIQwfPglQoskmZSZ+7qqErSCcdBr9GC0KG9NTxUzl/ORDySAL3LS/yUHqyd2ut4XlcaWTfTy/XaZ/a1JYHAi6m+mulUUSXQSAvbZkAEzkZ0l3gwPCMxcYNMwfex8QpDeSTjn44YdkMjwngpoz3TAcKxLtG33zcuvdTU7D9ZeHUBUbcHIWwdlTdni5gquUX274U89FNOxKYOqYtsJQ5X3A5FsByqjBITMx+z5XmML0B6GEXWKf5BkFaXad6b0aCWLHw0b9J7Lr26L6WGFTapnUYsiWYGsNiriOQCwzztdZeePBUvkkrCAuUPIVHZRZLqpe5AfeGaHSVjcwEljc/NcY+xvbB47eQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(26005)(4326008)(36756003)(2906002)(71200400001)(33656002)(8936002)(6486002)(66946007)(6506007)(54906003)(186003)(91956017)(66556008)(53546011)(64756008)(55236004)(2616005)(6512007)(5660300002)(8676002)(316002)(83380400001)(66446008)(478600001)(76116006)(86362001)(6916009)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?VHJWMDRQRnhhajNmeWY2dmVsZ3VnUEVaS0tndEFYa2pCR3BkOHdkTm5hczdo?=
 =?utf-8?B?VG82Q3RoVkdub0E2U2thMk1mUGI3NlBqRm1wWFordmhwaU8yU3VERmg0dWlM?=
 =?utf-8?B?eURxQXJYTVQvUVRvVGUvcjNxdmNjaEFZcW44VTFvcFJESjN3QmVjdDJJUG9z?=
 =?utf-8?B?OEJzUU5BYVNVU01RRlZUZnNmZDUzbW00WFI5SW9Dc0VkVjQwZlZqcWFiUDk2?=
 =?utf-8?B?d2Ywb2ppQUJKVGtLQi94OTAzL3FkRGNYcngzWHJzR2pKSnRMVW52TjVSM2hL?=
 =?utf-8?B?Q2laRkRlS3Z6dHZudEd5ZlVuN0VlMXlsMWlsdk1GclExNFdvOXhhRWswVXEr?=
 =?utf-8?B?WldkdmtwVFYvR3E1SXVHQzlpbzIrWDkvWUEvYjNBcCtlRnZKTEtRL2JBdU5R?=
 =?utf-8?B?c2tEcFlSR1lMZGt3NzQxSFFkTEJsK2pXSnhjRk1OdGM1cERiVHN2eDN3amEw?=
 =?utf-8?B?SFdEN2FXamdFN3FCdjJsSG1FWnB0YllYVlBEK1ZGSjFYNXRjUFlsNmZZMTN6?=
 =?utf-8?B?bkdpa094Z0dxQXVJdjZzOVM0amh0YzNzWlprZG0wejZXUFliTlZrMkhnWHJX?=
 =?utf-8?B?NUprTzFOcWhMU3l0OEhUQlVwcHpUS2kwQkZIL0tranRUVGRGeHdJRm1NeFVH?=
 =?utf-8?B?UGxsR2t5L3hHbFlLQitLSi95VFpveUc2NmdQWGVFNkIyam0xSEhVM3cyc0hk?=
 =?utf-8?B?NC8xc2ZEZGxub3ZUdDcxcnBQWjIvdHptQkJQaGdXYUtrbmpMcVI3TnZXRUFi?=
 =?utf-8?B?MkFlU1d2T1VlVHA2Njh6OXp2U3hwWUd5a3VXamlFK0VEOWg3QTFXUHFvbzhu?=
 =?utf-8?B?OUN6Zys3OTQzcHhPcHQyUk9RRWYyZkhYZHU0dnppTHl6dFhBcmFUa3NHTW5v?=
 =?utf-8?B?cTl0VDhGa2psMEFzNWZNSEdFVG95aHFjN2M2QUtoWWhVWkpWZjBkUzNkZDVj?=
 =?utf-8?B?dnRtWnZlb1dBL05vYkFOdit0dS9UNGZ2eEJtZUtSTWt6aHM0NEY4RDVHQ2NZ?=
 =?utf-8?B?VHZqSWpsRlRmYXUzNnBBclRDQlhQN01pSGJpd3JVU3c5cTJuczhCRExzakY5?=
 =?utf-8?B?TXZsNEI2TGsxNFRCd00zYlRiS3VXMllzSlcxOTd5OWdUeWVSYU1BUGVHbWVX?=
 =?utf-8?B?bWlheXZ3dDdUUi83dHM0NEswNkM1Y2NZMFhkenV4VXd0cTlDNGt2RlVTbVhT?=
 =?utf-8?B?cEorekdFZ3BtcEx0MEpYcytrc0NGTlpLRlhMWEdoVnBEdzNCVnkzRk1wY0dC?=
 =?utf-8?B?RHVKY1lOSllSMmVVbURqWFhxY0Z6TENEQnp1MVBqSW4vZ0JKemY3RzlWK0ph?=
 =?utf-8?B?Ym5DSEU0Titqdy9zZm9KUzNtUEpVM0NIZFIvQVhTaU1OUGRjTzZwbFBjN0I4?=
 =?utf-8?B?UERGeE16MlM5RkQ5ZDlNdHg3aXJHRFJDUEZsdWkvM3orMlBTYWEzdzJwNmlG?=
 =?utf-8?Q?IbluJn8t?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C58A94140BED142857252B7D05B777A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3792
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b4afef5-65ca-4ded-5365-08d8c1ebfb8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/z0sObGK00zHwjWRl2kREZEs45oDq7jkLi/hxHxOFqySbx1gfEB7TZfNj/1TD5CrIRONtVLs6RD71/oYBHX0N/TfCHSlrMsfOysIFidw2q1W+cfmKGDR0CVDCziYcHXs9pn7Dd0nUfJb3kNin5QaMgrOczBgzyVI17ZaY9iDITDR7OYHg3aiyAi0ZpH02SigyfSh/9IUDMNtET/lMrksIW2+YKDyohrE4KZaU4BI59s2Yc790TN8dAdGCJ7iRflINzbdjU3yoLl5PalCO0FSrt1ZwzPBC39VESWqwQpXk4Pmx5bC26+wsYQIY/EkgxDY3ijpgMsRVWWzxTfBzBRAPyVq2+aNJKiWdkq30ORw4nxPyc3KQRabCeW8PDQOeJ9fLBWSAgegAEXSdR/k7VmKNZD9soDvEZmACo46f+TCvVEOr1X31pgk1EKpzOyyPkRcnCiIbhoGU8rRskyuMPBmJw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(346002)(396003)(46966006)(26005)(186003)(86362001)(82310400003)(8676002)(33656002)(53546011)(55236004)(6506007)(54906003)(36756003)(47076005)(6862004)(5660300002)(316002)(2906002)(81166007)(4326008)(70206006)(6486002)(336012)(70586007)(478600001)(8936002)(2616005)(6512007)(356005)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:17:43.3171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23233bd8-b16b-4cc7-41a0-08d8c1ec003b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5229

DQoNCj4gT24gMjYgSmFuIDIwMjEsIGF0IDExOjExLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjYuMDEuMjAyMSAxMjowNiwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+PiBPbiAyNiBKYW4gMjAyMSwgYXQgMDk6MjIsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjUuMDEuMjAyMSAyMjoyNywgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBAQCAtNzcsNyArNzcsNyBAQCBjb25maWcgU0JTQV9WVUFS
VF9DT05TT0xFDQo+Pj4+IAkgIFNCU0EgR2VuZXJpYyBVQVJUIGltcGxlbWVudHMgYSBzdWJzZXQg
b2YgQVJNIFBMMDExIFVBUlQuDQo+Pj4+IA0KPj4+PiBjb25maWcgQVJNX1NTQkQNCj4+Pj4gLQli
b29sICJTcGVjdWxhdGl2ZSBTdG9yZSBCeXBhc3MgRGlzYWJsZSIgaWYgRVhQRVJUDQo+Pj4+ICsJ
Ym9vbCAiU3BlY3VsYXRpdmUgU3RvcmUgQnlwYXNzIERpc2FibGUgKFVOU1VQUE9SVEVEKSIgaWYg
VU5TVVBQT1JURUQNCj4+Pj4gCWRlcGVuZHMgb24gSEFTX0FMVEVSTkFUSVZFDQo+Pj4+IAlkZWZh
dWx0IHkNCj4+Pj4gCWhlbHANCj4+Pj4gQEAgLTg3LDcgKzg3LDcgQEAgY29uZmlnIEFSTV9TU0JE
DQo+Pj4+IAkgIElmIHVuc3VyZSwgc2F5IFkuDQo+Pj4+IA0KPj4+PiBjb25maWcgSEFSREVOX0JS
QU5DSF9QUkVESUNUT1INCj4+Pj4gLQlib29sICJIYXJkZW4gdGhlIGJyYW5jaCBwcmVkaWN0b3Ig
YWdhaW5zdCBhbGlhc2luZyBhdHRhY2tzIiBpZiBFWFBFUlQNCj4+Pj4gKwlib29sICJIYXJkZW4g
dGhlIGJyYW5jaCBwcmVkaWN0b3IgYWdhaW5zdCBhbGlhc2luZyBhdHRhY2tzIChVTlNVUFBPUlRF
RCkiIGlmIFVOU1VQUE9SVEVEDQo+Pj4+IAlkZWZhdWx0IHkNCj4+Pj4gCWhlbHANCj4+Pj4gCSAg
U3BlY3VsYXRpb24gYXR0YWNrcyBhZ2FpbnN0IHNvbWUgaGlnaC1wZXJmb3JtYW5jZSBwcm9jZXNz
b3JzIHJlbHkgb24NCj4+PiANCj4+PiBCb3RoIG9mIHRoZXNlIGRlZmF1bHQgdG8geSBhbmQgaGF2
ZSB0aGVpciBfcHJvbXB0Xw0KPj4+IGNvbmRpdGlvbmFsIHVwb24gRVhQRVJULiBXaGljaCBtZWFu
cyBvbmx5IGFuIGV4cGVydCBjYW4gdHVybiB0aGVtDQo+Pj4gX29mZl8uIFdoaWNoIGRvZXNuJ3Qg
bWFrZSBpdCBsb29rIGxpa2UgdGhlc2UgYXJlIHVuc3VwcG9ydGVkPyBPcg0KPj4+IGlmIGFueXRo
aW5nLCB0dXJuaW5nIHRoZW0gb2ZmIGlzIHVuc3VwcG9ydGVkPw0KPj4gDQo+PiAuLi5Zb3UgY291
bGQgc2VlIHRoYXQgYXMgRVhQRVJUL1VOU1VQUE9SVEVEIG9wdGlvbnMgY2FuIG9ubHkgYmUNCj4+
IOKAnG1vZGlmaWVk4oCdIGZyb20gdGhlaXIgZGVmYXVsdCB2YWx1ZSBpZiBFWFBFUlQvVU5TVVBQ
T1JURUQgaXMgYWN0aXZhdGVkLg0KPiANCj4gQnV0IHRoaXMgaXMgbm90aGluZyB5b3UgY2FuIHJl
Y29nbml6ZSB3aGVuIGNvbmZpZ3VyaW5nIFhlbg0KPiAoaS5lLiBzZWVpbmcganVzdCB0aGVzZSBw
cm9tcHRzKS4NCg0KTWF5YmUgc29tZXRoaW5nIHdlIGNvdWxkIGV4cGxhaW4gbW9yZSBjbGVhcmx5
IGluIHRoZSBVTlNVUFBPUlRFRC9FWFBFUlQNCmNvbmZpZyBwYXJhbWV0ZXJzIGluc3RlYWQgPw0K
V2UgY291bGQgYWxzbyBtYWtlIHRoYXQgbW9yZSBjbGVhciBpbiB0aGUgaGVscCBvZiBzdWNoIHBh
cmFtZXRlcnMgZGlyZWN0bHkuDQoNCkkgZG8gbm90IHNlZSBob3cgd2UgY291bGQgbWFrZSB0aGF0
IG1vcmUgY2xlYXIgZGlyZWN0bHkgaW4gdGhlIHByb21wdCAoYXMNCm1ha2luZyBpdCB0b28gbG9u
ZyBpcyBub3QgYSBnb29kIHNvbHV0aW9uKS4NCg0KPiANCj4+IElmIHRoaXMgaXMgYSBwcm9ibGVt
IHdlIGNvdWxkIGFsc28gY2hhbmdlIHRob3NlIG9wdGlvbnMgdG8gYmUgZGVmYXVsdA0KPj4gdG8g
X29mZl8gYnkgcmVuYW1pbmcgdGhlbSB0byBjb25maWcgRElTQUJMRV94eHh4DQo+IA0KPiBZZXMs
IHRoaXMgd291bGQgYmUgYSBwb3NzaWJpbGl0eSwgYWxiZWl0IG5vdCBuZWNlc3NhcmlseQ0KPiBv
bmUgSSB3b3VsZCBsaWtlLg0KDQpUaGlzIGlzIG5vdCBvbmUgSSB3b3VsZCBsaWtlIGVpdGhlci4N
Cg0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQoNCg==

