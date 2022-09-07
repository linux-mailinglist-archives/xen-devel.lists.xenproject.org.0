Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06615AFFBC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 10:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401036.642702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqtT-0002Vv-QC; Wed, 07 Sep 2022 08:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401036.642702; Wed, 07 Sep 2022 08:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVqtT-0002TK-NE; Wed, 07 Sep 2022 08:58:47 +0000
Received: by outflank-mailman (input) for mailman id 401036;
 Wed, 07 Sep 2022 08:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVqtS-0002Qn-CX
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 08:58:46 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47bf02ab-2e8b-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 10:58:46 +0200 (CEST)
Received: from DB8PR06CA0046.eurprd06.prod.outlook.com (2603:10a6:10:120::20)
 by DU0PR08MB7613.eurprd08.prod.outlook.com (2603:10a6:10:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Wed, 7 Sep
 2022 08:58:43 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::3e) by DB8PR06CA0046.outlook.office365.com
 (2603:10a6:10:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 7 Sep 2022 08:58:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 08:58:43 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 07 Sep 2022 08:58:43 +0000
Received: from 4df3b41a86f4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 435764A9-F89A-4CFF-BDDA-D835031EE94C.1; 
 Wed, 07 Sep 2022 08:58:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4df3b41a86f4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 08:58:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6612.eurprd08.prod.outlook.com (2603:10a6:20b:368::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 08:58:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 08:58:35 +0000
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
X-Inumbo-ID: 47bf02ab-2e8b-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dVe+VuNkzcYEIHg/UgvxOAXT240cQKJEXmZ8nHLhxRpauOkRyiQtl3Hp+4lUgAzSdyOJiFZWTWzT+xgX+BTP1lMvfbZ+1S5wNXEG7qEZoyo3l3oZW5uiMzONDrNSNbWU1KxHU2cKaUwteG9w3GU6zrxj+69viqCxBTzShRkcRR+eJRZOd7z9G2B9Qu/6njqRKjbIAtWSAkgRyCV7wCKMXyboaTFWUmqNI5Q6eKBR5B/WSY24zaXkGcljHNCoX+hDJGkhQ4hdkodYPr8JcrPoUhWlAk8fqfn90jpAjIHhD6DO8C9Z0uOY26q0AUXgID4Dya0kTj8peNgJYicV3S06Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTQalHre8kTdyfkbsxNJMXTvI9LYbIR6XJrpzwLJI4o=;
 b=FP15wW7KJUePFjK9MohGFyJkguvT5J0bHwETpmfRRlD1Y9mRWfTm/m+t/+zmpskTHdc+x1zLtbKAvY6nB2eCVjJZkihdaZgrv2qd4UsTh4OdHgeA5kmG7CExEjOBYuHLA+3KZNDkR7eYUxbg+gVKoL29vtxdynJvp1vmmO7dR4tjt97YtAQvh6IjiKvtBCT4FaB4HswIXXIJ8hbvs3dawsADWrpmeafhRCnPzkFD63V6Ka4NLkcxTGuv9Af9xbuZXN0+XeyhlIPo8AdnfUHUwBDJQDvOf6bbhzoOWTgVgWx2ifAZEvzgXzZ+pGYfXL4FI6BDyh42Si3J/TV7hNiRcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTQalHre8kTdyfkbsxNJMXTvI9LYbIR6XJrpzwLJI4o=;
 b=vKGCv6Lnt7Z5bqq+zSaZ40cmjT0/S7syFIAde39vtmd/xRulwZdRN9iGBedS8A2ZFLjyqC5S7f4dDwS/1dHCyqc9pfmZf+riUHN/sijDb6NyUstg/tfsk9DESDzztPxYCIIWV+V7s97BF8Sht/1OPz/D9wkDrewgEyTboSI5GRE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6afa02e7cd7fb197
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgNlEuP9dRBu99p7fwR9IGcQsS7AbDmvuS5e6Ha57/vCLlsSNNqK3xnMkRQ8SNgeM+/RyXIXRHRHqzjuSnQ1vRI1hOdAKR0QRdaX6ypc/UgUo0A+CjjEHH8+ER+LUaFg5Cq7asgOvmnlVLzrDKadyPb/Ki0l5x5OSMjF4Ygc4YAxygb+6NBE2bljclnboDHrbpuM5ru2G4c4/fJQnzK4aInjVfHDnFPnXNArpRtoL3MkdylDHaCu+NJT+gQvBaW0TtuUHArOxpzQGK3couQm+9j0T62wWnAKDW/0ZIHdZBRxqhWQrgOvTuI6N7Q686IJMRceEPaJSNXDkLDcbVTyZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTQalHre8kTdyfkbsxNJMXTvI9LYbIR6XJrpzwLJI4o=;
 b=JgjzlPXCcNnqieVtD+bzT8Z9VGmLF+Z39pfZe1Qk2KimROl5gkINjNpB7q9xp8g5KE76rlxjMcTZdji47UzifUwT18VXsnqqNIAWwsITetr7dIYp6DtNiWTeNaSvHJwYr8xIjZRGzdQcE1QBYoSn/HcXykfcC6npNGYoaQRnIO1bjnB+vRWa3FPhjLuzCFGbz8cViO1Ar839rujxLtlBbjFpwaSmvwaXVJWLh+UA3Q7kdBAnw6rBnYLpjqf2F2jIf3t9KwzdMBrYvvLr3fGjhJ2ZWc/TY7tbhwKlhgMVMsS8CIWIu6l0nasPziWQtQlTSA8LcOpFwOeLu8wLrnvtNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTQalHre8kTdyfkbsxNJMXTvI9LYbIR6XJrpzwLJI4o=;
 b=vKGCv6Lnt7Z5bqq+zSaZ40cmjT0/S7syFIAde39vtmd/xRulwZdRN9iGBedS8A2ZFLjyqC5S7f4dDwS/1dHCyqc9pfmZf+riUHN/sijDb6NyUstg/tfsk9DESDzztPxYCIIWV+V7s97BF8Sht/1OPz/D9wkDrewgEyTboSI5GRE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "leo.yan@linaro.org" <leo.yan@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Topic: [PATCH] xen/arm: acpi: Include header file for version number
Thread-Index:
 AQHYweQzyVikzADCFE2Bfo+zYT5rgq3ToyoAgAABNgCAAAHYAIAABH8AgAAAyoCAAAC7AA==
Date: Wed, 7 Sep 2022 08:58:35 +0000
Message-ID: <10E7EFB2-65A4-4092-9DC5-71825BC9595B@arm.com>
References: <20220906113112.106995-1-leo.yan@linaro.org>
 <d8ae8cce-0b05-a920-7439-3a6f5c3520f3@xen.org>
 <DFE32545-1B8A-4121-9D34-FE121CF4D3A7@arm.com>
 <79fa1351-18e5-0a54-c50d-c9b09a6b3d9e@xen.org>
 <5C05BF68-C788-47AF-A967-338875740D49@arm.com>
 <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
In-Reply-To: <57d2eb45-bdbe-02b3-4ada-10ff278d699b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aee3b737-2795-43cd-f468-08da90af2a9f
x-ms-traffictypediagnostic:
	AM8PR08MB6612:EE_|DBAEUR03FT063:EE_|DU0PR08MB7613:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J1kNXFrJHpu2EyK0twkRqH+fxTlKY0PtvhQ29M4zK3vxbh9n0HzVIvRf+mPc5+76Emwx88oFW/Y2pKp1How8XO/JCVZTLQA3fTBj72I1ceL+lnl7dvau/rflgGvYZWOvFlHA6q6C6TVuG/sLagnJ55foBXe70H/LmWsLQzQFvWIoZbRagadFh1ZrbqgrWKEgW/aN5vRC7NNperBhJz3L39hrSWalDsc7EJ6gZOJ17aw3C0hOkJheT8f9nG6AI1OfOkuEdL16iQiBO8TIvo15BYeBMc1b9S3rI5wfOU6rnhNuprLcYJxxW3EgeOCu5IBTaNU8FRjQixPZ57fTR2DR7TWzBPTVGse3ASNVXeP4ZVAFbAuQnOg5+LWwYVDFw7J2L1sgLMD3nMhEd8NzW5xglLQPG9t1ROf0Sjue1KO0HGg45eHm/N7mAZ249AKyI7SUoUVjyZidqgrtOELOyTu7WgpSgfDhn7vNjDF2Tme5nDDb2x+wVp2EsAi/mWC3/uThjXz7Zv+7JnhQOq6admJwKi/9z4PyLuV1eDo1V9c9P/0W5UmrfBhxd3WUPJnpPcLBVqhZD9ni7XJ43Za0loO4GdGVISankRqAe4xpU816oGonHkBFewlRxN4hcDA0uw9Zm1JwVlqslUJBPT1cRYkpluBUFCgPBpx/nWcY0vuHMMLX1s0wZ4t+QVAAg229VS0EsHFxHItpgiIqpsw0iqXJXV/Juc9iV4zrIZ4vwAQHLOTygYbzFyG5vQ3xx0oMkfaiu+M+4+KVwpY/SymVtuz5jYHEmGHTarUyKiNPCV+Yw70=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(66446008)(8676002)(91956017)(186003)(64756008)(66556008)(4326008)(76116006)(66946007)(66476007)(316002)(6916009)(54906003)(41300700001)(86362001)(36756003)(6512007)(2616005)(33656002)(26005)(38070700005)(5660300002)(2906002)(6486002)(6506007)(38100700002)(8936002)(71200400001)(478600001)(53546011)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <61CF122D1F00144093BF82066ACCFA7B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6612
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	284b6b6c-c9dc-47f0-f1b0-08da90af25a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BlLErwh4bIeiPPECl6SJFVtV5OqfHgu+NuljYvhrMB2ux1p/fY5MhLloy0YDB2jIZWqYushUDYiQcS8y9cDoew0c7HEVcJcDeK+x5D0Nkwax5BXfrHYhcMewNpcfLQGTIp7/5eGq+6TMqU38HlrJhngSnPO2kvGPS5uM80u4wM+TjmwjCktxYqY/zGqIfZ8elKOip27NyDxfyrrHzmqU0aSmxtQxEYsSfTJgwNYc7Il952MHh1pj2lXdAQOXwZO8BtCRFg1+9c/quGEkTTxbNNs/XXsWzcURGuFb4UeWOwYL7fnq6phKBHVaRy4cB1XvQnk9OPTkYCEOGIjGqjc9AJAf0o0PmM3Jx6gsUDSXuW+jhBBQ4fJ7FFUBG0yug0yIj0dyhAmhfBJnLS3PCHZ+5hA75LmEBcMGLSc5YaFFqUvj8Wf5GLE0XYQL3jnvrUA7X2VPbrG0TM47SExTz+oVviBLpSr0uua5i4htkpcRi0VVSI0Pc6YtBzPOYeNxNseAo4I6ywh0uZ8IFifR2tf5aXAYHfyduQXibjrOktMf1ePcy3opVPLkjl/Om7VCtInxI5n3+jUSrwbxGhqQTjPvN12CrREmAM1626cX4+OPB3OjHdgtAGKeaWNFP5Ds8q5rQebiNI5ATw9SGvdkXhI0Hr4T/GtMmtnd5a2ZvM3Tjuic6kTtsTGe9PW17LpwGvP8qxO1rFr7VujG03h+3Wl2YcWrlaiTrkmhqqbmDaMHJ8RB42hiOiipprkC1ix140TIy+yXYfCCiV3bq7OhtAdcGQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(46966006)(40470700004)(8676002)(8936002)(5660300002)(2906002)(6862004)(356005)(4326008)(70206006)(70586007)(86362001)(36860700001)(81166007)(82740400003)(54906003)(336012)(186003)(6486002)(478600001)(316002)(41300700001)(33656002)(53546011)(6512007)(26005)(47076005)(40460700003)(36756003)(6506007)(82310400005)(2616005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 08:58:43.4992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aee3b737-2795-43cd-f468-08da90af2a9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7613

DQoNCj4gT24gNyBTZXAgMjAyMiwgYXQgMDk6NTUsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNy8wOS8yMDIyIDA5OjUzLCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4+PiBPdGhlcndpc2UgaWYgd2Ugc3RhcnQgYWRkaW5nIHRob3NlIGtp
bmRzIG9mIGNoZWNrcywgd2Ugd2lsbCBoYXZlIHRvIGFkZCB0aGVtIGluIGF0IGxlYXN0IDMgcGxh
Y2VzIGluIHhlbiBjb2RlLg0KPj4+IA0KPj4+IFRoZSBzb2x1dGlvbiBJIHByb3Bvc2VkIGFib3Zl
IGlzIGVhc3kgdG8gaW1wbGVtZW50IHJpZ2h0IG5vdy4gTXkgZ3V0IGZlZWxpbmcgaXMgdHdlYWtp
bmcgX19zdHJpbmdpZnkgKG9yIGVsc2UpIHdpbGwgdGFrZSBhIGJpdCBtb3JlIHRpbWUuDQo+Pj4g
DQo+Pj4gSWYgeW91IChvciBMZW8pIGNhbiBjb21lIHVwIHdpdGggYSBzb2x1dGlvbiBxdWlja2x5
IHRoZW4gZmluZS4gT3RoZXJ3aXNlLCBJIHRoaW5rIHdlIHN0aWxsIHdhbnQgc29tZSBoYXJkZW5p
bmcgZm9yIGJhY2twb3J0aW5nIHB1cnBvc2UuDQo+PiBJIHRoaW5rIGEgZGVmaW5lIGluIGNvbXBp
bGUuaCB1c2luZyBzdHJpbmdpZnkgaXMgdGhlIGVhc2llc3Qgc29sdXRpb246DQo+IA0KPiBBaCEg
SSB0aG91Z2h0IHlvdSB3ZXJlIHN1Z2dlc3RpbmcgdG8gdHdlYWsgX19zdHJpbmdpZnkuIFRoaXMg
aXMgLi4uDQoNCkFsc28gcG9zc2libGUgYnV0IGEgYml0IG1vcmUgdHJpY2t5DQoNCj4+ICNkZWZp
bmUgWEVOX1NUUl9WRVJTSU9OICJfX3N0cmluZ2lmeShYRU5fVkVSU0lPTikiLiJfX3N0cmluZ2lm
eShYRU5fU1VCVkVSU0lPTinigJ0NCg0KUXVvdGVzIGF0IGJlZ2lubmluZyBhbmQgZW5kIHNob3Vs
ZCBub3QgYmUgdGhlcmUuDQoNCj4+IEFuZCB0aGVuIGNoYW5nZSB0aGUgY29kZSBpbiB0aGUgZm9s
bG93aW5nIHNvdXJjZSBjb2RlIHRvIHVzZSBpdDoNCj4+IGFyY2gvYXJtL2RvbWFpbl9idWlsZC5j
DQo+PiBhcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jDQo+PiBjb21tb24vZWZpL2Jvb3QuYw0K
PiANCj4gLi4uIG11Y2ggYmV0dGVyLg0KDQpUaGFua3MgOi0pDQoNCkJlcnRyYW5kDQoNCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

