Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB477D74B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 02:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584154.914610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW4re-0004no-6p; Wed, 16 Aug 2023 00:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584154.914610; Wed, 16 Aug 2023 00:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW4re-0004l8-2P; Wed, 16 Aug 2023 00:58:22 +0000
Received: by outflank-mailman (input) for mailman id 584154;
 Wed, 16 Aug 2023 00:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vkqM=EB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qW4rc-0004l2-BO
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 00:58:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbd759d5-3bcf-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 02:58:17 +0200 (CEST)
Received: from AS9PR06CA0685.eurprd06.prod.outlook.com (2603:10a6:20b:49c::33)
 by DU0PR08MB9934.eurprd08.prod.outlook.com (2603:10a6:10:402::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Wed, 16 Aug
 2023 00:58:13 +0000
Received: from AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::6f) by AS9PR06CA0685.outlook.office365.com
 (2603:10a6:20b:49c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 00:58:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT036.mail.protection.outlook.com (100.127.140.93) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 00:58:11 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Wed, 16 Aug 2023 00:58:11 +0000
Received: from fa0c28a5558a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 708FC8DC-AAE4-4E36-86F7-2C4A622B3988.1; 
 Wed, 16 Aug 2023 00:57:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa0c28a5558a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Aug 2023 00:57:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB10111.eurprd08.prod.outlook.com (2603:10a6:20b:62d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 00:57:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 00:57:41 +0000
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
X-Inumbo-ID: fbd759d5-3bcf-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSI45SNvnP3HvoyGKGqZ0gBT0ZWUDBLe3XlpjiZhIfQ=;
 b=me6JKm76k4X8WwKsBbNJOgZCuWSXhdoS+aJ9EQQzAEW9AxPDLeMaAHUW86/YH33MA3MqIddK76bc2nOA6rT/mNVvzs0aFpsC7SEImBMPtzklb4bO49tWbVQchgK7ktMwD9AG8t61BdO+qGxOIapvngbpZFHUWIfmrk2GwbQhgLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d76b5464bc56474f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3qM4SMRKH2d7DFfkzi/ho8DlHorT6Ff3zy+HGXwo4SoGR02i56HNhV8LGwXL57xgPBZZTb71mzPZ7seEKZYHfcgD00O4Cf5LFqbJxU8CRQUlTOT6aPxT2TYSU0WE2rEuxsFU+SiXfw/A0YCwG6LmwBtW/b/NmP0mCA8+3dY0CCMyUCNZl14v3olcrlVKdeWlf8g4EOwXg/RT33D/bm2KdT6r1X/yrO9fmWtsbJhmuP3zVEzeCm2JrR+/DP9fI6DMQ/LIYGBdCrIPAdi6J+rkKBQmd3fjoUc0iDn7+Lr8/55saYBvZ5QhYr9dnLNRlmtqla1FOloMEgAj7Iq9DDraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSI45SNvnP3HvoyGKGqZ0gBT0ZWUDBLe3XlpjiZhIfQ=;
 b=mSBPjEAnPjcl2MyhrV55z8wUMNnPkqHyEYEsmuC6Db05KeojuqtsAmPFONTib45Ya2Uaa5orSNz2AxWNKB4iT3qg4CeMLdapLyrPfyPZjMTOmV8XOrVzUYcvw4YZZP3jd7mwWbcp0z8KWgxRLftfxFGnCv8yewMn19wLWHoFQpVqytQwPshx+B+RByaWw3E3vrM7zKkrAjqDTNF83j0ULA2TpZ5e2zByvyTOScinwbA04C8aqJeJVTXqg4kOkI2a+/5BfG9q5DplN7AoT/ZtGK+7Hi3oQGJi7EfS3XFx8lkm4odwkDyvp4PMTIQLAY5B5bGPwzsezSGA+YhrCgE2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSI45SNvnP3HvoyGKGqZ0gBT0ZWUDBLe3XlpjiZhIfQ=;
 b=me6JKm76k4X8WwKsBbNJOgZCuWSXhdoS+aJ9EQQzAEW9AxPDLeMaAHUW86/YH33MA3MqIddK76bc2nOA6rT/mNVvzs0aFpsC7SEImBMPtzklb4bO49tWbVQchgK7ktMwD9AG8t61BdO+qGxOIapvngbpZFHUWIfmrk2GwbQhgLM=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] docs: Drop warning about 2M limit for ARM
Thread-Topic: [PATCH] docs: Drop warning about 2M limit for ARM
Thread-Index: AQHZz5OxHT8OQs1H9kWyKs1vVdMBdK/sGhuA
Date: Wed, 16 Aug 2023 00:57:41 +0000
Message-ID: <F246E5B1-CDDA-4E2B-860A-F966E3096F7D@arm.com>
References: <20230815161425.2202782-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230815161425.2202782-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB10111:EE_|AM7EUR03FT036:EE_|DU0PR08MB9934:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c74b2a-e109-4778-9c8e-08db9df3dd1a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EVb2CO0+eCfAaef/Ky0jScnscau/jkqQm/UMYVEgqvMpiI+xnKBII2FhGNIqoss9wbcwoEJvKV2UL6sGbyMM5MBJ7z6V/nLC3Vx6DVhs3yCIf33yl9NnzjicuKvAaV0nY1P54mmGxYqJBDrkxSarsFDT0+tB3HH6dNw6Tn0L5FLrnN3YBk8v5JBaS8wQT37sEoPamgLfoJv5SIr7tSfyrOanO7LEfB+cSwpBM8TCJMG/R6/MuKPBBkcnuOIbeTyzs+RQh3J9q38VrI7RbtU8yxPnA2sT+o8d8WDCZjNbcX49Aouq6qP23z9xkkxyFVkG+tXeY7GMvi/UAUXdUm+cetUMcTzFh+GjCbz7ib3EhlhXAmQqre77NiWNjQYsEgZWO/0XANRFFsesYQ+wM/Fug7t1UG357n0cgIeKGdxzTEmc3KkgSL5J+SK/Y+odUOuiKJ+AXQtZEyp/dO+cNx05Qh/dB8fEwFNwq3kFAFpvmAesO7uks1ZJy+oVpFWqdxjv7v67/vjJrJFoNsT6TNx2/dN8Skm0zyvCH0oXIjl4OLbbyF1JWgnyjTIIFKCn/n49pXctJ0m/X3hvb96gyS0hrMeAXWQYNkcLFYq24YEmh6kMnCG1tTZfH8oZC3SSWOesAsW+9B9+GuEhJjrQJrBmIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199024)(186009)(1800799009)(122000001)(66476007)(478600001)(5660300002)(6512007)(76116006)(26005)(38070700005)(8936002)(6486002)(66556008)(558084003)(53546011)(38100700002)(6506007)(2616005)(316002)(71200400001)(91956017)(66946007)(54906003)(6916009)(64756008)(66446008)(8676002)(86362001)(2906002)(41300700001)(4326008)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7A0A87CA125995438A70E3D2806305E7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10111
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8df8b7a8-86b7-471c-b011-08db9df3cb3a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SqGa3owv2qRZHWSwQRGguC+9DiTuvn7KSac1466fi5z578lyufF/ePUDFRaAqhv2qIJkXUcwOJZGJFVBeIeH70uhfRSP22RFhcbFBGGCM/T7vAesmVYYBosWo814tfdMhmAiX/q8eMLnXjiYrC3OGzFnjUh7lFx2klRJFdgR+BLIujvoe4aRwrvgBOPhftPaeFFa80rquYjFiho4G5zI/0L1agjjjm/dKmUujxzH3vodKrDiaR8X5AHksLBx6qCcgxE7A+kA9QLYR+vc4dwm9uhEuDVUy8P/Kmt1Xm3UuaSCAqgX8J61CDCkPpOtkIi5jxb7fcCT2MySJhtR7EIr1g5SLrMN/BWybrQWpCzr825xYocaKWKq5DhpyBQdhSG6SWAqfRfqD2ZhexJmqbQiZH5SkT+t7auUEfvAZv0jPlgVDwtAaBerIWBQV/rRTWB2i9clhfn5LO/gw5PRrbITUvdUg8wr0RJ3wqIuaunBraxekiaWUjh5T+qQgqAsn3KLXOdDNsU/eiVOXp7iVLM/wK15/O87ZnmkiXKjYIPNpGukHMK8F8AbvC8kxVOjGSpHzh96DZPEwElxMTbJYr8ZLiidBkg25tbQHQ2GU21B/4DqLtdptrrnnblwXx978blQrq5hSbNKBKFgtvCO1x8dahdoRWea4EnBvLyn0j8CfGqH1nkkJ8e3txlQZBai8k4rlBln3rCy+U39dSLNslOe5Lm5bJVpOKlh0SjpKIpjduQJHMGtIQ4fZcre6jIq3bgG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(33656002)(5660300002)(54906003)(41300700001)(8676002)(81166007)(2906002)(47076005)(70586007)(40480700001)(82740400003)(6862004)(36860700001)(26005)(316002)(36756003)(70206006)(4326008)(558084003)(8936002)(6486002)(6506007)(356005)(53546011)(86362001)(478600001)(40460700003)(336012)(6512007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 00:58:11.4554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c74b2a-e109-4778-9c8e-08db9df3dd1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9934

Hi Andrew,

> On Aug 16, 2023, at 00:14, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> This issue has been addressed in the 4.18 timeframe.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

