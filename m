Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8F70EE51
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 08:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538768.838978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1iDD-0007T5-Bt; Wed, 24 May 2023 06:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538768.838978; Wed, 24 May 2023 06:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1iDD-0007Qr-98; Wed, 24 May 2023 06:43:07 +0000
Received: by outflank-mailman (input) for mailman id 538768;
 Wed, 24 May 2023 06:43:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1iDB-0007Ql-TE
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 06:43:06 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b0cef3e-f9fe-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 08:43:03 +0200 (CEST)
Received: from AM6P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::23)
 by AS8PR08MB8419.eurprd08.prod.outlook.com (2603:10a6:20b:567::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 06:42:59 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::ae) by AM6P191CA0010.outlook.office365.com
 (2603:10a6:209:8b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 06:42:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Wed, 24 May 2023 06:42:58 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 24 May 2023 06:42:58 +0000
Received: from 10e443ad96d2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5CC41885-5AFB-46C5-A331-CD6E64524D24.1; 
 Wed, 24 May 2023 06:42:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10e443ad96d2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 06:42:52 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8073.eurprd08.prod.outlook.com (2603:10a6:150:75::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 06:42:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 06:42:45 +0000
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
X-Inumbo-ID: 3b0cef3e-f9fe-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm1fzcNeK1KHKekNawMyyBSDSb+/OzHUc7oBbXnvTjY=;
 b=iNWEg+A5nJGf2e6o0KH2phvLPF4h7UPvNbT0XGchbDynprFf5r0Qz+S1aSnolhA79dUz4h/9MzFOYLVHdXyx9wwHr2gNg9NftNsFQ3E9P8Am3xFnHo5h/0CocIQC/lA4sM/BhMXWsvon2JHxsuT5U1LMMm5FgsaDrHUOZAH/VXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: de6a66ae06009f2f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPZra5yIHD7lMBUdVAI2/CsY/e6v8urCgyghyr/E0VQgAQEBcFfj0ecLeEXYrCN6ALfU5kQumjVOtDiNHHGfqaSEgtblt3Wp854ErMBNnER/cq2csN+mmVPfWLsI1AZVlkVyusRNHCHaGk6XrusnGNPYMrkrjBwWKoS9HbiGj4U+vquDPvuMTnzRVBfzb81j3djNz/wTgfxZuyarxsQ4RY55tbxUJLgQAsgrkCI67DdKgFPCKnFBw8DZqZMAyo/qoj3+5a9Xd+PDMStgt4bPW9UTQmsCauS/TLQZHQbZG3vWaGi8Bem1ig6dQZZwNmaTE03FXAb+T/4DwEUAr0D32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm1fzcNeK1KHKekNawMyyBSDSb+/OzHUc7oBbXnvTjY=;
 b=A9JT8k5I4QLMBzQ+WjEozGRGGtr6APSdkLX9GOt6LnFfs09qL34BUQ00XYeRp4dh8aQAUjWaEy8P0gVywVQ16vziuurZ0T7u6Wx3PDmuesP+nDyXajKGNRTWke3493wBaBX9b2IBcvAbT1mJ2FEIODqTfdLnNqoHuvCzQm8nxLX71wPjfF32zwJPKnZfyWcCk6XmpLMDY9EuvBVG/JeIIwLr57i+1/h4bcDOkbbYK3XUB+DhY3sBYQ8PoePJ3Aqfa/UbLwtJhonmfbv47BxtFUN6pz7G9ZMFoqjTwpbus22monlYTWlVlH6asZooeRPzTJaX0XMUyE9NcgzF4v3kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm1fzcNeK1KHKekNawMyyBSDSb+/OzHUc7oBbXnvTjY=;
 b=iNWEg+A5nJGf2e6o0KH2phvLPF4h7UPvNbT0XGchbDynprFf5r0Qz+S1aSnolhA79dUz4h/9MzFOYLVHdXyx9wwHr2gNg9NftNsFQ3E9P8Am3xFnHo5h/0CocIQC/lA4sM/BhMXWsvon2JHxsuT5U1LMMm5FgsaDrHUOZAH/VXU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 01/15] build: hide that we are updating xen/lib/x86
Thread-Topic: [XEN PATCH 01/15] build: hide that we are updating xen/lib/x86
Thread-Index: AQHZjZURKjD8NZdEuk+seL2t35mCkq9o+q6A
Date: Wed, 24 May 2023 06:42:45 +0000
Message-ID: <0355AF41-789F-4BF3-AC81-F325C8E63D61@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-2-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8073:EE_|AM7EUR03FT062:EE_|AS8PR08MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: 502fa23f-35a8-414a-bced-08db5c221ce8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mj5w0Xs17GFm324Jf620F4O5xLdH8OnPYnvUSFTy8NqCcECaLMwcNX26VOuGSyrtcDrEV0h0Oxqys0HM7gBsgHLCGapP8+YHFAWTnQnexKxhuzmzoZ04wAUltcGrrA4+JPyWkpXB08oX9/umAVWOPqWbNid7eXfxxiGNSj5XQqip0YXlihZG4GbW6pDrD3FKKGDgEGIAMcbdw7UYwnF4k8E7+i7Y1feH7U19Yb557NXmy/rbr4n3npVJORWmVyyAjDb6dNaPNxUCsdaycxUqIwzxFhVP/pJGu1rh8YYXF+s5sGAHedTntqd22sBcvdSwRmGeOUnYLrXPHfzklKMQvpyVkz5YRLJtsUxlt0MV4nq2ZHEBCN9A8YjronOQflc4hBRHFi43zAMzHkHh6auD2dIc/c16fXJqENWKFP2KPsYzbZCRL8adhdF583XmDcWed3SFzg4yChldH4f4bM3H4TMi8ldoS56+ErnLo9vK/l7f5YJlWLYQgPsJmXS5f5Oiuv7kstUxTVidrDh3Lf4KGlrySlbyZakvbt8V7hBtPGiP5mxLjQq75XmVs8jj8+glury6a1MPla4T1VstYEuT3WZye5X9YrRL41E4/DJH+shRVHAYxxM5tV11pGppwh1BxkkahrpxqJqZnArM7CckGQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199021)(53546011)(6512007)(26005)(6506007)(71200400001)(186003)(316002)(33656002)(38100700002)(5660300002)(6486002)(41300700001)(36756003)(86362001)(2616005)(478600001)(83380400001)(38070700005)(54906003)(122000001)(4744005)(2906002)(8936002)(6916009)(91956017)(64756008)(66446008)(66476007)(8676002)(4326008)(66556008)(66946007)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD607D61DE58554FB7659D0E5F11F593@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8073
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e4521c3-1605-47d3-6f0b-08db5c221547
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oUXr8KeiVc2Lpsl3im1rtTA63XPlJJOUXVlYBICY8yUXglE77ooWkFhLN1TzBTWpTs+1UhitWfNvW0B98A49F0v7Vs2iw/vlIq00oLPqRxLRgIuj1lnpX9Vyt/4GXFZmtoZSjl5Mu2Zv5hHgqt05jgiOHXdK2eSWi/6rpLnNFda0uvCw+oN+eN/erFwCGBjmCEGhji3vLwGkAYkRnf2u2lgL7TBJn56USRQYwrKX74381rfhQeot+h4MIsZ8ILUvuFw2b3t16B2TmJXy861e6Gj558+lang+xphidOBmTWA3JYcgJcKBsKjFy12K7gRKnooq/tCucIBKZkUnTO161pwaZyUd54XFsEHqbb2AwUv/d3J3ZKgCuOSBWx9GkuMhgus//V85ENjvwLKxMJuE4Tf3b2yewU8BjIbkeCM2m8Fa273vMbKY8ebjL+mUKRZh8thS/71Dh3QZ0ovXWXW3dcrP+LaRctth14VRmTQyu4GDiDZOfLE+MKMZabMyCfK+SFHOqVXcMEdYDCvRlj2MKzwVzahRtMX2FpWJZmZwDHpZHV0mGO5/J+YdXijuSbI/LbCy4oGVzMPLmnmifOeQFg2fSiCfUogAnsX3DDkNo0K6JUxhP/ccDOY7qAFEbnyPYdIGrrL8RvBER+c2ixUGFAnUPZ8jTjaiLEAWSPL4oXyxRepMNuO+MYOzTd60KPsMu06oTErmw21HnrMy7oO2RsncviBXKeqNkhfqhCWjcZiDfAJXMCWoePORBCJjPu7b
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(5660300002)(6862004)(8676002)(8936002)(186003)(2906002)(4744005)(33656002)(36860700001)(86362001)(336012)(2616005)(36756003)(83380400001)(47076005)(82740400003)(81166007)(356005)(26005)(6512007)(6506007)(82310400005)(53546011)(40480700001)(316002)(4326008)(54906003)(478600001)(70586007)(70206006)(41300700001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 06:42:58.6246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 502fa23f-35a8-414a-bced-08db5c221ce8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8419



> On 23 May 2023, at 17:37, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Change of directory to xen/lib/x86 isn't needed to be shown. If
> something gets updated, make will print the command line.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Anthony,

Looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


> ---
> xen/include/Makefile | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index edd5322e88..96d5f6f3c8 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -229,7 +229,7 @@ ifeq ($(XEN_TARGET_ARCH),x86_64)
> .PHONY: lib-x86-all
> lib-x86-all:
> @mkdir -p $(obj)/xen/lib/x86
> - $(MAKE) -C $(obj)/xen/lib/x86 -f $(abs_srctree)/$(src)/xen/lib/x86/Make=
file all
> + $(Q)$(MAKE) -C $(obj)/xen/lib/x86 -f $(abs_srctree)/$(src)/xen/lib/x86/=
Makefile all
>=20
> all: lib-x86-all
> endif
> --=20
> Anthony PERARD
>=20
>=20


