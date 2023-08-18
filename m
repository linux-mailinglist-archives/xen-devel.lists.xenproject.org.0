Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D1780386
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 03:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585744.916905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWocS-0007m7-88; Fri, 18 Aug 2023 01:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585744.916905; Fri, 18 Aug 2023 01:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWocS-0007kV-4C; Fri, 18 Aug 2023 01:49:44 +0000
Received: by outflank-mailman (input) for mailman id 585744;
 Fri, 18 Aug 2023 01:49:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PpBR=ED=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qWocQ-0007kI-BG
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 01:49:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d125aab-3d69-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 03:49:38 +0200 (CEST)
Received: from AS9PR06CA0210.eurprd06.prod.outlook.com (2603:10a6:20b:45d::28)
 by DU0PR08MB9025.eurprd08.prod.outlook.com (2603:10a6:10:471::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 01:49:34 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::93) by AS9PR06CA0210.outlook.office365.com
 (2603:10a6:20b:45d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Fri, 18 Aug 2023 01:49:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.16 via Frontend Transport; Fri, 18 Aug 2023 01:49:33 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Fri, 18 Aug 2023 01:49:32 +0000
Received: from db506d88c465.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0351ECE0-0F41-4908-A71E-08C573AFD2CA.1; 
 Fri, 18 Aug 2023 01:49:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db506d88c465.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Aug 2023 01:49:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9765.eurprd08.prod.outlook.com (2603:10a6:20b:616::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Fri, 18 Aug
 2023 01:49:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 01:49:24 +0000
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
X-Inumbo-ID: 7d125aab-3d69-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jioOWt4ocyGlrcAFThCWardkZ4V3iVn88YdB7BghX3s=;
 b=t45DZi+bZIu5Ks5/Ap6D8D9Fnuqj6f1bw99nn6EYAweoKzrd0Ydl9hgAnWi8AJiWDbUNfi/zwZx/nALPJJZs6OlfMFf4bWZFxZMay+DQLnqe7NypJwOY6R+NYGXlHmIXLVZ5m1iVHyKUBWFY3IYlR+EY7qyv1y5XeTsKimUJNIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0401b5552db83e5d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6SSs4To/psyf1kVOxVGyyE4jjthnuDA9RVbHIrjIdtq/jGHCxRZL/binhk6FtQcCJirgnlzQ8HkAfJf3ZjkFJiR6Z/Jo2YdpPZmyADpqU6XDmYnB8uw05WT+yrMGmzRSkLujjv9CyfadDrGPQcCf+cG7S/r/qZalih5OxSajJ/mfmQzek8YwSX5vX/9vNg/g4aY+C17N7V2UZE3TR1rGcNgG5Joqcu1ufAw9N6BXs13bG1DBxP3WMqYfEM/hN/LDELobEG2PhyS1rFr77Ez9xY1ua94/9Z5G6i4KunTwaID0sC9hPLWFMAJ+o8Yjxa9L/U+BnjjSs6pXzsgZOAIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jioOWt4ocyGlrcAFThCWardkZ4V3iVn88YdB7BghX3s=;
 b=XnCxHPSZCE6xn2/DwoyceHJx16H9au+mjZvlYVKw/ySHa8E+/jr7Dps3cz94oAW7nqaGDiEMN1dgKU9vCmSJe3Dl/bqJ8zhIPeNCKC4ylkasWuVd9c4k/olpwFzEAQzS+3mmObYBTUKHNcO+I0AYozZNax2alviWI27Roiwci0f88oO/WIcYNWC7KUfPBVaK4hHfiERGlRIIiN3s3N1qHq9WXhRSYPIueORfpEOAFlTu8wbCho9V5+MP/eWzOOmSy/Lp4RbZL5/iHkOoDhQ5CypG82gK/JLUTNAr71SMaVwi6ZUf4IuUbcmUUkMQAnAcQ2Srn5X/7EkgHq8rGFxTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jioOWt4ocyGlrcAFThCWardkZ4V3iVn88YdB7BghX3s=;
 b=t45DZi+bZIu5Ks5/Ap6D8D9Fnuqj6f1bw99nn6EYAweoKzrd0Ydl9hgAnWi8AJiWDbUNfi/zwZx/nALPJJZs6OlfMFf4bWZFxZMay+DQLnqe7NypJwOY6R+NYGXlHmIXLVZ5m1iVHyKUBWFY3IYlR+EY7qyv1y5XeTsKimUJNIA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: vmmio: The number of entries cannot be
 negative
Thread-Topic: [PATCH 1/3] xen/arm: vmmio: The number of entries cannot be
 negative
Thread-Index: AQHZ0VP97r8wZqAQvEyfb9qA4JR+oK/vSbaA
Date: Fri, 18 Aug 2023 01:49:23 +0000
Message-ID: <975C04BC-1C6A-4DB5-B1C4-4D023DE654CC@arm.com>
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-2-julien@xen.org>
In-Reply-To: <20230817214356.47174-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9765:EE_|AM7EUR03FT027:EE_|DU0PR08MB9025:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0c5768-9ecf-4787-3a9d-08db9f8d5ecc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6QY2TqaTRhzE8AuPxaymASuuvltHgGWcOPGDNuJSw3nzqkErH/+wUsk6qLcP4VoKpIx061Nwd1Ubrij69I2YN21OuSV2STmGjtWfkm1Z3v1Y//HioJnTrMgMZf1qTpESCq1NDnaeVzS798JD9MrBuF8zrZTgCJHaTODcA1lJbDUfr2KmBxTFEEZs165PzdODZjIOzDh6IcGVyx//lvCdG8vnEsmv8Ok/yOE693FDcw9l65NuZdMFXlolrLjPWpUf+qYcKykrsIg68CxAxS5UviSWC8eGA+jWAqk1H+dcSek0i+6saKMxEWYsRZmT6wyp3WBCAasecm5FZbDGeHFYU2840RqO6pzVSsMBgrIVfrUiMohxUo4j8x0YyOmCUFuU3fu03snx/2w2e3aWjD8bCBA3iNCqiJmL9mtuhzXtvWDtTkEQGebMVl+o4fF81bgaqYxoELtX6YzegziD4HxdQRl+c2/ggmAME8KZv8XjZFKCFrrxpzGqA/+84O+eP3SPrlEBNkWDCNDAECzEC6jfsSl/kP6fOrVt3CMvYq+rWMS3TFFEj6W+oJk33wMhHUTKjL1SMpYfZ7YsHq08nLeF7metIAQZaL+SKJgyo4uXcq0k1dJVii4LKuylYEk8y+vLC14rrBhJFd3Okkr38GUbdg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(4744005)(26005)(86362001)(478600001)(6506007)(71200400001)(6486002)(2616005)(6512007)(33656002)(53546011)(36756003)(5660300002)(41300700001)(66446008)(122000001)(316002)(54906003)(66476007)(91956017)(76116006)(64756008)(66946007)(66556008)(6916009)(4326008)(8936002)(8676002)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D77C82F16F364846B6906D5ACC060005@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9765
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed5aec10-fdec-487e-4b81-08db9f8d5933
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZrrEtXPV98YBVxyEAf34RV/3zODKRCgsVuFBVFxcpumPGEFMe1c9Z18QBGFJD9sKhPZcLsX57hA2973lMSuNoMxjxxRdfwiEoODZRgibCLjO4Fzsy2x2gYwtK1lKCAB/gdLuqrSaZ7MnzXYiE/Irt66X1f5V15CmnfQhrpbLtMY11n5aUmSjXHc6BAhcKe36gvR49SmxvWdljus8pk7E1IO4bOUyil284lmpXQqUShrFLAQOu+2wjEN4FpIT2evUURiwRkozSxOTiNGNZZitP0nISbTg2urFmiOkFo+WhGAuROWvwgQNJ1zoVLK5znRhSdqt7Mwy8eMN2ArIxwu3amMjt+v3ysh4f4bDgEj0ODLFDkBuu+0hkomhkbAzxSH4llf79o+pis/5cjquB/hhpvqTA21j6V8u5wfkkAphnOwfWKTrlEgFf6fNtGtFYIzIQxpC1CzhF57z4r4RqH6L1Ww2ug9IRsGoP6L9UUSWio026PUFuKf3MxHwHK6/3nhGOhh2MKB42LKNmYNs4dCSa1dJ0+dLa0dJO46ccQE0+/26tbuAgilw8MWaMKF/vyAN4eLAiOIFByw+f9D0BJdRHAw0GFkpm1PySi8DzZwY686wwLkObuy+5u9mn2cR6xq7MOVe2NZOC9QF0RCGaVkIe9hjNlDTImcOt/tsy0hQvpnf3cKCF9zRHabv1RytxnGRaTjBvx5yUzL2ePtIUX20WRrZnjjsIZn7e+E6Rf6OhPM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(86362001)(33656002)(36756003)(82740400003)(356005)(81166007)(40480700001)(107886003)(2616005)(5660300002)(70586007)(478600001)(6506007)(70206006)(53546011)(6486002)(54906003)(316002)(26005)(6512007)(4326008)(8676002)(8936002)(41300700001)(6862004)(40460700003)(47076005)(336012)(36860700001)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 01:49:33.2079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0c5768-9ecf-4787-3a9d-08db9f8d5ecc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9025

Hi Julien,

> On Aug 18, 2023, at 05:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The number of virtual MMIO regions cannot be negative. So switch
> the field 'num_entries' and 'max_num_entries' to 'unsigned int'.
>=20
> The new type is then propagated to the caller and the vGIC
> code.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


