Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE25559406
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 09:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355287.582864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4day-0004Ng-FQ; Fri, 24 Jun 2022 07:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355287.582864; Fri, 24 Jun 2022 07:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4day-0004Kb-Bu; Fri, 24 Jun 2022 07:19:12 +0000
Received: by outflank-mailman (input) for mailman id 355287;
 Fri, 24 Jun 2022 07:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SV4E=W7=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o4dav-0004KV-QN
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 07:19:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50069.outbound.protection.outlook.com [40.107.5.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eebc864b-f38d-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 09:19:07 +0200 (CEST)
Received: from AS8PR04CA0067.eurprd04.prod.outlook.com (2603:10a6:20b:313::12)
 by PR3PR08MB5756.eurprd08.prod.outlook.com (2603:10a6:102:90::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 07:19:01 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::5c) by AS8PR04CA0067.outlook.office365.com
 (2603:10a6:20b:313::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 24 Jun 2022 07:19:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 07:19:00 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 24 Jun 2022 07:18:59 +0000
Received: from 70c99ec0491b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A7A5D83-3CE8-4A4F-9001-0AF40FB6B59E.1; 
 Fri, 24 Jun 2022 07:18:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70c99ec0491b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 07:18:50 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM9PR08MB6196.eurprd08.prod.outlook.com (2603:10a6:20b:283::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 07:18:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 07:18:47 +0000
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
X-Inumbo-ID: eebc864b-f38d-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EJKkbG9e6olcuomH8M4sCiF1Klw5ap9LexGYbfiUYiDbGpSgkqSPQ1HcHj3z54Tbam79PgzaaO4vIoo6ozjJrAGC3LY+GUgEpJ33OoQgggiQKug5n+pw9t596uMYtyOWXgG/H2h3HthPA6iTzUONzWUnsTETmGnOP7t2fXghQ4hGRuue66qPBnEBbIoTHStnufVwUE5lYgrEqRbl3zzv7wrnW8gPVJiWxkK8x1rxWV/p9RKZsd1vZcT5wYUDfsRumwUQNJbEVsIDiqf4LHuQ+nwz06pV01tNzhC9gfVMg+ks3Gtu58Rw8W1fdFQxQ2IMKyqA7omCZxiW2lOz3VnaiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VavmEi37OZUroXHyeVtCogpRzg00xa26FE5rlldmerY=;
 b=QRIOSneN2jbUBMLsfeJ2ncyb69SSpZtKmLgKD+/SCtGQW7gudxIRt8JLQAUMyGpAOketbeKz3b6hJ145QVkYulwi5lKNymvXV7f74d2Wen6xhvycw/wP8RRP98liq84N6sz7Xcgqx0I7Y8HM4V8muHfyU+LhWUTwZa6TY4koeAe2lvKZQdes1FLMTMusvBinJq5EVJemiy6FQsv5Dy6PWN+Q9urB863AVL2yqSD1ZSqmnamGARH+MXMsl1C7lSQIGVjNjKSjF0NXRrs8S/yoR/bp3dzSQB99s0DYhTHcnx2SCqJk7CcXfhyzjpgn8XCvW9gr9Ui0RhSwA+LWBe7VvA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VavmEi37OZUroXHyeVtCogpRzg00xa26FE5rlldmerY=;
 b=lUVKlXCJwOjxhNaH3pe7f4tUVmXXAgXsa3zd+c0OMbZhhM/PPPPsErOsNxApxGCNBOlzPXBbmnkqtSAhWKxTTJhKxIxSJyX9tHg6gpLsFoOc7USipx3bcz86nEKa2UltHNA+/7IrbscgVOv19/ZDK9B9eJztqIwbuCmiTymyFIw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXlx62mNybQkSuKf/W/wse2tYqlQdkoAESv8kkox4Hn7F4lHPveUYTOtAKxh2qO+LPTr4x9KoOpuHmDc1W5xQ66f5Q/c7QbcBQMDNId+Qsuynf6tuWz/LtlQPceM+90iP/FlB8jgGTVM1PDJ7EjzbEQGArzBp/vx+1mg9fb8CA7trqIM8IMPn6azqljMnyeOhmVsmVcveQu/3k0CYwwoulO42F1HylCL78Vu2A5ZP6qzJBUy/S5eCyn+OWzLfx3s+DbuovD79l0zJulhKEcis/MaHpojdf3GPUskeh/n+x5TSCzmGQqX8PWEpXpQyq2u4IhZ5kZPmpJTO+z497g64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VavmEi37OZUroXHyeVtCogpRzg00xa26FE5rlldmerY=;
 b=jub4dJrmZYKD/nyrVOuJehVhdRkDiEMTpD32+y2KW69p1GP3tPP6SuorljbdFvynO29Pv4g82k6E+SUINHuv1v3TEnhG2O/fP2HLNYxwkicFzHywAUDjffMj7Y9iGVfiNEYhA0wSH1kjAwklATnEOgXPsqABs00ZLohXzTXssY0K8JOaKtzVSKBXCpK5u6yXIGSwvZ0M7DWJe/weVC5/gKO1eX45z7SdxZ5enxvjrO6e5gC878iyMjlq/CUKSqKxocMjA3gfS73z8o/L0jDenxc7ZgpfgxjL5QP5n8BV0Edsm/l0itAyuLVygT3qJ39dORql5et1pB1NSg1LPESjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VavmEi37OZUroXHyeVtCogpRzg00xa26FE5rlldmerY=;
 b=lUVKlXCJwOjxhNaH3pe7f4tUVmXXAgXsa3zd+c0OMbZhhM/PPPPsErOsNxApxGCNBOlzPXBbmnkqtSAhWKxTTJhKxIxSJyX9tHg6gpLsFoOc7USipx3bcz86nEKa2UltHNA+/7IrbscgVOv19/ZDK9B9eJztqIwbuCmiTymyFIw=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jiamei Xie
	<Jiamei.Xie@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Index: AQHYfI531SRNO5A+8Ei3iOFoJrK02K1dB3iAgAE0OjA=
Date: Fri, 24 Jun 2022 07:18:47 +0000
Message-ID:
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
In-Reply-To: <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1C3B082F10D5EE41B9BCC9E920E906A1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 52b0e99b-e664-4205-18e6-08da55b1cf40
x-ms-traffictypediagnostic:
	AM9PR08MB6196:EE_|AM5EUR03FT032:EE_|PR3PR08MB5756:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IEHfbsGEAqsycCMPy1tUBGD83ycZFPh9g+ic8RoTMuMxp4YkrcFk56GuVQ4kQc2cpJLIGuEi7cDWUTe3j3yRP1Kqv/OnAcwaSQNBkqoxN6BonjO/riHP+jQ4hjvBWt7mtx2uMzvskeChqizjFv1bRzkjmHRNG93e2sH06DmHovwuZKzB9LIQtLfNpAaSFp+q1wEYkJ9z3uuwPNXiGiigbHciq6wr8MOdOs2ofKR0zJjKuuahzkKVEReFqca2+V9bE+KVgRepJAPFj6kIxMJS8802fNBGbYEansNZG+KCTMjmgDck7o1NE7xGbS4XkBA8R1Wj0nYOhgJEHOAzq3uVRpSI9LX6mJ9uaJ/1ax5HLy91RksGjOy3d2GuCe+zteFY1sW1pJW5ImxdS6WG0iu4pmpjt/B+HfFHLXRGuh2EzOPz8z4bvmTFkwPRKx5EsA+hIYvjW0D83ht08TDe/Dg+d/neuxmTkwDu6c0jehqo9WpKrD0BcbhtubyGclHi7ec6LIGZ1ND5LHN6vynbDiiXkvEN0zlr7YwUANB222PVWfkYzdmRXkE1VybFM8YjC/FDMRm4T3s2g1SiXcHs2/GG7B/M7AixWEh3O3TMUr0VKeUcfMlYtEvNYinv5YnCAsX+woi9LoADCqceGEmWGjNRXTymMbxhfrY5eJfx/ooKuSP9RsQLefKL2X8IG+QOCfnfll8q2MX0hUQlIaRbmm5iFSnrZW0vuAE4Ob4dOy0SmXSjjhhdJnQuowiHKvcwt7e2wtyNXjgx2VmheBO9pwNeudJV5TxKonrA6KlI+BKnbqU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(6916009)(8936002)(38100700002)(2906002)(316002)(122000001)(54906003)(55016003)(86362001)(8676002)(66476007)(6506007)(66446008)(66946007)(66556008)(64756008)(7696005)(83380400001)(53546011)(9686003)(76116006)(4326008)(41300700001)(38070700005)(26005)(186003)(52536014)(71200400001)(5660300002)(478600001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6196
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1fa8474-2d88-49e4-30a4-08da55b1c787
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NImAuAI2/HoT9X7rCqjmquEBg0JH8ukHy8p7Ke3dFWgtj3G91kMv4KQNVVzEPzRWACFNERIv6SY/iHGk/SQ451WH7WXqiuQoQmPAVDCKF5XPivYU/etFt0nCkfwUSMTkJjb5NZoLh2LvDifaqhhm65nw4ZWKni3qqb+5U5BL8ady++gprvqk0WBEJo93v0I3iHKcP9092eUrQhm2/ore5RBCL/qtpVFELIOU/bIDegqnU7lJqE99CgJcMtsFCD39n2Woj2c3Shw1cERZLmI7f1F4vkKgBnYgKNqpaJ92fkC/8ryH+kMDqDEk3dgPNcdx/mavEHk3FtxeBQEvYXm9iRCM00C4VjkQELoUGi7E3ANFPFgHzkOHryT+gIc/WsDsA+nC2pa0nhOEK6mioS0xMS0obJeHlb/bhc/4mjhvzE0Pz0VOOgOEMyTKJlrUesG0uGpobWc40qPFx4xMim2yWOtdaLT0qiEWXUHAS83KeUua8aB7upGfjVTKrJAfePF7Jgi6W4FQ9TxsFBK58oZjrBqWutgAM1o6OSw2IK4xeEkrgBaae85lLGzb5wvPnJyfv9ufhoVNDcKmUaH5lujoc6xWcSVA7VUA8mfEPHJ2+Gs1rCKjNpvKQQOv1xWQsEN9CSVnqUz6I8xqPpQ9OxHJ+tt16PRfxReBfQh+19mdxM9Eq6kyRKlNvKqUIEik1wqCpIqSCTdDwqRB7N41vxjt3WlgOfCNb/44yl6+YnwJF0IoBUzYnbXzGJhE/FgH614uywirG0K/Sp4Q4tpdDXiwy21ZBiYd9Sfobi/01yFZh/E=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(40470700004)(36840700001)(46966006)(83380400001)(47076005)(336012)(41300700001)(186003)(81166007)(82740400003)(356005)(36860700001)(5660300002)(6862004)(8936002)(4326008)(8676002)(52536014)(82310400005)(55016003)(40480700001)(2906002)(478600001)(26005)(9686003)(53546011)(6506007)(7696005)(316002)(40460700003)(70206006)(70586007)(54906003)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 07:19:00.0378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b0e99b-e664-4205-18e6-08da55b1cf40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5756

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDbmnIgyM+aXpSAyMDo1NA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbg0KPiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkNCj4gTGl1IDx3bEB4ZW4ub3Jn
PjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvOF0geGVuOiByZXVzZSB4
ODYgRUZJIHN0dWIgZnVuY3Rpb25zIGZvciBBcm0NCj4gDQo+IE9uIDEwLjA2LjIwMjIgMDc6NTMs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPiA+ICsr
KyBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPiA+IEBAIC0xLDYgKzEsNSBAQA0KPiA+ICBvYmot
JChDT05GSUdfQVJNXzMyKSArPSBhcm0zMi8NCj4gPiAgb2JqLSQoQ09ORklHX0FSTV82NCkgKz0g
YXJtNjQvDQo+ID4gLW9iai0kKENPTkZJR19BUk1fNjQpICs9IGVmaS8NCj4gPiAgb2JqLSQoQ09O
RklHX0FDUEkpICs9IGFjcGkvDQo+ID4gIG9iai0kKENPTkZJR19IQVNfUENJKSArPSBwY2kvDQo+
ID4gIGlmbmVxICgkKENPTkZJR19OT19QTEFUKSx5KQ0KPiA+IEBAIC0yMCw2ICsxOSw3IEBAIG9i
ai15ICs9IGRvbWFpbi5vDQo+ID4gIG9iai15ICs9IGRvbWFpbl9idWlsZC5pbml0Lm8NCj4gPiAg
b2JqLXkgKz0gZG9tY3RsLm8NCj4gPiAgb2JqLSQoQ09ORklHX0VBUkxZX1BSSU5USykgKz0gZWFy
bHlfcHJpbnRrLm8NCj4gPiArb2JqLXkgKz0gZWZpLw0KPiA+ICBvYmoteSArPSBnaWMubw0KPiA+
ICBvYmoteSArPSBnaWMtdjIubw0KPiA+ICBvYmotJChDT05GSUdfR0lDVjMpICs9IGdpYy12My5v
DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2VmaS9NYWtlZmlsZQ0KPiA+ICsrKyBiL3hlbi9hcmNo
L2FybS9lZmkvTWFrZWZpbGUNCj4gPiBAQCAtMSw0ICsxLDEyIEBADQo+ID4gIGluY2x1ZGUgJChz
cmN0cmVlKS9jb21tb24vZWZpL2VmaS1jb21tb24ubWsNCj4gPg0KPiA+ICtpZmVxICgkKENPTkZJ
R19BUk1fRUZJKSx5KQ0KPiA+ICBvYmoteSArPSAkKEVGSU9CSi15KQ0KPiA+ICBvYmotJChDT05G
SUdfQUNQSSkgKz0gIGVmaS1kb20wLmluaXQubw0KPiA+ICtlbHNlDQo+ID4gKyMgQWRkIHN0dWIu
byB0byBFRklPQkoteSB0byByZS11c2UgdGhlIGNsZWFuLWZpbGVzIGluDQo+ID4gKyMgZWZpLWNv
bW1vbi5tay4gT3RoZXJ3aXNlIHRoZSBsaW5rIG9mIHN0dWIuYyBpbiBhcm0vZWZpDQo+ID4gKyMg
d2lsbCBub3QgYmUgY2xlYW5lZCBpbiAibWFrZSBjbGVhbiIuDQo+ID4gK0VGSU9CSi15ICs9IHN0
dWIubw0KPiA+ICtvYmoteSArPSBzdHViLm8NCj4gPiArZW5kaWYNCj4gDQo+IFRoaXMgaGFzIGNh
dXNlZA0KPiANCj4gbGQ6IHdhcm5pbmc6IGFyY2gvYXJtL2VmaS9idWlsdF9pbi5vIHVzZXMgMi1i
eXRlIHdjaGFyX3QgeWV0IHRoZSBvdXRwdXQgaXMNCj4gdG8gdXNlIDQtYnl0ZSB3Y2hhcl90OyB1
c2Ugb2Ygd2NoYXJfdCB2YWx1ZXMgYWNyb3NzIG9iamVjdHMgbWF5IGZhaWwNCj4gDQo+IGZvciB0
aGUgMzItYml0IEFybSBidWlsZCB0aGF0IEkga2VlcCBkb2luZyBldmVyeSBvbmNlIGluIGEgd2hp
bGUsIHdpdGgNCj4gKGlmIGl0IG1hdHRlcnMpIEdOVSBsZCAyLjM4LiBJIGd1ZXNzIHlvdSB3aWxs
IHdhbnQgdG8gY29uc2lkZXIgYnVpbGRpbmcNCj4gYWxsIG9mIFhlbiB3aXRoIC1mc2hvcnQtd2No
YXIsIG9yIHRvIGF2b2lkIGJ1aWxkaW5nIHN0dWIuYyB3aXRoIHRoYXQNCj4gb3B0aW9uLg0KPiAN
Cg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB3aWxsIHRyeSB0byB1c2UgLWZzaG9y
dC13Y2hhciBmb3IgQXJtMzIsDQppZiBBcm0gbWFpbnRhaW5lcnMgYWdyZWUuDQoNCkNoZWVycywN
CldlaSBDaGVuDQoNCj4gSmFuDQo=

