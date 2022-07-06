Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E97567DFE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 07:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361764.591430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8xqb-0002s5-GQ; Wed, 06 Jul 2022 05:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361764.591430; Wed, 06 Jul 2022 05:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8xqb-0002pz-Cw; Wed, 06 Jul 2022 05:45:13 +0000
Received: by outflank-mailman (input) for mailman id 361764;
 Wed, 06 Jul 2022 05:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8xqZ-0002pt-QM
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 05:45:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca663842-fcee-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 07:45:10 +0200 (CEST)
Received: from DB6PR07CA0091.eurprd07.prod.outlook.com (2603:10a6:6:2b::29) by
 PR3PR08MB5657.eurprd08.prod.outlook.com (2603:10a6:102:87::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Wed, 6 Jul 2022 05:45:05 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::2b) by DB6PR07CA0091.outlook.office365.com
 (2603:10a6:6:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 05:45:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 05:45:04 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Wed, 06 Jul 2022 05:45:04 +0000
Received: from fd905ba0196d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24450164-3A01-458A-93B2-D656F3A104D7.1; 
 Wed, 06 Jul 2022 05:44:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd905ba0196d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 05:44:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM4PR08MB2868.eurprd08.prod.outlook.com (2603:10a6:205:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 05:44:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 05:44:56 +0000
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
X-Inumbo-ID: ca663842-fcee-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=G4FMcDx0rsttcafVkWKnA6gpiVCTvwDqxsO6k1ZimjPca9TuB3dn299rn45TNPs8zIYlCNPwta7lhobuVRsbjzi9zPOZSskRnrtEGefVGhqcTCK69hh5JMwHdsnx8lrm1Sv7zho8YyrIwxayuTt4j0oDpqSbFVeD15eNh7EUDBaoExPoi17JTKeJZ7mgMNRt1fG/6jAYWoZRSYcD02pP8KbFWiox4vi2uFQ3fIIgqaaMSTJs7D0b4ekas9Xx3iA7f0z/CTVkmYLwmAfaf65O7PeUqU5tOFvhK6lnTsbFIsXMhAPU1svwkb+4TIsaeR3qp2bJ4n5dEnAOQg1oVoXRbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhGOJ/LgDrJTJvuRxeqPLbmWqef706X4agYcZ0WeL1M=;
 b=erelCa8FJWqRUxVjS1kxU6Xup7w6v0j0RKHKtGeaIp6mCRGF9JAzw88/ShJYfwSJlPEeMKmZVlM8rmmjhSuSSyz6FxbuEh/FTXDAS63TEoMectMYH7C9VYsoKizZ9BsfDmuRAJtIjazxGgbV5VJFUy/cdkPdaWgAROngJxv+P/16HpnmdVdPpylHI1DZ7kWpv1iu8zllPmOELYDp+2iHq98CcDWQ74swm6HNVGnwQNLqifhGTBccEV0sdyeg0xweGabj4UbWC9MIBefRA7xnN92PEmmLi2hmp+jf5soDlbEj8Yd/n8E6iiXe5xXZf9WqeWwdXOwIpXlfA36sqBkigQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhGOJ/LgDrJTJvuRxeqPLbmWqef706X4agYcZ0WeL1M=;
 b=OuuLwSEFV7bI1RGgOdvxTDhRy5lYXx+9poaO6IXyBO8IdZwWdLCOE5q+d7wMRPITKm4/+l9i/D2NHKiZffkOuzr3KppktmMfhuVlcxNtiKPT6m7QA+W+G53GozOlJ4wk+nb+hQahADryZcv1QFxoparqgfDHxHPnJWPOkF16Ons=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5lIAX006YKmjqJl4gCdh8OU/KG9jxkNsJ9NDu2Fs3dpPBXxTQzByK03NWcOG7hZGfD9TSPx6kd9TsMegYPIwCV93eH6o60kwI3YFj3UVOCn5/WlkeEqWAWKJRPScjX4x0tNWBuWxdEGBwycKoNXy5eCdrcHTGlDM1SB8Z6d0oPgkUz5TrpD7o4bwD9m4AytBudcNi94+oP0JRQwnweqr4Eln7zPtNcK0nSXSD560a7Ct4s4M9TwyAI+zsZmiAzsJCUyiB+NxigQVH1neKbSB5NFdBNdV5sWRNQHBDnIxzkr8PnTCv2ehJzO2xcNdzsfZ7RL1Cf0goPaeYEXwPmL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhGOJ/LgDrJTJvuRxeqPLbmWqef706X4agYcZ0WeL1M=;
 b=dt7pbAifdRuGWFP+mAVIU6vWsS/f4+d/7tZT3RgsbS+SMnVTXxEQH7SToGBTOO93qTFmzfj02hONlLuQ5XWOS2SFKd5oiwF8VSSALnFXG5EREBNPM45B6Ko7X0RtDtt84WX2HjO4dMZ7zMothuAeGzCO1kd87H+rToHN5Y273bSkDb29z8nHmA8m8P+GTb/n1m5kWQFWQkGvL/6W40jeE3uPy9pbMhRj2MlNx5J6i0A7owNVHLpr9oWeIAxEdIxvoD/6GknBkVup1HAy7a+Pbr59kV5JlyKMh95QhACNzNhq/vZ5s8xP0KtnG6rTQAQ12wo0P3nkLz5Jq6ybdkVVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhGOJ/LgDrJTJvuRxeqPLbmWqef706X4agYcZ0WeL1M=;
 b=OuuLwSEFV7bI1RGgOdvxTDhRy5lYXx+9poaO6IXyBO8IdZwWdLCOE5q+d7wMRPITKm4/+l9i/D2NHKiZffkOuzr3KppktmMfhuVlcxNtiKPT6m7QA+W+G53GozOlJ4wk+nb+hQahADryZcv1QFxoparqgfDHxHPnJWPOkF16Ons=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: RE: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
Thread-Topic: [PATCH] EFI: strip xen.efi when putting it on the EFI partition
Thread-Index: AQHYfBklLU4Niq38ak2Q5vLM16P6ia1wGWKAgADj0nA=
Date: Wed, 6 Jul 2022 05:44:56 +0000
Message-ID:
 <AS8PR08MB799100B72C4DE86A0CA1F20F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <79ebbde2-4be8-d393-476d-25326a2aa327@suse.com>
 <9916754f-b730-6201-5225-167995f69b51@suse.com>
In-Reply-To: <9916754f-b730-6201-5225-167995f69b51@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 50DD0495D0AEA54BBFD8DFF8B2C97B84.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 116e423b-012a-47e2-8d4f-08da5f12ad39
x-ms-traffictypediagnostic:
	AM4PR08MB2868:EE_|DBAEUR03FT041:EE_|PR3PR08MB5657:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ufh32Gzq4mS4z6G4X1MGxN4YDR4flIg2g3s2QYLDIZZKLUMwVlFLtplM2xWYxuab0+TR2NJkypl8GqVjVVpkSjp6qZTx0jn0H31ZIUE5dGDGOyUdxbe0iCBQ5yCOHL4isRdVtmeb1RQ3SNa3SvB9a/t6LsFqfYI6cGvCAbzg2D6+wDkkZsgl76LxTFrmk7/y60XCgsdAHsH+AKQ0pjJal58Ixy6Em21+tdQqu8851ZL/fcDI9stnTnsGQU5DjfHYkL9bLyLGPE0BXVrB5WX62OiZt6OoHs7d6XzXvPFp+Hx7x1xKwykakQwRsCL6n0puq+MhhoTt1h6yxSvdhapxxc9cESVgg1xmT09XeO6Ea+KYf+hl16BmKwg7FZsk7EHlLGKtChprjuExKdqMcRNd0+XfmeDht4xipkVksTq1lhDTrSrKuR4jxadQY/Tvp/5OcIq4r2ahBjzx1ui78WQ7GXXdF6mGsKhxb8Q5XOqiqtTm0Sf7CUrmT6LRxe2ybxGnTr4kLanRuWANJXgEmbgngkTa/1AYKgu2KYB2ZR9eMePTq9N4jlBy/zPqjpckPmTOn55F9KxU6SAJumoNMHgsWHVNmdd/z1jeQ1olUmNdv+VjyJKuZ4JrKxiggYUM3kY82JdsVkbiMJMpvb72pLhSCUI752pg/3ep3yveJlJ03ABch3yYNPFFIutxQ+NtSyoYPLRrmRy9Af/kWxRA4QGhPKmn471OLeLW4bc22+CEE5p/hrGiCRVWSNnpBV/B/zEUrmwsHGoNWFlo+JTZXAltLCdcUKofkc4MAVOVMO1Htiye318irzXVfrf/eo6tQFsp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(38070700005)(186003)(122000001)(52536014)(2906002)(8936002)(55016003)(33656002)(5660300002)(316002)(66946007)(66556008)(66476007)(66446008)(54906003)(64756008)(8676002)(478600001)(4326008)(76116006)(6506007)(7696005)(53546011)(9686003)(41300700001)(26005)(38100700002)(110136005)(71200400001)(86362001)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2868
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fa4ac86-6d42-4164-d570-08da5f12a830
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+86eEmvDjCOYC81MvWwp/15777yGK6vc9w09FCeP5uRwKsPytlkQUjh1qXk8cCXXmp5nKbp2N2uaIDsUkYO8OQTkQHIJy/XQOdMlP/Vh/uqdfEEg303IhsvE6/r51kryElEGL3siOVzMZ9eOFjLZ5UKVsB7mP6GEZkwN8sVWA6QPHGH8/cgr9d76DP+2q6ztr3vBZHesD/OjmR4VwKTrcrZZQzP+05/wNfA96WpIJZOPfzZQF88YxFLzuILtCRxLNd778DF6FQ31OJtD5Ec1NqV2E5aJg4apSJNiEYUCS2k8gJpdY60OzU2wsragH7XWyO1zFNikf0XbzOJvt7Yix591+UXoMs6wdgn+MqsYmxJ23NCcpjkaR9pJPqEIyTA8W+Kq9uXDvTKNr0ROO3T1ydyElR5cUkUpj8tYElJjotfvUS6a2YBEQ7SymGsXCi+/OvYNh93ehZ0iEZh9AHSay1x8h7h3yZZsfbbbfrOSOnIkTOpNi6Otqo4N0A4nU5IVkXcHKJm8jF9ZmN4ehr5Ul7gHOysyqpxNfAde/2f7mbSmOUW5oyb1gSwVMmoNZkybNyG0LPLuiFw3aygUNWjSi/AYUVn8L0aoENU4Op9qWMzxURiuRON3yBm0pyGqQPf9M33kILqvyDvTsdxiM74xchX9vhFZbMpwXGZdBMcU7phKFww1Isjs9AA5rkaK5iAFM88J5k/BMn43JyrZ7HG9E1hSGgFjYzz/934Xe3M/5i3ouFcCYYmCoAKUYR45TXO7UhLgVL6jbXTki0aOxcOxWrvuKJ+Gg8KVdIJ+Y+Azpr2i3jYJnSE68Fra36eWWib
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(83380400001)(186003)(336012)(9686003)(47076005)(33656002)(70586007)(8676002)(4326008)(70206006)(52536014)(86362001)(478600001)(40460700003)(8936002)(5660300002)(81166007)(82740400003)(26005)(356005)(82310400005)(2906002)(36860700001)(41300700001)(40480700001)(107886003)(55016003)(53546011)(7696005)(6506007)(110136005)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 05:45:04.6470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 116e423b-012a-47e2-8d4f-08da5f12ad39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5657

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIEVGSTogc3RyaXAgeGVuLmVmaSB3aGVuIHB1dHRpbmcgaXQgb24gdGhlIEVGSSBwYXJ0
aXRpb24NCj4gDQo+IE9uIDA5LjA2LjIwMjIgMTc6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
IFdpdGggZGVidWcgaW5mbyByZXRhaW5lZCwgeGVuLmVmaSBjYW4gYmUgcXVpdGUgbGFyZ2UuIFVu
bGlrZSBmb3IgeGVuLmd6DQo+ID4gdGhlcmUncyBubyBpbnRlcm1lZGlhdGUgc3RlcCAobWtlbGYz
MiB0aGVyZSkgaW52b2x2ZWQgd2hpY2ggd291bGQgc3RyaXANCj4gPiBkZWJ1ZyBpbmZvIGtpbmQg
b2YgYXMgYSBzaWRlIGVmZmVjdC4gV2hpbGUgdGhlIGluc3RhbGxpbmcgb2YgeGVuLmVmaSBvbg0K
PiA+IHRoZSBFRkkgcGFydGl0aW9uIGlzIGFuIG9wdGlvbmFsIHN0ZXAgKGludGVuZGVkIHRvIGJl
IGEgY291cnRlc3kgdG8gdGhlDQo+ID4gZGV2ZWxvcGVyKSwgYWRqdXN0IGl0IGFsc28gZm9yIHRo
ZSBwdXJwb3NlIG9mIGRvY3VtZW50aW5nIHdoYXQgZGlzdHJvcw0KPiA+IHdvdWxkIGJlIGV4cGVj
dGVkIHRvIGRvIGR1cmluZyBib290IGxvYWRlciBjb25maWd1cmF0aW9uICh3aGljaCBpcyB3aGF0
DQo+ID4gd291bGQgbm9ybWFsbHkgcHV0IHhlbi5lZmkgaW50byB0aGUgRUZJIHBhcnRpdGlvbiku
DQo+ID4NCj4gPiBNb2RlbCB0aGUgY29udHJvbCBvdmVyIHN0cmlwcGluZyBhZnRlciBMaW51eCdl
cyBtb2R1bGUgaW5zdGFsbGF0aW9uLA0KPiA+IGV4Y2VwdCB0aGF0IHRoZSBzdHJpcHBlZCBleGVj
dXRhYmxlIGlzIGNvbnN0cnVjdGVkIGluIHRoZSBidWlsZCBhcmVhDQo+ID4gaW5zdGVhZCBvZiBp
biB0aGUgZGVzdGluYXRpb24gbG9jYXRpb24uIFRoaXMgaXMgdG8gY29uc2VydmUgb24gc3BhY2UN
Cj4gPiB1c2VkIHRoZXJlIC0gRUZJIHBhcnRpdGlvbnMgdGVuZCB0byBiZSBvbmx5IGEgZmV3IGh1
bmRyZWQgTWIgaW4gc2l6ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4gPiAtLS0NCj4gPiBHTlUgc3RyaXAgMi4zOCBhcHBlYXJzIHRv
IGhhdmUgaXNzdWVzIHdoZW4gYWN0aW5nIG9uIGEgUEUgYmluYXJ5Og0KPiA+IC0gZmlsZSBuYW1l
IHN5bWJvbHMgYXJlIGFsc28gc3RyaXBwZWQ7IHdoaWxlIHRoZXJlIGlzIGEgc2VwYXJhdGUNCj4g
PiAgIC0ta2VlcC1maWxlLXN5bWJvbHMgb3B0aW9uICh3aGljaCBJIHdvdWxkIGhhdmUgdGhvdWdo
dCB0byBiZSBvbiBieQ0KPiA+ICAgZGVmYXVsdCBhbnl3YXkpLCBpdHMgdXNlIHNvIGZhciBtYWtl
cyBubyBkaWZmZXJlbmNlLA0KPiA+IC0gdGhlIHN0cmluZyB0YWJsZSBncm93cyBpbiBzaXplLCB3
aGVuIG9uZSB3b3VsZCBleHBlY3QgaXQgdG8gcmV0YWluIGl0cw0KPiA+ICAgc2l6ZSAob3Igc2hy
aW5rKSwNCj4gPiAtIGxpbmtlciB2ZXJzaW9uIGlzIGNoYW5nZWQgaW4gYW5kIHRpbWVzdGFtcCB6
YXBwZWQgZnJvbSB0aGUgaGVhZGVyLg0KPiA+IE9sZGVyIEdOVSBzdHJpcCAob2JzZXJ2ZWQgd2l0
aCAyLjM1LjEpIGRvZXNuJ3Qgd29yayBhdCBhbGwgKCJEYXRhDQo+ID4gRGlyZWN0b3J5IHNpemUg
KDFjKSBleGNlZWRzIHNwYWNlIGxlZnQgaW4gc2VjdGlvbiAoOCkiKS4NCj4gPg0KPiA+IEZ1dHVy
ZSBHTlUgc3RyaXAgaXMgZ29pbmcgdG8gaG9ub3IgLS1rZWVwLWZpbGUtc3ltYm9scyAoYW5kIHdp
bGwgYWxzbw0KPiA+IGhhdmUgdGhlIG90aGVyIGlzc3VlcyBmaXhlZCkuIFF1ZXN0aW9uIGlzIHdo
ZXRoZXIgd2Ugc2hvdWxkIHVzZSB0aGF0DQo+ID4gb3B0aW9uIChmb3IgdGhlIHN5bWJvbCB0YWJs
ZSBhcyBhIHdob2xlIHRvIG1ha2Ugc2Vuc2UpLCBvciB3aGV0aGVyDQo+ID4gaW5zdGVhZCB3ZSBz
aG91bGQgKGJ5IGRlZmF1bHQpIHN0cmlwIHRoZSBzeW1ib2wgdGFibGUgYXMgd2VsbC4NCj4gDQo+
IFdpdGhvdXQgYW55IGZlZWRiYWNrIC8gYWNrIEkgZ3Vlc3MgSSdsbCBjb25zaWRlciB0aGlzIG9m
IG5vIGludGVyZXN0DQo+IChkZXNwaXRlIGhhdmluZyBoZWFyZCBvdGhlcndpc2UsIHRyaWdnZXJp
bmcgbWUgdG8gcHV0IHRvZ2V0aGVyIHRoZQ0KPiBwYXRjaCBpbiB0aGUgZmlyc3QgcGxhY2UpLCBh
bmQgcHV0IG9uIHRoZSBwaWxlIG9mIGVmZmVjdGl2ZWx5DQo+IHJlamVjdGVkIHBhdGNoZXMuDQoN
CkkgZGlkIGEgdGVzdCBmb3IgdGhpcyBwYXRjaCBvbiBteSB4ODYgbWFjaGluZSBhbmQgSSB0aGlu
ayB0aGlzIHBhdGNoIGlzDQpkb2luZyB0aGUgY29ycmVjdCB0aGluZywgc286DQoNClRlc3RlZC1i
eTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpJIGFsc28gbm90aWNlZCB0aGF0
IEp1bGllbiBpcyBzdWdnZXN0aW5nIG1heWJlIHdlIGNhbiBoYXZlIEFudGhvbnkgYXMNCnRoZSBy
ZXZpZXdlciBmb3IgdGhpcyBwYXRjaCwgc28gSSBhbHNvIGFkZCBoaW0gaW4gdGhlIENDIG9mIHRo
aXMgZW1haWwuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0KDQo=

