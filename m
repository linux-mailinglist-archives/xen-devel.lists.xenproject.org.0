Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB1D8098EB
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 02:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650324.1015765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBQ71-0000ag-J4; Fri, 08 Dec 2023 01:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650324.1015765; Fri, 08 Dec 2023 01:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBQ71-0000Yd-GN; Fri, 08 Dec 2023 01:57:07 +0000
Received: by outflank-mailman (input) for mailman id 650324;
 Fri, 08 Dec 2023 01:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBQ6z-0000WG-5M
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 01:57:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1576252c-956d-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 02:57:03 +0100 (CET)
Received: from AM6PR04CA0066.eurprd04.prod.outlook.com (2603:10a6:20b:f0::43)
 by GV2PR08MB8677.eurprd08.prod.outlook.com (2603:10a6:150:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 01:56:31 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0:cafe::7f) by AM6PR04CA0066.outlook.office365.com
 (2603:10a6:20b:f0::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Fri, 8 Dec 2023 01:56:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.24 via Frontend Transport; Fri, 8 Dec 2023 01:56:31 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Fri, 08 Dec 2023 01:56:30 +0000
Received: from 878cb3ffa17c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8DF756C2-6806-436D-BE8F-B1D11821BC82.1; 
 Fri, 08 Dec 2023 01:56:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 878cb3ffa17c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 01:56:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6683.eurprd08.prod.outlook.com (2603:10a6:10:2ad::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 01:56:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 01:56:18 +0000
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
X-Inumbo-ID: 1576252c-956d-11ee-98e8-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UvMfUJmKA6UcfCvNM9q0l8l6SkBcht3PlnKXYL7BcsCeRkUc81Xc1dUCuYH/9Jq/7fmixiEa65zZ3HYFCrWltQi7H5Ecsj83T5rsiZBgXJh7fuujZv1n8uq2d3gN0QJwFTNRpTyF49ytuqaC0sEj2BFlh61M+kQR8SC10+vYAZAHec4erEN0XLkj1YULe+CkUL3DSpJ1F6nLU5pOrVHxHSI9n1il0b4obwwKjc+GFxZarTA7MfXzbAfHnBNdmR+ZwWxg9vXskDgIC/wjXvb02fGyDbFc2Rr5lqgKnCQRdyk7ZFwsZUQYOysC2lftZIs09KuYlpDCJ9kUQDzPiYVfpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVAZ9qZ5G8o9H3m+vA/lVirzaKdcZi3ZZ1l3ZRuToHo=;
 b=kNte85bSKPlyhtLsTNk5YcNhpeDiN/w4/aOx/OXX1Fdu9LPPdPXQ4KWUDX1nf+yQY/w+yz//1QmQv7LoEaqRxJJKu+hYF1XgDeWpfM/ysYzfe8tviSnE4QmDkktexialTOlSrSpt3808kZRts5own6oPNE3twfU/DwvgenCSTJHmSq+HD80GpgJgf3C71c2g4ueXR0OgZe0YhoHlysyG50USKQQKapDpqtZVrxXmlZQCgwYjbc++wuoKphtprO36w1u45z04JJIMIdXPo6/eWmpEXf/Pod+Tb6bNWtysjGGzHNIh9zWE13GebWkJ8EEikiHzD8qqL4PkdUNCdt2RWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVAZ9qZ5G8o9H3m+vA/lVirzaKdcZi3ZZ1l3ZRuToHo=;
 b=dFVtF+oNXzOEil2YCyUbXlaCo4W8+PWGQuoNn/ps1mS2y1htA26YuElNptx2DWhOJo689DDGq9wMXYQ8kHNH19g1xmZ4og4y/GfNIFYlmGSPZ3aEqqCurfHhw0ngVGHz2mTN69PIXppLD4EDCLpvhRh+Qdi+lZjJP7X6WSgEhxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 068ee60ddef53601
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY5YGNEh0b8lEU+g5FGWJ+8pG701YvWsDTvpKckGXpOq0fK8jnsFON5lWxxwQNjlrsdj77kAQ5bSH3gY838PnFOCLAMDxl1wPuTlc++Q2ciQMIIaaZixOLYMqlzT2RdUH9yIlObfpZ1PJGQvGivuM/pJGTPSYzEIQIW9rbTxni1ppCat1Tmc6YH65ncmWyJDfVQeo+OCsgnsRI/8yUiNXOxx9HYZr5GUnii6+IL9yv/ZixwQWeQF3wNlpwlCHTHMhTkiD/1rli56Hy4rB/TzCYTBqLviEoyijZdMHV+va8Go4Mtg8KvtuDJChcMuQN1bpdHin6m9mscnbD/cuhyHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVAZ9qZ5G8o9H3m+vA/lVirzaKdcZi3ZZ1l3ZRuToHo=;
 b=NFSFRaR+M+4engdK6scJrzcjhDngyeajEW2lAbBNG2GgJZHaSoFqci6OaB6HVPhdIIQgikKgELUMJwtd5OHhNkh6Ii1WEcOIU0URqefNf8g+9fFTF9U/x0OopRRiIpuoptljd7HgEq4TMFN1CIF0wt/IfEOGnnIkuW3K5m4p6aP1bUSWBn4gfG3uDDPfkM6lx7Fxfrap13TFcSTexYfmV3Hj1Q7e5r4YNZtgCEZ5Xjtu4fq19LmUoiU3dhVYHCfTIhWL7WVE6vycrQSYhocgD3AaNOumJGcVNMaLJaikPn4gWb2Pv3TOkB5xVe/eYn86VlV5licE5gNOgilkrj84yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVAZ9qZ5G8o9H3m+vA/lVirzaKdcZi3ZZ1l3ZRuToHo=;
 b=dFVtF+oNXzOEil2YCyUbXlaCo4W8+PWGQuoNn/ps1mS2y1htA26YuElNptx2DWhOJo689DDGq9wMXYQ8kHNH19g1xmZ4og4y/GfNIFYlmGSPZ3aEqqCurfHhw0ngVGHz2mTN69PIXppLD4EDCLpvhRh+Qdi+lZjJP7X6WSgEhxI=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH 4/5] automation: Add the script for the FVP smoke test
Thread-Topic: [PATCH 4/5] automation: Add the script for the FVP smoke test
Thread-Index: AQHaKRTRqeoumv0W/UiTEosHhxXqcLCenTGAgAAEDgA=
Date: Fri, 8 Dec 2023 01:56:18 +0000
Message-ID: <73EDF52D-918B-480C-9263-D8D6A0B06D57@arm.com>
References: <20231207135318.1912846-1-Henry.Wang@arm.com>
 <20231207135318.1912846-5-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2312071738200.1265976@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2312071738200.1265976@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6683:EE_|AM4PEPF00027A6B:EE_|GV2PR08MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb93eb6-77a9-4668-4193-08dbf790e62d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gvJ0+QyJRSiw+/EIHW/mDdmYIkw2xfLN9RCm4d3TtcKYtsCLCcGDIqGiXFfYC9r7Tq6HczBD3GZlwJDy41GP9raEddisIe3o9UMQjO8trfjGd05gQIRAveVA5VnPMPPgN/fqU+HUogIuo0buE/1zYcb4BgI2JxkZHXya4bzMsAOLDvkz9R7XLOmQ79P2t4rngPmz1mP84PgLbOVBS2j05zCj2UDNbm2A4LJGc1PQEHqAnYNq8wW9Y013Uu6uXm0VLIGPf4qICQ4OLeJK1XtzWUMB80wqSvGrYo4hjmUe6+46m1pVfh8D9gz2ULp3FGmxeO0/zMqxHbcOaYCoA9sFeyzY8Bsk8RUCmtwhb14AIxLsHkELKY1NsrrXzEkjlbLiMEroKVFC5poDeNksTMXWeuf9B149TVNWu31e59QUPqCOvF+g9ShptND+LhFmuI71eijGSvo2UfdbJvXRFvIpZ9LTulNW5CwKlcnTWtxs3qBFuCNCiYL1TMX4irLqO6B/kP4QFOgxVkIwPcwrcHBh58bSNQbj/mu3Q+ofJ5P1Pf+wECdnu4cdhQueEZ+suajiOUZmxtMq+7OEk6bdklQT3cPMxJ+GsWX7UJbHx2HkJQ4zM9CO0UFoYntipqu9+p6wgD4MvSIz5H2kg/bvt3U93Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6506007)(53546011)(478600001)(6512007)(6486002)(38070700009)(38100700002)(5660300002)(26005)(122000001)(316002)(86362001)(76116006)(54906003)(6916009)(66946007)(64756008)(91956017)(66556008)(66476007)(66446008)(71200400001)(4326008)(2616005)(8676002)(8936002)(33656002)(2906002)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8233EF2353CDB7428E0E67649822A7DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6683
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f30d4705-a263-4569-e6b2-08dbf790dea8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ll0iylQgo8pVow3UGMnwLncZ/QqoZ6IPZgcifvIHhESmfp/HhG4FjhkomytRE4StAUB+xTqT7GL1HOX7gBZRwM0DTq/XP0pDbJR+xKF/IvT6i+bPgmTXJbXBjaB8WQ2+7NCSvBC04LNDZplj1Wzk2tkFuCU2I5aFCvg61mxq8lcxjrCWVEHhhow4I/7EqXr+qUFIPBTk0h5mmkKBt8zWyost1x9XCZjr9VVy/jwzhyziSeKbbveMNe3Fgh+yhoAFtn+zuL3PezahW1hiVdHx+n2AgAhB3GWSNQtyb2Z1FJb7h6ArHzVuI6WhvLnEfHPcNmZc3Drsxdai1jC4lnDhl4d30qUZK3W5tK9W1xIwsO7hAb/8IZk9dObti0Lv0TQ2AVXN7Yt4WWIIdaQUMWy1Q5RdnpxBwKG5IsnnYm8FycvQpKCR7MaSmqdjGD57EaE7SaJ/IFNuNYYPmSC9wXBkgq4bNJKo7froubYmEUprlht2DEmzBlXgNDdU8s1mupTJD8HixXTw6YGKQGQRqV+8zH/O20mxNyIRpzMtw8ltufsDKUYP0iCfPyLrxdtWuvYkNIhRjAmvggDy26sajeRaKetiuKr23k2s148T32iuerVIphXVvY7m8RFx7SuswcM1OfE3KaV5I1ooRypp/tWxfVr36WaAEXatmprzjStyrJoA2cM9sl7ByA5umX8inri1pvKcxu+MRKOjd+QlJpxq38HVI9TCayvVSrJvckFvAA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(2906002)(5660300002)(40480700001)(4326008)(8936002)(6862004)(8676002)(316002)(70586007)(54906003)(70206006)(40460700003)(47076005)(36860700001)(478600001)(2616005)(6486002)(53546011)(6512007)(6506007)(36756003)(41300700001)(26005)(336012)(33656002)(82740400003)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 01:56:31.1665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb93eb6-77a9-4668-4193-08dbf790e62d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8677

