Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516FC8009D6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 12:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645470.1007639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91cM-0004Nk-Fj; Fri, 01 Dec 2023 11:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645470.1007639; Fri, 01 Dec 2023 11:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91cM-0004Kj-D0; Fri, 01 Dec 2023 11:23:34 +0000
Received: by outflank-mailman (input) for mailman id 645470;
 Fri, 01 Dec 2023 11:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNOx=HM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r91cK-0004KX-Pn
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 11:23:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e3c96cd-903c-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 12:23:30 +0100 (CET)
Received: from AM0PR06CA0136.eurprd06.prod.outlook.com (2603:10a6:208:ab::41)
 by VI0PR08MB10559.eurprd08.prod.outlook.com (2603:10a6:800:20f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 11:22:52 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:208:ab:cafe::56) by AM0PR06CA0136.outlook.office365.com
 (2603:10a6:208:ab::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27 via Frontend
 Transport; Fri, 1 Dec 2023 11:22:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.1 via Frontend Transport; Fri, 1 Dec 2023 11:22:52 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Fri, 01 Dec 2023 11:22:52 +0000
Received: from a5af7244dfe0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 59049C74-F558-4E47-9D67-BF2D28211920.1; 
 Fri, 01 Dec 2023 11:22:46 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5af7244dfe0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Dec 2023 11:22:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6250.eurprd08.prod.outlook.com (2603:10a6:10:1f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Fri, 1 Dec
 2023 11:22:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 11:22:43 +0000
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
X-Inumbo-ID: 0e3c96cd-903c-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EvD8BpL1lKEEhmRvfhW8fHCfc0nGGSGJYn/bN8LaZJp0m1zNMWlyjFp5OsUa3EW2UMfQVpDHUa7d9TFddwHmMoOsBcnRWDTXJzmH8uIyorNjED7Br/9PEf1C+0Bcn7eXonq87hKTrpWMQl94ljcDHkuRtmLpPi3Qx1fBejqv95XZjKeLngAfUmoi9vxF/wNMuEriekcf8K+VTceftrsqbcHu9dFxWbja3GBV3IQW5E9eL1XgfT1elLxGeg5krluL97VKJr9uNt1+zJuHU0/Kzf+L/LVJa7jx6DZGcayrgNYxPhwajyeNlprPEHqe3oV8RDAxX0TOakXThagzXluJRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbt+8gqZbfuF/Wc0K2l9+qNfJJKlhRK+CkHbv5QdyxY=;
 b=kQsbd1hvLMFYWyeZ4B0OFq2Mg4rjLMowSSq7TYmpzm2voqLlkQkUaKAdsGQNMbe0WI6cTbHjP/lA8+VU8AxkaNj2yqGQJgjC8OPiblcg2bdgQSQA62w3gmfnI4A7zYsThCue01YBOm8EPSr3OQz7xehtlRwKv5igIe5k+VdGB9rRGV6aRqiyryh/H4hPqJP1jvkMZAjys+ubh2tGY5pF40/ITA4BYj0aitmf8vUk0kdzSgn68G1NK/9hxok85dY1W4SuiYIO5UcfmhDdCq4lEl1uDuRU2lZb1DqvV+XJM6igc7IS+1IG2BQTscOYQhSDH/dWLkFmkhPZYdx/IA6NPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbt+8gqZbfuF/Wc0K2l9+qNfJJKlhRK+CkHbv5QdyxY=;
 b=QpiPAnq0FeECKGoDpX5tQY3ElwCV14HMCZkaSDROfAp666GTsgsYqlkIlkY423BnGjAfaa85FEvytyHBTLleaZClym60jNYcSYiFmBXxQkBHioW4JaMjVvDCfSX1g++/LiuegYtnHk29Eq8T+K0iwIuIckvMP5q6nueinpZfPdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1299f8282786bd3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9EnPYmjM3DUXxz7UO5z3Mx4+iT0+7SepG2mpRO2ei4djQhCFa9szMqaqVj7OT+UEYD3vbokBxvAZiCwv5p9JrCbTuBFjSmUodZkt+H6tQIWK6iV3kXzXooiFrihR9bKPCY6UkSbxc31f1/BJ1GJiCWCqGyvbVjyltJL4EaAw9SSSnnMtvWe345UF/DcOdxa8izyX1IoWLmmvnuyjxSjUVRLZAXSdfBQnRvDjHLTZEmIUimQ5ILRNB1RyK5kfjk5UIKzXQAA/8440Sbpf/bALH6dSQLIwQ9yAT3MwaTVitoMTnzYNGYcrmvFkjqzExAlA2yNQB67QSjI2LtLekVqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbt+8gqZbfuF/Wc0K2l9+qNfJJKlhRK+CkHbv5QdyxY=;
 b=bdGqssNHPsUnu2IJX+943cAoxKiC1qbYAn5jS3IObf40kYjPgDCciFGr5e2D/5Id+cJwAhjAWdbEWqUVnipTgtyJh6Gf0AFj2VLdUvB8wjQfy7LqsuCv8Ky7oQgPhRKOrfnOMXYeidTm0RTxQYYULnXFO1dA4uplm+ntfqXaqd9boePQ35ZKNZ4ZB14vwB2vSGXnH5a6BRCa/Gga+1korH74JbxD78PVTpEFIyVJpd64G6JhXDJAKsGbcBeR49qbmQ5m4XtlMc/QaoLa4Jt1T6lzmskHRivjH2MsKkARpgr32/zWjdv5VbW90wcfI+F1C6Nu3nb1Cvnf/MNITBgAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbt+8gqZbfuF/Wc0K2l9+qNfJJKlhRK+CkHbv5QdyxY=;
 b=QpiPAnq0FeECKGoDpX5tQY3ElwCV14HMCZkaSDROfAp666GTsgsYqlkIlkY423BnGjAfaa85FEvytyHBTLleaZClym60jNYcSYiFmBXxQkBHioW4JaMjVvDCfSX1g++/LiuegYtnHk29Eq8T+K0iwIuIckvMP5q6nueinpZfPdo=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] xen/public: fix flexible array definitions
Thread-Topic: [PATCH v3] xen/public: fix flexible array definitions
Thread-Index: AQHaJEh3xfQThuYOOEORncnUPH8irbCUSMeA
Date: Fri, 1 Dec 2023 11:22:43 +0000
Message-ID: <39128F75-3FA1-4977-B792-C4EDE99CA57F@arm.com>
References: <20231201112041.5260-1-jgross@suse.com>
In-Reply-To: <20231201112041.5260-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6250:EE_|AM4PEPF00025F9C:EE_|VI0PR08MB10559:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d690b0-09ce-48c9-c48c-08dbf25fdbdd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HkUVVyVtXt8IiO55Kz50piMviDSCjjMni6XeyGStYDm3Sv6nvVVrB4tPIZ8+1Xtz/sJ5YV9FTEoF04LXbBabILmU002yhlcTp5ZIWoQbBbXY7kA38UGdM20zbzBVpr8vuSWgFgfxAfhHtE/MQ6jB6cMCj7WKeyui8x1bGSMtOE6Wnqw8tC2hzvn/mebJSmng7umXH/tJUBXLe6hhRh//I7DD+bzGM1Xa0+lbzK1Us8sPTJZuCrJsYRpPg3T9mBEq3sMrYjh6ec/L7Z/Eb3/9hdVL2bpRwnAdBa79+oepVt3uox73eaU0+4Tzjrbpq7orWYVvHG/EpYlPoLolg7xF31V2yaEvw0QqsRrjOcJFxFlXWLtaFJe1qIUxTegbSyo/7/+pRLgW6uChkNIQJke2YiO4Us7yqCvhoVctnFZq0rKi+brI3dZAbtDaBuC/97vDyUY4E/L28npUd9Th/6Dx75pz9eM8SjFBdb+hnrIUjGaxcglD2udgAGaYyVMfD16bU8a6sz3BrkUIlCaXo3BvneNU+dw1zc7q+K6sPTisiSVIqTzgM6f8ibmldTtx20EREQj4GWZMSaLN6RKjfKCP4GP8p4DlEjBSKYt4ykSQ43ud747VECJGpPXFKjiwRZkJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6506007)(38070700009)(66899024)(122000001)(33656002)(71200400001)(5660300002)(36756003)(2906002)(4744005)(38100700002)(26005)(86362001)(53546011)(83380400001)(6512007)(2616005)(66556008)(8676002)(966005)(478600001)(6486002)(8936002)(64756008)(41300700001)(91956017)(54906003)(66476007)(66946007)(6916009)(66446008)(76116006)(316002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AAA6B217FD569649A34354ED3E5029F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6250
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	347d4288-9519-43aa-c26c-08dbf25fd655
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I6oBeHyWa4YqMr1maS7UKPSE7WKG+ozqTFnCWuevM7apYkxRDNkeSOveWofp4lvIw6JyAuJjPg9bHpHIEKz0AfsREyyNpEXbWioVVoFl7gvottO7kTdkgAOH+w9fMAaVgRb4xL9EJ+64sev03EX4zPf8c394l00GqGHBJ32EzfinLxihgPwIrBwjEwwg7D1XquqV24nLFyv3IO0RIJ0p1jmfL9jyjKbbGMPjzm15NzXAhsIdm/BmizCYyN5u1VWW5bBEbrviZlK4w6Eh/Smyy+aKiUL+nRV7oY0hwM1G2o+/YP7u32BuJz5/t6J8iqj1iB/4zjVZrN7gM8uqsTHhtVC3gsfBnoki3C7/aY/K/C5wDFQhbFGzuEyeGqYCg2CpF19MvO/E1ZFSbBiY4V6K5JjJslBbeQEKqLYj3Y6ddZ+gDy7tD+AYn5ZHUDAIt2fSCmYFQK623Oz98ARyngRySrXZNRJ/B99dCJ0ppZqz9O1qlxb0fJLAFBhrd+QQndvmBNVXIu/qom9aTJdd1hhZ5cdCNBMIouZ2CvFzDNLUec7viqmWP8l5SmB+5yb+fzJZVI4p4lijyrjpbnyIjxSaj/PzxqZB2nSlBSK9eqkt5cvxoy+2hm+h7CFtGNc/mtIHid0KjjZDqq2Y4HyWgggKHlvnq7nadvGnEzmSy4cWWqQkmyFe+44U14IC9B37G8/l1nnSrAIGQHVu62kr/O27Ujuj/mhiOZ05xjTt+EoL4kI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(26005)(40480700001)(40460700003)(36860700001)(356005)(82740400003)(81166007)(47076005)(33656002)(5660300002)(2906002)(4744005)(53546011)(336012)(83380400001)(6506007)(6512007)(2616005)(478600001)(66899024)(70206006)(316002)(70586007)(6486002)(966005)(36756003)(41300700001)(86362001)(6862004)(8936002)(4326008)(54906003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 11:22:52.7147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d690b0-09ce-48c9-c48c-08dbf25fdbdd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10559

Hi Juergen,

> On Dec 1, 2023, at 19:20, Juergen Gross <jgross@suse.com> wrote:
>=20
> Flexible arrays in public headers can be problematic with some
> compilers.
>=20
> With XEN_FLEX_ARRAY_DIM there is a mechanism available to deal with
> this issue, but care must be taken to not change the affected structs
> in an incompatible way.
>=20
> So bump __XEN_LATEST_INTERFACE_VERSION__ and introduce a new macro
> XENPV_FLEX_ARRAY_DIM which will be XENPV_FLEX_ARRAY_DIM with the
> interface version being new enough and "1" (the value used today in
> the affected headers) when the interface version is an old one.
>=20
> Replace the arr[1] instances (this includes the ones seen to be
> problematic in recent Linux kernels [1]) with arr[XENPV_FLEX_ARRAY_DIM]
> in order to avoid compilation errors.
>=20
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217693
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG

Kind regards,
Henry


