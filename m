Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E550564C9AE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 14:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462197.720375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RSE-0003pb-Iz; Wed, 14 Dec 2022 13:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462197.720375; Wed, 14 Dec 2022 13:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5RSE-0003nS-G2; Wed, 14 Dec 2022 13:05:46 +0000
Received: by outflank-mailman (input) for mailman id 462197;
 Wed, 14 Dec 2022 13:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=30QF=4M=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p5RSC-0003nL-QT
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 13:05:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0379fa50-7bb0-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 14:05:42 +0100 (CET)
Received: from DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) by AM8PR08MB6387.eurprd08.prod.outlook.com
 (2603:10a6:20b:365::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Wed, 14 Dec
 2022 13:05:40 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::26) by DUZPR01CA0030.outlook.office365.com
 (2603:10a6:10:46b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11 via Frontend
 Transport; Wed, 14 Dec 2022 13:05:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11 via Frontend Transport; Wed, 14 Dec 2022 13:05:39 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 14 Dec 2022 13:05:39 +0000
Received: from 630cba18130b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3782856D-F611-4611-830E-B5E879A6D0F4.1; 
 Wed, 14 Dec 2022 13:05:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 630cba18130b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Dec 2022 13:05:33 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AS4PR08MB8143.eurprd08.prod.outlook.com (2603:10a6:20b:58e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 13:05:31 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 13:05:31 +0000
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
X-Inumbo-ID: 0379fa50-7bb0-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6YVIzXAdWYl1WfnZmFRCLHY+VSeKqRRz09tcxlaUbU=;
 b=h07mYWsPEpQT4atn5uVsG+x+rpSuwN66yGJHBcYjEP6y5AYeUQdEzBZMhm9Zag3Gxk7e4kFtAsE+lApD3ZdC4s/xjC2jL5ujPlOaXI+y19n4riMFVkR/L4X4dDzkwA387WkwLHm/bZ0I3fMp2yaxTi0KLtvGBl+S01cg8owN0Jg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4ca6c30109bceba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSHL8EVARhZnqm7g9PusM0R/brvB20kDRfCjKQURCMag3uvmofViCO/F/nWQGShQDp2qHg5De0Ein8JNnAO5tCSEKRbnhpzvogJY120kIk7fOVmfAUd31un4nPl8oi3LSx53seOLVTU37KWD0zIA+govpNl/l869j+EolEhEiiK7BJ5kshM+dbKYsao4DhImowOyQHESBYg8gUMHaoEUAdblxe3Kq0GrXL3BkX9ollH4CRqhB/upWzrU126CyQUZJ/QyAFWDqoFACvn6tb7dnI0lVIOj4C6U9fyx0FwYYJiDHiz+6c+/IUMNteG3KHW/+k/jH0iHy/PSkpLp/n7x8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6YVIzXAdWYl1WfnZmFRCLHY+VSeKqRRz09tcxlaUbU=;
 b=HPrrRJeLc/DPQuANbPEnpzcdR/NfNgWkvBb6HyzMCVPoY39mu0LP8WNe7JRMvc9jYAnnujDsz/lWk3ZXMxNdfXh6+ah/W1tdMsnhk2MV3jTkH2BV2z9LjiDvOVn+955LTXvBbIM0gW3cIy0KsPpgVJwX5A24S+5cL6gq9yJ0eD2reOjCAcdfbMBKoSxRJcZA+AuWimC/E204VALiZbbL6d+HrIB/yKXSs7x13955XUKFVnOpw8QKxR6HX9gMCHQPYy4asu2f3DKJPZopMj4aVg+6AOP2aQB99sWJMg1L7y/4RfAW/iR2kek3bZtfw7HX7bFwKHzKBKCMeVTTwgA3NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6YVIzXAdWYl1WfnZmFRCLHY+VSeKqRRz09tcxlaUbU=;
 b=h07mYWsPEpQT4atn5uVsG+x+rpSuwN66yGJHBcYjEP6y5AYeUQdEzBZMhm9Zag3Gxk7e4kFtAsE+lApD3ZdC4s/xjC2jL5ujPlOaXI+y19n4riMFVkR/L4X4dDzkwA387WkwLHm/bZ0I3fMp2yaxTi0KLtvGBl+S01cg8owN0Jg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: sisyphean <sisyphean@zlw.email>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Thread-Topic: [BUG]Add PCIE devie to SMMUv3 fail
Thread-Index: AQHZC5XCObk04ipFEE+2cKVjhEnU1a5lUAQAgARztoCAALM7gIAAk3WAgAJX2gA=
Date: Wed, 14 Dec 2022 13:05:30 +0000
Message-ID: <9478D04C-9BD6-44C1-ADBD-EAA688897811@arm.com>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
 <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
 <5BCFEC7E-85B6-4464-A2B1-EA08C6E2EB20@arm.com>
 <340463d2-528e-848f-0ec2-a4cc7ba04399@zlw.email>
In-Reply-To: <340463d2-528e-848f-0ec2-a4cc7ba04399@zlw.email>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AS4PR08MB8143:EE_|DBAEUR03FT007:EE_|AM8PR08MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: a202b76d-2439-494e-8007-08daddd3e668
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6bRhe/cxGaVy6LBC0xYVz2Ox0zdILCGB0mUk5kZJwNl561/ic8scuoJpwEx951fjbLXD80U5LkC6AMeP6L8mcBxhRJx7EJigMke3H57ftvPadRY7zS78LzpLN1xgbLlTZBy9JO52P62di1f3D/9o0zSTtacuGdvBIvK3p3oQoQZTpPLpFAOmCQOYr483o7G/xNL2jzEf4YqxXjrTpxVKgspVtLkN6ij7YMfzXfhf+YCyqaHWFQJugjBFv883tGVo03/vAcSA9Ovf3ctp7lZ/EeikQLom2mdaLESV6zSsF0lM+uWMP945+5Ti9tD3ZQxbD800+xPP5ehrECuDBIWcaXv2wUxmyTewhUf8wADE/EIAoGHhgVXTB7pJ8jKGFVgMnuFXfctXEb0Ntx8jwg3SOEhURdFpdgy9FgjxUZbT3T+m+iBllBCIMONHRKzeG9jKs82zJHc4DxdTFOFdeiusAxaCgeC/NX9zphu/U0Rfvi3Bpujml/Ns/fnqoxBNSTKPR0vA91ZjP2IwQqG5OpWvYpLa1Uv8r+wzHOpmjcDPAgi2KgDjKudH2thjFHszmEXWMkMPoecLEAh8EGmBnmp8Q6f634afJbLJTvACgWs7BIfmbNHS6uD+aiwpHkhkFgw+9LS5LNe0sahyixkcnoJr3I/9avYtmgmZc6uWzcEqdiTW+DO6F1u+XQSmiZWwQjgolHKfBMm03WKL0P3Hm7MEibMgtrvBvDQfLIyxd+fM08lZxmwYwp7O5wXdKXIGZEzvPmBijYWhHLjiB6llCCDqFWcbs+VAK1F/HKC14p4LwavEQ3k2wrVcq0VozqSobiom
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199015)(83380400001)(5660300002)(8936002)(2906002)(41300700001)(86362001)(38070700005)(36756003)(33656002)(38100700002)(122000001)(966005)(6486002)(316002)(71200400001)(26005)(478600001)(6512007)(6916009)(54906003)(8676002)(66446008)(53546011)(64756008)(66556008)(91956017)(66946007)(4326008)(66476007)(2616005)(76116006)(6506007)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCC770758D149748A1E305B39FFCB2D2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8143
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e4af815-83eb-4186-5075-08daddd3e112
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6SSFkmBwcBE2a6wWhYhg1Y1t3kRSQB2VbWx1Q3dJEXavR+c0rnaeagXLxvDrF7cFbf+oG2uuj1nnUeb42A+/Y1ujxiSPcEgUWRrkwURWHFir1uCYjwTdnxDq9yGI8nddYhwgbVZFl2w+cg9Xm3aL5gx7mZvSO7kWc27WLYoULYzNPbLg9wTDVCw+7IrEeO5a8RSsTfSVPFfCkduDiT5Y0Wxn3Pqd7qkOZCX6N+56uSKyqetfxTqaUzwBSf6TXoYhGzxVPjf3FcXwbHrq8xouW73Un9+CWApIrmxb5gFbwhoKuZ7Eia/squ1PnOQWTCXIG6EjzhmPmtB8426Awq8evL5Frr+02Kh/JP0jtna8o2hKWcvpyfU72sghLn3VMLfM70tTJmmWQzNnzZqhdQpivQWzG3IRF1RNCiRhoWYfT+7q8KlgOqtN+eMUh+b7aD3LyKHpG0hH5h0X1a6DJVgRiqxmPmQ2N9c1wktQ76Zf0NntdZGokfFud/2tNe4Zfx1/CiV50DYlAHVAQ/FBEkaq7gP2YTncY6lTViblBxOLzcuBjmk3CZEKZMl3vXTedofK7C+KAwQ3x6Y8DDzYB2RndxNE5s6CqX2ETIwQcKeresoPQxSFw/R94Q67fDfR5Cel29X0tk7QDjzdO3yoYpZ+L1Te0M5lnv3DUBseLcMPVlCMoDqEkhvESeVws8tGYg9YVCeXyo0wMleLWXn87Ws36ux/LY3PiYveb4naAuGYxi8kMjBEx5EIi2K6lVlxMxsXl5K6VaNEB0H7CLTaxEdiTw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(54906003)(40480700001)(6512007)(316002)(53546011)(6486002)(186003)(6506007)(83380400001)(26005)(33656002)(86362001)(966005)(40460700003)(70206006)(36860700001)(4326008)(8676002)(70586007)(47076005)(2906002)(2616005)(336012)(41300700001)(356005)(478600001)(6862004)(5660300002)(8936002)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 13:05:39.9636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a202b76d-2439-494e-8007-08daddd3e668
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6387

SGkgU2lzcGhlYW4sDQoNCj4gT24gMTMgRGVjIDIwMjIsIGF0IDE6MTggYW0sIHNpc3lwaGVhbiA8
c2lzeXBoZWFuQHpsdy5lbWFpbD4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IOWcqCAyMDIyLzEy
LzEzIDAwOjMwLCBSYWh1bCBTaW5naCDlhpnpgZM6DQo+PiBIaSBTaXN5cGhlYW4sDQo+PiANCj4+
PiBPbiAxMiBEZWMgMjAyMiwgYXQgNTo0OSBhbSwgc2lzeXBoZWFuIDxzaXN5cGhlYW5Aemx3LmVt
YWlsPiB3cm90ZToNCj4+PiANCj4+PiBIaSwNCj4+PiDlnKggMjAyMi8xMi85IDE3OjUwLCBSYWh1
bCBTaW5naCDlhpnpgZM6DQo+Pj4+IEhpIFNpc3lwaGVhbiwNCj4+Pj4gDQo+Pj4+PiBPbiA5IERl
YyAyMDIyLCBhdCA2OjE1IGFtLCBzaXN5cGhlYW4gPHNpc3lwaGVhbkB6bHcuZW1haWw+IHdyb3Rl
Og0KPj4+Pj4gDQo+Pj4+PiBIaSwNCj4+Pj4+IA0KPj4+Pj4gSSB0cnkgdG8gcnVuIFhFTiBvbiBt
eSBBUk0gYm9hcmQoU29ycnksIGZvciBzb21lIGNvbW1lcmNpYWwgcmVhc29ucywgSSBjYW4ndCB0
ZWxsIHlvdQ0KPj4+Pj4gb24gd2hpY2ggcGxhdGZvcm0gSSBydW4gWEVOKSAgYW5kIGFkZCBQQ0lF
IGRldmljZSBwYXNzdGhyb3VnaCB0byBEb21VLkJ1dCBhbiBlcnJvcg0KPj4+Pj4gb2NjdXJyZWQg
d2hpbGUgYWRkaW5nIHRoZSBQQ0lFIGRldmljZSB0byBTTU1VdjMuDQo+Pj4+IFBDSSBwYXNzdGhy
b3VnaCBzdXBwb3J0IGlzIG5vdCBmdWxseSB1cHN0cmVhbSB0byBYZW4gb24gQVJNLiBXZSBoYXZl
IHdvcmtpbmcNCj4+Pj4gUENJIHBhc3N0aHJvdWdoIGJyYW5jaCB0aGF0IHlvdSBjYW4gdXNlIHRv
IHRlc3QgaXQuDQo+Pj4+IA0KPj4+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvZnVz
YS94ZW4taW50ZWdyYXRpb24vLS9jb21taXRzL2ludGVncmF0aW9uL3BjaS1wYXNzdGhyb3VnaA0K
Pj4+PiANCj4+Pj4+IFRocm91Z2ggcmVhZGluZyB0aGUgY29kZSBhbmQgdHJhY2luZyBkZWJ1Z2dp
bmcsIHRoZSBlcnJvciBpcyBmb3VuZCBpbiB0aGUgZnVuY3Rpb24NCj4+Pj4+IGFybV9zbW11X2Fk
ZF9kZXZpY2UsIHdoaWNoIHdpbGwgb2J0YWluIGFuZCBkZXRlcm1pbmUgd2hldGhlciB0aGUgZndz
cGVjIG9mIHRoZQ0KPj4+Pj4gZGV2aWNlIHRvIGJlIGFkZGVkIHRvIFNNTVUgZXhpc3RzLkJ1dCBm
b3IgdGhlIFhFTiBvZiBhcm0sIHRoZSBmd3NwZWMgb2YgdGhlIGRldmljZSBpcw0KPj4+Pj4gY3Jl
YXRlZCBhbmQgYWRkZWQgYnkganVkZ2luZyB3aGV0aGVyIHRoZSBpb21tdSBmaWVsZCBleGlzdHMg
aW4gdGhlIGRldmljZSBub2RlIHdoZW4NCj4+Pj4+IFhFTiBwYXJzZXMgdGhlIGRldmljZSB0cmVl
Lkhvd2V2ZXIsIHRoZSBQQ0lFIGRldmljZSBkb2VzIG5vdCBhcHBlYXIgaW4gdGhlIGRldmljZSB0
cmVlLA0KPj4+Pj4gc28gdGhlcmUgd2lsbCBiZSBubyBmd3NwZWMgZm9yIGFsbCBQQ0lFIGRldmlj
ZXMuIFdoZW4gYXR0ZW1wdGluZyB0byBhZGQgYSBQQ0lFIGRldmljZSB0bw0KPj4+Pj4gU01NVSwg
YSBFTk9ERVYgZXJyb3Igd2lsbCBiZSByZXR1cm5lZC4NCj4+Pj4gQXMgb2Ygbm93IFhlbiBkb2Vz
buKAmXQgc3VwcG9ydCB0byBhZGQgUENJIGRldmljZSB0byBJT01NVSBvbiBBUk0uDQo+Pj4+PiBJ
biBhZGRpdGlvbiwgdGhlIGNvZGUgYXQgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYWxz
byB2ZXJpZmllcyB0aGUgYWJvdmUgdmlldy4NCj4+Pj4+IEZvciBQQ0lFIGRldmljZXMsIHBkZXYg
aXMgYWxsb2MgaW4gZnVuY3Rpb24gcGNpX2FkZF9kZXZpY2UgYnkgYWxsb2NfcGRldi5Ib3dldmVy
LA0KPj4+Pj4gdGhlIGZ1bmN0aW9uIGFsbG9jX3BkZXYgZG9lcyBub3QgY3JlYXRlIGFuZCBhZGQg
ZndzcGVjIHRvIHRoZSBQQ0lFIGRldmljZS5UaGVyZWZvcmUsDQo+Pj4+PiB3aGVuIGZ1bmN0aW9u
IHBjaV9hZGRfZGV2aWNlIGV4ZWN1dGVzIHRvIGlvbW11X2FkZF9kZXZpY2UsaXQgd2lsbCBnZXQg
dGhlIGVycm9yDQo+Pj4+PiByZXR1cm4gb2YgRU5PREVWLg0KPj4+Pj4gDQo+Pj4+PiBIb3cgY2Fu
IEkgcmVzb2x2ZSB0aGUgYWJvdmUgZXJyb3JzPw0KPj4+PiBJZiB5b3Ugd2FudCB0byB0ZXN0IHRo
ZSBQQ0kgcGFzc3Rocm91Z2ggcGxlYXNlIGZvbGxvdyBiZWxvdyBzdGVwcy4NCj4+Pj4gDQo+Pj4+
IFhlbiBzZXR1cDoNCj4+Pj4gICAgIOKAoiBBIGNoZWNrb3V0IG9mIHRoZSDigJxpbnRlZ3JhdGlv
bi9wY2ktcGFzc3Rocm91Z2jigJ0gYnJhbmNoIGZyb20gdGhlICBnaXRsYWIgaHR0cHM6Ly9naXRs
YWIuY29tL3hlbi1wcm9qZWN0L2Z1c2EveGVuLWludGVncmF0aW9uLy0vY29tbWl0cy9pbnRlZ3Jh
dGlvbi9wY2ktcGFzc3Rocm91Z2gNCj4+Pj4gICAgIOKAoiBQYXNzIGlvbW11PXllcyAgYW5kIHBj
aS1wYXNzdGhyb3VnaD1vbiB0byBYZW4gY29tbWFuZCBsaW5lIHRvIGVuYWJsZSBQQ0kgcGFzc3Ro
cm91Z2guDQo+Pj4+IA0KPj4+PiAgTGludXggS2VybmVsIHNldHVwOg0KPj4+PiAgICAgICDigKIg
U29tZSBjaGFuZ2VzIGFyZSByZXF1aXJlZCBmb3IgdGhlIGtlcm5lbCB0byB3b3JrIHdpdGggUENJ
IHBhc3N0aHJvdWdoLiBGaXJzdCBhcmUgc29tZSBjb25maWd1cmF0aW9uIG9wdGlvbnMsIGVuYWJs
ZSB0aGVtIGluIGtlcm5lbCBjb25maWcuDQo+Pj4+ICAgICAgICAgIENPTkZJR19YRU49eQ0KPj4+
PiAgICAgICAgICBDT05GSUdfWEVOX0JBQ0tFTkQ9eQ0KPj4+PiAgICAgICAgICBDT05GSUdfWEVO
X1BDSURFVl9CQUNLRU5EPXkNCj4+Pj4gICAgIOKAoiBUaGVuIGEgcGF0Y2ggbmVlZHMgdG8gYmUg
YXBwbGllZCBmb3IgZW5hYmxpbmcgdGhlIHBjaWJhY2sgZHJpdmVyLiBQYXRjaCBpcyBhdHRhY2hl
ZCBpbiB0aGlzIGVtYWlsLg0KPj4+PiAgVXNpbmcgUENJIHBhc3N0aHJvdWdoOg0KPj4+PiAgICAg
ICDigKIgSW4gb3JkZXIgdG8gcGFzcyBhIGRldmljZSB0byBhIGd1ZXN0LCB5b3UgZmlyc3QgbmVl
ZCBpdHMgUENJIGFkZHJlc3MoU0JERikuIFlvdSBjYW4gZWl0aGVyIGdldCBpdCBmcm9tIGEgYmFy
ZS1tZXRhbA0KPj4+PiAgICAgICBMaW51eCBydW5uaW5nIG9uIHRoZSBwbGF0Zm9ybSBvciBieSBo
YXZpbmcgcGNpdXRpbHMgIGluc3RhbGxlZCAoaWYgeW91IGFyZSB1c2luZyBhIHlvY3RvLWJhc2Vk
IGRvbTAgb3IgaGF2ZSBhcHQgYXZhaWxhYmxlKSwgd2hpY2ggcHJvdmlkZXMgbHNwY2kuDQo+Pj4+
ICAgICAgICBGb3IgZXhhbXBsZSwgbGV0J3MgcGFzcyBvbmUgZXRoZXJuZXQgaW50ZXJmYWNlIHRv
IHRoZSBndWVzdC4gUnVubmluZyBsc3BjaSBnaXZlcyB1cyB0aGlzIG91dHB1dCAodHJ1bmNhdGVk
KSA6DQo+Pj4+ICAgICAgICAwMDAwOjAwOjAwLjAgSG9zdCBicmlkZ2U6IEFtcGVyZSBDb21wdXRp
bmcsIExMQyBEZXZpY2UgZTEwMA0KPj4+PiAgICAgICAgMDAwMDowMDowMS4wIFBDSSBicmlkZ2U6
IEFtcGVyZSBDb21wdXRpbmcsIExMQyBEZXZpY2UgZTEwMSAocmV2IDA0KQ0KPj4+PiAgICAgICAg
MDAwMDowMTowMC4wIEV0aGVybmV0IGNvbnRyb2xsZXI6IEludGVsIENvcnBvcmF0aW9uIEV0aGVy
bmV0IENvbnRyb2xsZXIgWDcxMC9YNTU3LUFUIDEwR0JBU0UtVCAocmV2IDAxKQ0KPj4+PiAgICAg
ICAgICAgICAgICBbLi4uXQ0KPj4+PiAgICAgICAgV2Ugd2lsbCBwYXNzIG9uZSBvZiB0aGUgZXRo
ZXJuZXQgZnJvbSB0aGUgUENJIG5ldHdvcmsgY2FyZCA6IDAwMDA6MDE6MDAuMCAuDQo+Pj4+ICAg
ICAgIOKAoiBBZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHRoZSBndWVzdCBjb25maWd1cmF0aW9u
IGZpbGUgOg0KPj4+PiAgICAgICAgICAgcGNpID0gWycwMDAwOjAxOjAwLjAnXQ0KPj4+PiAgICAg
ICDigKIgUnVuIHRoZSBmb2xsb3dpbmcgY29tbWFuZCBiZWZvcmUgc3RhcnRpbmcgdGhlIGd1ZXN0
IDoNCj4+Pj4gICAgICAgICAgICB4bCBwY2ktYXNzaWduYWJsZS1hZGQgMDAwMDowMTowMC4wDQo+
Pj4+ICAgICDigKIgU3RhcnQgdGhlIGd1ZXN0LiBUaGUgbmV0d29yayBpbnRlcmZhY2Ugc2hvdWxk
IGFwcGVhciBhcyAwMDowMC4wICBpbiB0aGUgZ3Vlc3QgYW5kIGJlIHVzYWJsZS4NCj4+Pj4gIFBs
ZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGluZm8uDQo+Pj4+IA0KPj4+PiANCj4+
Pj4gDQo+Pj4+IFJlZ2FyZHMsDQo+Pj4+IFJhaHVsDQo+Pj4+IA0KPj4+IFRoYW5rIHlvdSBmb3Ig
eW91ciByZXBseS4NCj4+PiBBZnRlciBzZXR0aW5nIFhFTiBhbmQga2VybmVsIGFzIGFib3ZlLCBJ
IHRyaWVkIHRoZSBmb2xsb3dpbmcgdHdvIG1ldGhvZHMgdG8gYWRkIGEgUENJRSBkZXZpY2UgcGFz
c3Rocm91Z2g6DQo+Pj4gMS4gQWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdGlvbiwgdXNlIHRoZSBj
b21tYW5kIHhsIHBjaS1hc3NpZ25hYmxlLWFkZCAwMDAyOjIxOjAwLjAgdG8gc2V0IGluIHRoZSBE
b20wLiBCdXQgaW4gZnVuY3Rpb24NCj4+PiBpb21tdV9kb19wY2lfZG9tY3RsLCAgYWZ0ZXIgZGV2
aWNlX2Fzc2lnbmVkIGlzIGNhbGxlZCwgRU5PREVWIGVycm9yIGlzIG9idGFpbmVkLg0KPj4+IDIu
IEFkZCB4ZW4tcGNpYmFjay5oaWRlPSgwMDAyOjIxOjAwLjApIHRvIGRvbTAtYm9vdGFyZ3MgaW4g
dGhlIGRldmljZSB0cmVlLCBJIGVuY291bnRlcmVkIHRoZSBzYW1lIHByb2JsZW0gYXMgYmVmb3Jl
DQo+Pj4gd2hlbiBpbml0aWFsaXppbmcgdGhlIGtlcm5lbC4gSW4gZnVuY3Rpb24gcGNpX2FkZF9k
ZXZpY2UsIFBDSUUgZGV2aWNlcyBjYW5ub3QgYmUgYWRkZWQgdG8gU01NVXYzLg0KPj4gSXQgaXMg
aGFyZCB0byBmaW5kIHdoYXQgaXMgaGFwcGVuaW5nIHdpdGhvdXQgbG9ncy4gQ291bGQgeW91IHBs
ZWFzZSBzaGFyZSB0aGUgWGVuIGFuZCBMaW51eCBib290IGxvZ3Mgc28gdGhhdCBJIGNhbg0KPj4g
Y2hlY2sgd2hhdCBpcyB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzIGlzc3VlLg0KPj4gDQo+Pj4gVGhl
IGtlcm5lbCB2ZXJzaW9uIEkgdXNlIGlzIDUuMTAuIERvZXMgdGhpcyBoYXZlIGFuIGltcGFjdD8N
Cj4+IEkgYW0gdXNpbmcgdGhlIExpbnV4IHZlcnNpb24gNS4xNS40NCBidXQgSSBkb27igJl0IHRo
aW5rIGlzIGJlY2F1c2Ugb2YgTGludXguDQo+PiANCj4+IFJlZ2FyZHMsDQo+PiBSYWh1bA0KPiAN
Cj4gVGhlIGF0dGFjaG1lbnQgaXMgYSBsb2cgZmlsZS4gSSBoYXZlIHRvIGRlbGV0ZSBzb21lIGNv
bnRlbnQgdGhhdCBtYXkgaW52b2x2ZSBjb21tZXJjaWFsLiBQbGVhc2UgZm9yZ2l2ZSBtZS4NCj4g
DQo+IEluIGFkZGl0aW9uLCBJIGhhdmUgZm9yZ290dGVuIHRvIHRlbGwgeW91IGEgdmVyeSBpbXBv
cnRhbnQgaW5mb3JtYXRpb24uIFRoZSBQQ0lFIGNvbnRyb2xsZXIgdXNlZCBvbiBteSBib2FyZA0K
PiBpcyBEZXNpZ25XYXJlLiBJIHJlZmVycmVkIHRvIHRoZSBjb2RlIG9mIEVDQU0gdW5kZXIgWEVO
IGFuZCBhZGRlZCBzb21lIHN1cHBvcnQgcmVsYXRlZCB0byBEZXNpZ25XYXJlDQo+IChEQkkgc3Bh
Y2UgbWFwcGluZyBhbmQgUENJRSByZWFkL3dyaXRlKS4NCj4gDQoNCldoYXQgSSB1bmRlcnN0b29k
IGZyb20gdGhlIGxvZ3MgaXMgeW91IHNoYXJlZCB0aGUgbG9ncyBmb3IgZG9tVSBib290LiBDb3Vs
ZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhhdCBkb20wIGJvb3RlZA0KZmluZSB3aXRoIHRoZSBQQ0kg
cGFzc3Rocm91Z2ggYnJhbmNoIGFuZCB0aGUgUENJIGRldmljZSB5b3UgdHJ5aW5nIHRvIGFzc2ln
biB0byBkb21VIGlzIHdvcmtpbmcgZmluZSBpbiBkb20wLg0KDQpJbiB0aGF0IGNhc2Ugd2UgY2Fu
IGNvbmZpcm0gdGhhdCBjb2RlIHlvdSBhZGRlZCB0byBzdXBwb3J0IERlc2lnbldhcmUgUENJRSBj
b250cm9sbGVyIGlzIGZpbmUuDQoNCj4gSW4gYWRkaXRpb24sIGlmIG5lZWRlZCAsSSBjYW4gcHJl
IGluaXRpYWxpemVkIFBDSUUgY29udHJvbGxlciBpbiB0aGUgdWJvb3Qgc3RhZ2UsIHNvICBJIGNh
biBzY2FuIHRoZSBQQ0lFIGRldmljZQ0KPiBpbiB0aGUgdWJvb3QgY29tbWFuZCBsaW5lLg0KDQpZ
ZXMsIHdlIGNhbiB0cnkgdGhhdCBhbmQgdXNlIHRoZSBiZWxvdyBicmFuY2ggdG8gY2hlY2sgaWYg
aXQgd29ya3MuIEJlbG93IGJyYW5jaCBzdXBwb3J0cyB0byBhZGQgUENJIGRldmljZQ0KIGR1cmlu
ZyBYZW4gYm9vdCBhcyBjb21wYXJlZCB0byBwcmV2aW91cyBicmFuY2ggd2hlcmUgTGludXggaW5m
b3JtIFhlbiB0byBhZGQgUENJIGRldmljZXMuDQoNCllvdSBuZWVkIHRvIGFkZCAicGNpLXNjYW49
b27igJ0gaW4gWGVuIGNvbW1hbmQgbGluZSB0byBhZGQgUENJIGRldmljZXMgZHVyaW5nIFhlbiBi
b290Lg0KDQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2JtYXJxdWlzL3hl
bi1hcm0tcG9jLy0vdHJlZS9wb2MvcGNpLXBhc3N0aHJvdWdoIA0KIA0KDQpSZWdhcmRzLA0KUmFo
dWw=