SGkgU3RlZmFubywNCg0KPiBPbiBEZWMgOCwgMjAyMywgYXQgMDk6NDEsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDcgRGVj
IDIwMjMsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBzaGVsbCBz
Y3JpcHQgZm9yIHRoZSBGVlAgc21va2UgdGVzdC4gU2ltaWxhcmx5DQo+PiBhcyB0aGUgUUVNVSBq
b2JzLCB0aGUgc2hlbGwgc2NyaXB0IHdpbGwgZmlyc3RseSBwcmVwYXJlIHRoZSBEb21VDQo+PiBC
dXN5Qm94IGltYWdlLCB1c2UgdGhlIEltYWdlQnVpbGRlciB0byBhcnJhbmdlIHRoZSBiaW5hcmll
cyBpbiBtZW1vcnkNCj4+IGFuZCBnZW5lcmF0ZSB0aGUgVS1Cb290IHNjcmlwdCwgdGhlbiBzdGFy
dCB0aGUgdGVzdC4gVG8gcHJvdmlkZSB0aGUNCj4+IFRGVFAgc2VydmljZSBmb3IgdGhlIEZWUCwg
dGhlIHNoZWxsIHNjcmlwdCB3aWxsIGFsc28gc3RhcnQgdGhlIFRGVFANCj4+IHNlcnZpY2UsIGFu
ZCBjb3B5IHRoZSBiaW5hcmllcyBuZWVkZWQgYnkgdGVzdCB0byB0aGUgVEZUUCBkaXJlY3RvcnkN
Cj4+IHVzZWQgYnkgdGhlIFRGVFAgc2VydmVyLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBIZW5y
eSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+PiAtLS0NCj4+IC4uLi9zY3JpcHRzL2Z2cC1i
YXNlLXNtb2tlLWRvbTAtYXJtNjQuc2ggICAgICB8IDExNyArKysrKysrKysrKysrKysrKysNCj4+
IDEgZmlsZSBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKQ0KPj4gY3JlYXRlIG1vZGUgMTAwNzU1
IGF1dG9tYXRpb24vc2NyaXB0cy9mdnAtYmFzZS1zbW9rZS1kb20wLWFybTY0LnNoDQo+IA0KPiBU
aGlzIHNjcmlwdCBpcyBjbGVhciBhbmQgaXQgaXMgZmluZToNCj4gDQo+IFJldmlld2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQoNClRoYW5rcyENCg0K
PiANCj4gTXkgb25seSBjb25jZXJuIGlzIHRoYXQgdGhlIGV4cGVjdCBjaGVja3Mgb24gd2hhdCBi
b290ZWQgKFhlbiwgRG9tMCwNCj4gRG9tVSkgYXJlIGluc2lkZSB0aGUgc2NyaXB0IGZ2cC1iYXNl
LXNtb2tlLWRvbTAtYXJtNjQuZXhwIHJhdGhlciB0aGFuIGluDQo+IHRoaXMgc2NyaXB0LiBTbyBp
ZiBpbiB0aGUgZnV0dXJlIHdlIGFyZSBnb2luZyB0byBoYXZlIG11bHRpcGxlIHRlc3RzDQo+IHdp
dGggZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zIChmb3IgaW5zdGFuY2Ugc2VlDQo+IHFlbXUtc21v
a2UtZG9tMGxlc3MtYXJtNjQuc2gpIHdlJ2xsIGhhdmUgdG8gZmluZCBhIHdheSB0byByZXVzZQ0K
PiBmdnAtYmFzZS1zbW9rZS1kb20wLWFybTY0LmV4cCBzb21laG93Lg0KDQpXZSBkbyBoYXZlIHdh
eXMgdG8gcmV1c2UgZXhwZWN0IHNjcmlwdCwgZm9yIGV4YW1wbGUsIHdlIGNhbiBleHRyYWN0IHRo
ZSBjb21tb24NCmNvZGUgKHZhcmlhYmxlcyBhbmQgdGVzdCBsb2dpYykgdG8gdGhlIGNvbW1vbi50
Y2wgZmlsZSBhbmQgc291cmNlIHRoZSBjb21tb24udGNsIGZpbGUNCmluIHRoZSBleHBlY3Qgc2Ny
aXB0IHRvIHJldXNlIHRoZSBjb2RlLiBUaGUgcmVhc29uIHdoeSBJIGRpZG7igJl0IGRvIHRoYXQg
aW4gdGhpcyBzZXJpZXMNCmlzIHRoYXQgY3VycmVudGx5IHRoZXJlIGlzIG9ubHkgb25lIHNjcmlw
dCBzbyBJIGZlZWwgdGhhdCB0aGVyZSBpcyBub3QgbXVjaCBiZW5lZml0IHRvIGRvDQp0aGlzIGlu
c3RhbnRseSA6KSBMZXTigJlzIHdhaXQgdG8gc2VlIGlmIHRoZXJlIGlzIG1vcmUgY29tbWVudHMg
ZnJvbSBvdGhlcnMsIGFuZCBJIGFtDQpkZWZpbml0ZWx5IG9wZW4gdG8gcmVmYWN0b3IgaWYgdGhl
cmUgaXMgdGhlIG5lZWQgdG8gZXh0cmFjdCB0aGUgY29tbW9uIGxvZ2ljIChmb3IgZXhhbXBsZQ0K
d2hlbiB3ZSBhZGQgZG9tMGxlc3MgdGVzdHMgaW4gdGhlIGZ1dHVyZSkuDQoNCktpbmQgcmVnYXJk
cywNCkhlbnJ5DQoNCg0KDQo=

