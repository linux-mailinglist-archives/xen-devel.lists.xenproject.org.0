Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9048B7E32CC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 03:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628537.980107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0BVZ-0000HC-DP; Tue, 07 Nov 2023 02:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628537.980107; Tue, 07 Nov 2023 02:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0BVZ-0000EU-AX; Tue, 07 Nov 2023 02:08:01 +0000
Received: by outflank-mailman (input) for mailman id 628537;
 Tue, 07 Nov 2023 02:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7kXw=GU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r0BVY-0000EO-9O
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 02:08:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 780bdf9b-7d12-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 03:07:57 +0100 (CET)
Received: from AM5PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:206:1::38)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 02:07:53 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:206:1:cafe::b5) by AM5PR04CA0025.outlook.office365.com
 (2603:10a6:206:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 02:07:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 02:07:53 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Tue, 07 Nov 2023 02:07:52 +0000
Received: from cc0daed59e76.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D049E0AF-9AA6-432F-8FD6-0EE882536E25.1; 
 Tue, 07 Nov 2023 02:07:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc0daed59e76.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Nov 2023 02:07:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB10145.eurprd08.prod.outlook.com (2603:10a6:800:1ca::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 02:07:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 02:07:42 +0000
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
X-Inumbo-ID: 780bdf9b-7d12-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YN82b7fvQOJFIl02aSs2Lec4JL+Gt19mvXi98ps4JzEYyb1HUNGyctLggT6kryxdZ6046VA4Wln9NkKKpFRhjTZYuN6TwOMoFDFHN/9Eyt+17yJrTa+0B/IaCgxcaYSFPduZUTUirpkbn9Q68LvA/+thXvjmv1g03hauYvdhTYKj/d3f0jz2arkEVeqcLAhXyvHVGlkC5YNUGdIflgNMeo8E+C/APCVevHFKStQCjdHEJEN9BNyynD1XeQ2tNZ7M3Y2dO4mmmVciQ24RJ09ZtbC0ih2tBa48/mRYsNBdYFgfm/0VSQ781cTVDwDltuYfSoznytTPeW+uwcaFnL6iIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjUbt3yVydKt5NlzW28pp2dnE/6FBLz/CH7IGL5o6aQ=;
 b=Wybez+s+M4LRAaMpK9oQqbcDnmWmZ1MZ8CXbo3kkRvEUVC4Rsjorex+wJ+oOvHVAljS41ylDv0KHY/wDxOvf4Q+JWBhKNI5K2zQlN51SIvwhHb3npKEi5mgKGqDQ+41q+KWcqeGvPDgLDBv6CjCv34re42oP/rq9rCkzh9hJvosBVWhnQsXXWMZ5FKOwNDdvnCQ5lJMepIn9P9CHwjb5AOb0XsU6iU+AKB7lPiY4GDf//1XmE3GXsk6FlZ+OwMsD8gl94AfdPOC0od1pSMGfzq1bsase8aiLl4OzpthLjximqcsrQXxwmbMMugPq6z2321V/6azv1xtCH83u6w2QAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjUbt3yVydKt5NlzW28pp2dnE/6FBLz/CH7IGL5o6aQ=;
 b=ODtwUrxKnbROmSjHa38Ygi+K5g3J8s4lG6qItIN/7a/86E9QEE16PIFWYsdSP699ji5okq5XVgtvqOrdmi35WxlhDZksbqMcL8y+Ursc3S8fJ9GJBskQR7ra98isc0xf4FYgsUi7L7qCUUJ5I8HLy29LNGWUKTSfpG1ii/UAX5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 418c15c54cbf374c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7+IAwS0cNmKTBOQO9rA5a6tvraSq5eQ5bg0nATPu9IBbsKCI5wwnsyCHq1IwkgBbP4WqkAGI0jkMuXaYdAHndiSoN2GL4rMO8ln51gFHx/taJWH5kpDH5f8lhiIHPxLJdn59wWLKZD2OTEJEONb2ph9Tl6syQqbBoMyUL93nNQvBT+1er4X08TLXCDBqHnggMcNzV6krWVr11E2a50nWTvEqmZ8813ccPblqLfG51wy9wXlOe9iJgKLI8iwDnJpj5LL1dn+HJJeYG5Z2D5FB/8gYy9s/zZ6qYAH6SC9A2BBmsZSmjvOMOAu5EcsLmwNn5qsvs0N3C2128z+vHgayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjUbt3yVydKt5NlzW28pp2dnE/6FBLz/CH7IGL5o6aQ=;
 b=mpTIXlP+2raw7vjBbnB6iRPnBu4TindjvvG4kAcGO5kE4AOFNIbkT0Opp1RfdSRx6MIJ58arThsKV7hNSGfFG7dIU9tl062n/zXNX5ZS0NXr9Ns8BmB+UXdrUMq3A+RUg6HQVWzH3J1PWu++mzyRaiHozYFqrOveI1KyQMMDrF7Up71qshB9cgAkU4xdxlpo3Tj39/Bci6xM5bZynYUxOzoaKb6B77+83WJdoh+ieDnfjA44CRVPkK2X+3jsNGkFiG19/nwD/GZw/cWaEaRwgfiQiL3sCNKYVsdGUVig9kgSb6A+FVC1gbw4s5StuFTZP0AbYsC1zzs1w3DUE5LC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjUbt3yVydKt5NlzW28pp2dnE/6FBLz/CH7IGL5o6aQ=;
 b=ODtwUrxKnbROmSjHa38Ygi+K5g3J8s4lG6qItIN/7a/86E9QEE16PIFWYsdSP699ji5okq5XVgtvqOrdmi35WxlhDZksbqMcL8y+Ursc3S8fJ9GJBskQR7ra98isc0xf4FYgsUi7L7qCUUJ5I8HLy29LNGWUKTSfpG1ii/UAX5g=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v8 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Topic: [PATCH v8 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Index: AQHaBVa3sLk3IeHXfE+9kkvgtQfUTbBl2VsAgABkvgCAB1rXgIAAmrMA
Date: Tue, 7 Nov 2023 02:07:40 +0000
Message-ID: <D3DBD455-F704-459B-80E6-BA93B3A4149F@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-9-Henry.Wang@arm.com>
 <fcc12d0f-5529-4f2a-a721-f6f92410e5b7@xen.org>
 <EA7BFF62-76A3-494B-B3EF-67E0664F98E8@arm.com>
 <fc503d74-7b08-4802-8b23-4809369a4ddb@xen.org>
In-Reply-To: <fc503d74-7b08-4802-8b23-4809369a4ddb@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB10145:EE_|AM2PEPF0001C715:EE_|AM7PR08MB5525:EE_
X-MS-Office365-Filtering-Correlation-Id: 1deb5fab-a063-4e1f-f568-08dbdf3659ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hSeSpfw9fbRT9bOEcN+z9iKl1P83OIws9TOKLKuQdxlYuoErmlBLQ2d70LkPQxp9TQcaZXhH201yR/Bre2fjmWnSrdctXDbsT/9VswNjUvnKS68e6juZcVO1SW1mkcoCuOg6FaTfKkRHXkaNi86mcy1zsqQ3mWw0xPUM17tepNnY4BUYg+paJx46WWqwm5xj7yqSBzezplYXV3coFTpnMwfUOawWf0jZDlKzfVvRRkKIiaAYrAV7yujtH42bMxiBhqAP7NoHdr7WAVEZNSwtiF5qukp70+pZYa2hJ78ZrKPGXpAKBl83Q5ORUNQAZlCKf4RJPr6/xSq/7qZWHR3ha9vpVkMktDMxCTTbmstVLAjw5jxWV3TOdqKFKUAlotHbR/b1C3JbbwZ3dyRuJpnSAcJ67n7x7/Wm5Eb/Prx5o2HAyff47ppALJLNsekF8GM21ipHh+EeNx6VoUZ5MejNwtnPoNgeJJNVOvK4IO8yfUMASmgoZg/fJ6R927qJrjc5tHQ4sML37JPELlzh+DIYzx6gDXwXg+6GvGlcQ+7oyy3zzD9sXRD7tOpFPZHNGwgHON0/bfS9TEC/Hfn1FELdi6G2iz8eZFtfRC/mti8lIKgT6c7nZxrH2RPG1S7dw7fsEYwkOYRlcXuhv2DmZpt/Hw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(83380400001)(53546011)(91956017)(66946007)(6512007)(76116006)(26005)(2616005)(478600001)(6506007)(71200400001)(4326008)(8936002)(8676002)(66446008)(66556008)(64756008)(66476007)(54906003)(316002)(6916009)(6486002)(5660300002)(41300700001)(38100700002)(86362001)(122000001)(2906002)(38070700009)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C24652D1F50504C80ACC028ED9D8652@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10145
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45bc60fe-10a4-4b9d-6016-08dbdf365235
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X1cFU44neIpVLRKkOUHmWkAv2w9HHLhpimCzoFoWYgVYfBnBOfjDH3vHLNzp0sc+5GLSg86xTw6YAha5OGyfYkBY4s4nUMd3jAm30IWi0MiSGBRyJb3EhmSSg7JpsFJVafpb9YC3Gv0wEsVE4I/D1hTtKmwWYccP0CQkvo9Y8X/cMP4Gpx0RIT80n4jTd1fOMMB1kGGXHCeKG1MIC+V4uu9eYvvcxwA3sm2VcBoUHyK7YZ3A6w7aYyD+3JRdezPSmSbinfnGIe8U3sGiZHOKZlmCiPxmQgqC9qjRCP0ONrpqPgAfc34Mqye4N/UvZLUTMD1sctmgjfgQFIyvw06EXgMJNFZG+dsLERoEGxBI1X3KBg5ByaKayNNtLOzrfoPiCmagr9iR2q5fzrN4KciyXq7JtogiXDuzswpsDqU0TtuC1/ksmaONkylw1mH3++13iiI2rbBq4tqtqOc4CI42GIrOw1SJDIeTokvgxYXYvkaQpyVCZ2Cr00yI7mhLT4HEGQah/I5P4YyV9wSjZ/K+JrchSLr99POLxraaP/2VNVGvdtZ4Uhec++5uPAUxu/JBY9QGygccBjNgA6VI7HWA4+AqFfoIww8iH9WNANaNsS522ylfm+KwEh4MFy51123elJNRBvL18vOYGB9svCPvBrxwVidxG8HnOs3NjR8jISG6o820EAD2fhi4LiVKn9YPpv8x5QDspDLuaugUUdCCJwnfnF609/tFV5hxb0S48qWtNlEoA6ite2JQsnACsjHL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(40470700004)(36840700001)(46966006)(2906002)(2616005)(53546011)(6512007)(6486002)(478600001)(6506007)(83380400001)(47076005)(54906003)(26005)(70586007)(336012)(5660300002)(41300700001)(6862004)(8936002)(4326008)(8676002)(70206006)(316002)(36860700001)(33656002)(36756003)(82740400003)(81166007)(356005)(86362001)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 02:07:53.2583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1deb5fab-a063-4e1f-f568-08dbdf3659ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525

SGkgSnVsaWVuLA0KDQo+IE9uIE5vdiA3LCAyMDIzLCBhdCAwMDo1MywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSSB0aGluayB0aGUgc2VyaWVzIGlzIG5v
dyBmdWxseSBhY2tlZC4gQnV0IEkgd2lsbCB3YWl0IGZvciA0LjE4IHRvIGJlIHJlbGVhc2VkIGJl
Zm9yZSBtZXJnaW5nIHRoaXMgc2VyaWVzLg0KPj4gSSB0aGluayB0aGUgdGhpcmQgcGF0Y2ggInhl
bi9hcm06IEZvbGQgbW11X2luaXRfc2Vjb25kYXJ5X2NwdSgpIHRvIGhlYWQuU+KAnSB3aWxsIG5l
ZWQgdGhlDQo+PiBkb3VibGUgY2hlY2sgZnJvbSB5b3VyIHNpZGUgOikNCj4gDQo+IE9oIHllcyA6
KS4NCj4gDQo+PiBIZXJlIGlzIHdoYXQgSSBoYXZlIGxvY2FsbHksIHRvIHNhdmUgdGltZSBJIHdp
bGwganVzdCBzaG93IHRoZSBjb250ZW50IGhlcmUgZm9yIHlvdSB0byBjaGVjaywNCj4+IGFuZCBJ
IHdpbGwgcHVzaCBpdCBpbiB0aGUgbmV4dCBmZXcgZGF5czoNCj4+IGNvbW1pdCBiYTcyZDZkYzE3
ZmQ3Y2U5YTg2M2I5ZTAwYjA2YjMzYzA2OWM3NjQxDQo+PiBBdXRob3I6IEhlbnJ5IFdhbmcgPEhl
bnJ5LldhbmdAYXJtLmNvbT4NCj4+IERhdGU6ICAgV2VkIEF1ZyAyMyAxNzo1OTo1MCAyMDIzICsw
ODAwDQo+PiAgICAgeGVuL2FybTogRm9sZCBtbXVfaW5pdF9zZWNvbmRhcnlfY3B1KCkgdG8gaGVh
ZC5TDQo+PiAgICAgQ3VycmVudGx5IG1tdV9pbml0X3NlY29uZGFyeV9jcHUoKSBvbmx5IGVuZm9y
Y2VzIHRoZSBwYWdlIHRhYmxlDQo+PiAgICAgc2hvdWxkIG5vdCBjb250YWluIG1hcHBpbmcgdGhh
dCBhcmUgYm90aCBXcml0YWJsZSBhbmQgZVhlY3V0YWJsZXMNCj4+ICAgICBhZnRlciBib290LiBU
byBlYXNlIHRoZSBhcmNoL2FybS9tbS5jIHNwbGl0IHdvcmssIGZvbGQgdGhpcyBmdW5jdGlvbg0K
Pj4gICAgIHRvIGhlYWQuUy4NCj4+ICAgICBGb3IgYXJtMzIsIHRoZSBXWE4gYml0IGNhbm5vdCBi
ZSBzZXQgZWFybHkgYmVjYXVzZSBhdCB0aGUgcG9pbnQgd2hlbg0KPj4gICAgIHRoZSBNTVUgaXMg
ZW5hYmxlZCwgdGhlIHBhZ2UtdGFibGVzIG1heSBzdGlsbCBjb250YWluIG1hcHBpbmcgd2hpY2gN
Cj4+ICAgICBhcmUgd3JpdGFibGUgYW5kIGV4ZWN1dGFibGUuIFRoZXJlZm9yZSwgaW50cm9kdWNl
IGFuIGFzc2VtYmx5IG1hY3JvDQo+PiAgICAgcHRfZW5mb3JjZV93eG4uIFRoZSBtYWNybyBpcyBj
YWxsZWQgYmVmb3JlIHNlY29uZGFyeSBDUFVzIGp1bXBpbmcNCj4+ICAgICBpbnRvIHRoZSBDIHdv
cmxkLg0KPj4gICAgIEZvciBhcm02NCwgc2V0IHRoZSBTQ1RMUl9BeHhfRUx4X1dYTiBmbGFnIHJp
Z2h0IHdoZW4gdGhlIE1NVSBpcw0KPj4gICAgIGVuYWJsZWQuIFRoaXMgd291bGQgYXZvaWQgdGhl
IGV4dHJhIFRMQiBmbHVzaCBhbmQgU0NUTFIgZGFuY2UuDQo+PiAgICAgU2lnbmVkLW9mZi1ieTog
SGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KPj4gICAgIENvLWF1dGhvcmVkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPj4gICAgIFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+PiAgICAgU2lnbmVkLW9mZi1ieTogQXlh
biBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+IA0KPiBUaGUgY29t
bWl0IG1lc3NhZ2UgaXMgY2xlYXJlci4gVGhhbmtzISBGZWVsIGZyZWUgdG8gYWRkIG15IHRhZyBm
b3IgdGhlIG5leHQgdmVyc2lvbjoNCj4gDQo+IFJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoISBJIHdpbGwgc2VuZCBhIHY5
IHdpdGggYWxsIHN0dWZmIHNvcnRlZC4NCg0KTm90ZSBmb3IgbXlzZWxmIGlzIHRoYXQgdGhpcyBz
ZXJpZXMgc2hvdWxkIGhhdmUgc29tZSBjb25mbGljdCB3aXRoIExlb+KAmXMgc2VyaWVzIGZvciBB
VkEsIHNvDQpJIHNob3VsZCBkbyBhIHByb3BlciByZWJhc2UgYmFzZWQgb24gdGhlIG9yZGVyIG9m
IG1lcmdpbmcgdGhlc2UgdHdvIHNlcmllcy4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KPiANCg0K

