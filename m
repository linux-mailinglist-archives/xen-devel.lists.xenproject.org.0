Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E881A56BCEF
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 17:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363550.594143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pxV-0003HZ-GK; Fri, 08 Jul 2022 15:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363550.594143; Fri, 08 Jul 2022 15:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pxV-0003Fe-D5; Fri, 08 Jul 2022 15:31:57 +0000
Received: by outflank-mailman (input) for mailman id 363550;
 Fri, 08 Jul 2022 15:31:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LzHR=XN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o9pxT-0003FY-QE
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 15:31:55 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30085.outbound.protection.outlook.com [40.107.3.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1846e9ac-fed3-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 17:31:54 +0200 (CEST)
Received: from AS9PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:20b:48a::22)
 by DB6PR0802MB2309.eurprd08.prod.outlook.com (2603:10a6:4:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Fri, 8 Jul
 2022 15:31:51 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::38) by AS9PR04CA0149.outlook.office365.com
 (2603:10a6:20b:48a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 8 Jul 2022 15:31:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 15:31:50 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Fri, 08 Jul 2022 15:31:50 +0000
Received: from b04c9f083286.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84265E87-1B6F-4057-9C06-9D22E3656D0B.1; 
 Fri, 08 Jul 2022 15:31:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b04c9f083286.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jul 2022 15:31:44 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB9PR08MB6890.eurprd08.prod.outlook.com (2603:10a6:10:2a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 15:31:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.018; Fri, 8 Jul 2022
 15:31:43 +0000
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
X-Inumbo-ID: 1846e9ac-fed3-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a0p9bUiJNa3zDOVQwydo2A3q5my/XzhlmMt3/Yj+uCjsSyIrwVzN0z3mW4bD2tgUEEXP46eNJxjH2SxtT6FX8wB0NMt3qos0Wy3O6u6CTRaiRUs37oa9XuhJ6AMZ5jQI/JoucHVD47TnWhw/mUglJpTlO27Q25zVZAKQ42Zip8fRWvIUcLGrFSKgteh5QkIffbvU3KzgkxnMCy1YHzoLQpvBL2NxqHlXm3cJ24T+uIFLEIx74YVyopbQaNfWdREuvAwwPBjzJerB1KZM1GMK3Ws8Qa7BMeFBPzlA7bnQGhUS1XZ6h93s8UNe/8FIZs7ZB4SNKb5DFCD8pCwAIDerfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezPJzAsXEwac13tjxHuuerF/cCo2GDBmbk3Ctdu5I0s=;
 b=CqQBtJPAx0i7cU4sOYNrD5lTHZsAEfx3nKm1ZBWvXivqTHlfW5TJXuXP2pzXUfaplloVd8DfaacmMV5KdqB51fOjdV+0szpXxm2weRcFaMANZxCOdcizQa2l/r5RNiL/8hdg3/Vnm3p26L5N6v8W7vZ8129LgwOov5w4LZw0+TNXBYYBtZG7pdIYMncY/DxBvDSttfvFv3egKPxHjchpB+vRXwJHdV9CycjYXGCcNs7mE2El6l6TwbIgGaQTTDN4BjHBiuSQgy+gr4YtKNLo4MXvC/U9KzMbRIE6/znuNtQiw3jSe6bSP1yrx0mqm6v03mie8ZXsJTjI5Ihugq9jfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezPJzAsXEwac13tjxHuuerF/cCo2GDBmbk3Ctdu5I0s=;
 b=jqs5qZ6EgO7DDGtTQCxLdZUsQFE2HMOj6mNe7GYy8iTimnhedbCALvZmnbxwIfeMBbuFj3sGqzIY1Rn8csz8a56D0cyZZSKozWwXiNhVi8ozvXlSbEcyu+gQppB/HolyDDU64SYIKBH2MwmIEB/BluWA+Z3A22tnfnpSQQszrVY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a6d29ce09465e74
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD0R78upZF+cMBcSqw8v1wpmdlI/lYqO7+IFGBJ+npmSZOw8QuD/53epuu//XHcZ1ZBIA5Gan9QAVsJQ29U8iwbQQJhtysHz5V3QZ0nQ81n3nmpsYSdYMbqkImsvsQS2BvxG7LSBlppAbr5pHBTlCuts86sfycWFFfXVDNUMVgcW+L/6vroN0BIYLea6LEvxp0zf7yx9L6nzjfNFKjZJxWx7hRcKTPWlhypW7eDa4M6RDm2sxnJcgzsQC5Vtx9XFNDGBUGPbobaeahIDmiYq01dakLkqPbQiK6Xi3nMhfMkx4VVoZ7Hpm/cNuRhBlCp2iGIlfB1QpKGM2heJhc6DCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezPJzAsXEwac13tjxHuuerF/cCo2GDBmbk3Ctdu5I0s=;
 b=HrsCqymjefkQNzJ8WeTLrty9Ng9qKLLZlhWIB0guIs4PVLk6aiQ+rHgJqpZ/yxaaZsjLR1c7hsO1AID+WqtWUqi4CbJg1YMtPJCuTgxdKzjQEldzOvL0s52bcdP8AdD1rkXOC5zQdA79Dc80k59b30KcCCZpcRIl+qT6JA8Lmnxa516as7sESIUTDeixrD6Wy0EqHLteXbiezoNlkcyhaPCu1/uguNmlQ+XW3TsFVOnw3xLl8vMX94bALg432myHbR4Ir6qigwkOXjpmUICLDCXBGrBgBIjUrdUozEBuhIXoOp4nj7q8TmUip9KW4QofhPd+w1VeMBtnr4N3BFdICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezPJzAsXEwac13tjxHuuerF/cCo2GDBmbk3Ctdu5I0s=;
 b=jqs5qZ6EgO7DDGtTQCxLdZUsQFE2HMOj6mNe7GYy8iTimnhedbCALvZmnbxwIfeMBbuFj3sGqzIY1Rn8csz8a56D0cyZZSKozWwXiNhVi8ozvXlSbEcyu+gQppB/HolyDDU64SYIKBH2MwmIEB/BluWA+Z3A22tnfnpSQQszrVY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 03/25] tools/examples: cleanup Makefile
Thread-Topic: [XEN PATCH v3 03/25] tools/examples: cleanup Makefile
Thread-Index: AQHYh+QvDezl/6q3/kugY7JDjo5uuK10r90A
Date: Fri, 8 Jul 2022 15:31:43 +0000
Message-ID: <716DC528-89EB-44BF-9424-31F13C5DAAF8@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-4-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-4-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7b46d36f-5456-4a50-258e-08da60f6fa77
x-ms-traffictypediagnostic:
	DB9PR08MB6890:EE_|AM5EUR03FT040:EE_|DB6PR0802MB2309:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JQp82RqAxdrYmwQp9YGHXzRsDVav+sWm+CPRZRhkJGezfReX2CNujdNwPzqC5HyXC0ZAXGafsYnso5sT9STqCIsKaxwyGXRglZm9Ql7A9rrvp1mwWbAsQpxVVB1RaPPkfgwbwUnvsoORbnzcUcx8GfD87hJAqA+NGhk9w3qaDpryRL9xHVwCW1K9ElbV1UjPvIvJtLzYJPIoVc9i604jApQUF7zdktEqjWzQvqeDbXSFas+03awmWY9wer6LB9quMXmA3j8HG4mwvc4W+PBjGbv/075nM7WTa2GcLxSAe5fAF1LURTUdlo3RVX7h3WqAuGTkdJ0BcZDC8y5rUHHUoGEVeD6eJ5BbOJ2eos2P9cZQAkz4SmWwf6Sg7pdlpgmapZyE1kYkxbtMijCrTXRkKDLWYwQU/JxR6XQ1qKnvFw/7k7LCWXMRbEGkswr0qn4lUP6E9MmJOEz0/vwKL5SgTWh3d37KEb5rAq9xVU/IKQ6BTo8zfmWgHBURj6YqZktQK9yP2Q1mYS6ZrPw/tFOOa/QfPd3vtTbGTCqlnrxnfwzW9Xbikt70Ujn+7fIcQah1PgyS7eVNSgAWGClqGOPtrG/FpK2u4z5d5PrfmNxmG/QNtaDMjOXJpU0mb51wSruaEf6mAYgN9SV3yvXduMg/vV8SHZ5blFvyS59ilD2gxfz/Y+roPGvQO6NlOchKIRy4ZQrdOyLGhQ+Zbeni8YWLX90FZ1RfueVkFU20FwdG7r27V+bJW6Cwcgznpn6bODKAjnQ5Ztac4ax1ycYHH08qTTaUv1dRC3XzTVMLgh/8hMRmQgnCiBd7K2zU6o2iCGxmk+3+0LXA9cK6SbsD088lIHdkumtl9a7FmMAHn2n3Is8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(478600001)(6486002)(26005)(6512007)(38070700005)(122000001)(54906003)(33656002)(5660300002)(71200400001)(86362001)(53546011)(6916009)(41300700001)(8936002)(4744005)(316002)(2616005)(66946007)(66476007)(66556008)(91956017)(8676002)(4326008)(38100700002)(36756003)(76116006)(186003)(66446008)(64756008)(6506007)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FC51EE9C2F0DED448567CE095B9EF99F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6890
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b70fb872-46ab-4ac9-7c61-08da60f6f61a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QuR1Wjkt0qdEGV0Zn1z6JFGuYkjtWKdTMJZrcI75uMotqy7GNt7uCbqjiwC/ioZULdp5LUT/xBcoAu3wLW9r4N7OgLonu7dVnJzBYLwNJmTYX/rPDVin8+pgTAf6nOV3VNx6QY3as3uP6eQfHiuIl/kgfaOyH+qHE9zdlp0Bvi7vNDwL5vLk2qWsdQDKHubms859eEvbGBef20z5xOh0ujbGkH4b85L4H5Bk3VtdzJwy0DwhbgL9yyBWParH4BnHgT6qo6wPHfnFemlZsnLbtFKIzt+6NbMMrUP6l2kEJkdoHbZJiNbYnh5u4pog3Vvl2bfMwKBsvcE4jzuZhSnvdK+DplhOaSLNtkWMhaITivCzlVu4+NEicMOarsLFyoaL0c9SIN6zmWiBue6VNYSD4VJXysmHc2BR3c8GmxmMl1ZH4zixbjrbDiP8Yo6YDB3IZF3Nkpm3W02KjNQXU17gPZqxtcrk2Mqz1EGJDtT5um2J4gy8dYYejNKzjCtssd89Q+vlYwN2vHzCpP6sHinpB/+rHMu7hyqm32sxHa5WygV7JtoH8DaFb93+u1nDXE7kKCyDr/BTbn0c8mcV3Bovu8VW9udazXmVf0L2g/8tkc+mXIa1oBUn8lBlwgLUqqKqZJCPWUeeJsKKHaNrSbRh2GfertYtuQQiDwGtHr1SVeHS+ttcb5zs2JjnHEXgjEy7SVuuujqvaIhiKx9NceChQ9inCQg+xIGk4SjTB08J0wN+bM33YR53aBrp55EhCFxHSdDHKEqvxYXmW8TeINMpSryCBzwVBwsDxHqjuAiydu/BJSDsk8HJ7j8I+RzWWA3O
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966006)(36840700001)(40470700004)(6862004)(478600001)(82740400003)(4326008)(36860700001)(8936002)(81166007)(6506007)(33656002)(5660300002)(356005)(41300700001)(70206006)(53546011)(8676002)(70586007)(4744005)(40480700001)(2906002)(82310400005)(336012)(186003)(47076005)(54906003)(26005)(6486002)(6512007)(40460700003)(2616005)(86362001)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 15:31:50.6055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b46d36f-5456-4a50-258e-08da60f6fa77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2309



> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Don't check if a target exist before installing it. For directory,
> install doesn't complain, and for file it would prevent from updating
> them. Also remove the existing loop and instead install all files with
> a single call to $(INSTALL_DATA).
>=20
> Remove XEN_CONFIGS-y which isn't used.
>=20
> Remove "build" target.
>=20
> Add an empty line after the first comment. The comment isn't about
> $(XEN_READMES), it is about the makefile as a whole.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Antony,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




