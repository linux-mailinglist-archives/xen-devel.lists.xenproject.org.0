Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB814313C6B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 19:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83013.153685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AwJ-0006sh-Gp; Mon, 08 Feb 2021 18:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83013.153685; Mon, 08 Feb 2021 18:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9AwJ-0006sI-DN; Mon, 08 Feb 2021 18:07:11 +0000
Received: by outflank-mailman (input) for mailman id 83013;
 Mon, 08 Feb 2021 18:07:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oudU=HK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l9AwH-0006sD-OQ
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 18:07:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b587996-0912-465d-8841-847419767d62;
 Mon, 08 Feb 2021 18:07:07 +0000 (UTC)
Received: from AM6P195CA0087.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::28)
 by AM0PR08MB5523.eurprd08.prod.outlook.com (2603:10a6:208:17f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Mon, 8 Feb
 2021 18:07:04 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::cf) by AM6P195CA0087.outlook.office365.com
 (2603:10a6:209:86::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Mon, 8 Feb 2021 18:07:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 8 Feb 2021 18:07:03 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Mon, 08 Feb 2021 18:07:03 +0000
Received: from 342238e23383.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B266FBDC-0358-44F3-BD63-B6DD50E41F05.1; 
 Mon, 08 Feb 2021 18:06:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 342238e23383.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Feb 2021 18:06:41 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6202.eurprd08.prod.outlook.com (2603:10a6:10:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 18:06:39 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 18:06:39 +0000
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
X-Inumbo-ID: 8b587996-0912-465d-8841-847419767d62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0/3jX6KzFfFsjKfa2HZ9RmN8D8cy6Ubu3tZljfLVVQ=;
 b=6KwB7MDrKLFHtCt5fHA84CzhoBFciwp5XqG9wZNbiaLnR5asv5+SfS7+/nBVol+zXm00no1ayDg/zJLZGq6e36iRlaVtm2npOzSqQIPX8A4MMEWUwqdYirQ+ZTvfZeYp5isvKc8PQ8/PiPth81O6/YCZK3G6WrJhyx2cj7YgS2A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0d826f09d5bafcd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPEN9LvjwGTXYO2lW2SagdjD2aHSAsOJRGc0WhapZ47Q/XtLcuySzWMWvbBgbI0d0dfIEt6XhCwF12l8xY6iaAgwoQ2xohc2gLxn+STZfhuvIEdipUZ6O16UJCI2wZlECWdE4yWYu4PnfxQbXY9mzCFBaq1lq1QDCvKKDtog6p7o7GKdWFIgkfY4Rav9FnXj7cKbxvILAb5JgbAJ7p6R/fKoUz1XPYF23iiTDWkUzwF2G91E9Jb6yBjOk0442z97WuChuOK9EItZ0xhBBsX7VvvAg6mODzWT6ZqIAUXKn+McyXWI9IjZ2qWaN4XVXfU2vvYaEThFpKjm0nO5U47rXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0/3jX6KzFfFsjKfa2HZ9RmN8D8cy6Ubu3tZljfLVVQ=;
 b=Xi2AmpwMdwTBwnrmQRz1yAAbJa7r84XaN4/lecqy8rg2aYzZXtV8e5UmzpiBXpiI/+nnPAJVv5ijdhjTi9WS86eMUWYo8/A4kN4szAzIzCTvJvWicLBLk5KeIZvAaeqsBAwlGtqcyO7jhqtLdz7HLyBSVlGZo5ck7eH2rNJpp2ho0R+HkReJCK0duzA+86YrIv29v6/xi6WmIVX5noyu8r0FCM0xr3JtSV7UshCCmBIdmwRFG4w81Zyn/EbrjsQIXh/4NEqxogfV4LzWS9FBof4Hz1dMh5kuz5MRD+mLXHQcfrIVEca73gHxMJTt5SfZx3cLmR0nfIpDPcZRamOtzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0/3jX6KzFfFsjKfa2HZ9RmN8D8cy6Ubu3tZljfLVVQ=;
 b=6KwB7MDrKLFHtCt5fHA84CzhoBFciwp5XqG9wZNbiaLnR5asv5+SfS7+/nBVol+zXm00no1ayDg/zJLZGq6e36iRlaVtm2npOzSqQIPX8A4MMEWUwqdYirQ+ZTvfZeYp5isvKc8PQ8/PiPth81O6/YCZK3G6WrJhyx2cj7YgS2A=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/CCVIBhvrRIcEE2wSNDNMu6y5KpOkgeA
Date: Mon, 8 Feb 2021 18:06:39 +0000
Message-ID: <C36DCA9F-1212-4385-AE66-7D41C586A313@arm.com>
References: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef40cdd8-359b-4000-4598-08d8cc5c56be
x-ms-traffictypediagnostic: DBBPR08MB6202:|AM0PR08MB5523:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5523CA6EAC538973308F1148FC8F9@AM0PR08MB5523.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wStW8CTVsGdIWLaLSwuDzm/6bDKqmrbAtZ5UjwtPSU/OM31MVocax2i7AcShGsB4qmNmwPHcTmKZjpsGfGMxi42nM9DhTIqNCAVVJIvLV2b2KrHqII++PE4QnuI2ZCzuvcW1Pshogk08v/fGPcnMhmtcRkflhukvYwlcZTIYbM43qqK7YNK5xjJ13wkNbYF2uKbWcatGAeWk2fOOTg7vGxHkMlyY5W3bZMsFoylsMGXDnVqB4G2UF2Mtm5va7//Pgvda4OrjsRlCqVXKXdKVebL/ttC2OUfrc8z3pxN5qpYG685saMJkBeTZeoJfkucArJlYyf9zf9Th/LagOB2b195hVYQOiwEO/FcZ00wEhO6gWKuBsMACetdy1kpqwgwR7D9jqC8YMUmMFr/5w7SYJf0DayTPSKgjoGlzVkxYsB6p+N4MnsVZkvLX0rr6z26EB1ysbFZc21ikfqXHfEnaef5ZbPGtDZeNUNsAk2IDrOb05Jm5hYUl5xpCbRvkmpmkL9IOehDsnie8LZg1Lkcu6zUtIIHfY+zUirYVsyGCPlbYqcjxy7aCTMEOYO8JveyBIM3cpiC6EOrD+gKFYLWf8LWv4M2o6XSKz+BUt2mFavYKHcitoRAhtUqS2ZvI7w8ZKYpvXa/pvhiXicEL9VGbLT9Dyc/fMxfAAX5aTR1K98Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(376002)(346002)(136003)(86362001)(36756003)(8676002)(6916009)(8936002)(4326008)(53546011)(33656002)(6512007)(6486002)(2906002)(966005)(26005)(478600001)(6506007)(2616005)(66556008)(5660300002)(66446008)(66476007)(64756008)(316002)(71200400001)(66946007)(54906003)(76116006)(91956017)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?U1qBalolSAdTegR1YoPIoXBsXYhkHimsjwSVVg7jby2PSOINwatliIMPWJEd?=
 =?us-ascii?Q?aLN3qaQBl3EwoVgg75IJe/uq3U/UM/n6f+BAY8t3In/zY49rYN6i90axz0sd?=
 =?us-ascii?Q?CWXmQRFOGSL1K8H0+Esc2ILgikwv6epbMCcb0KPDWEtKeZt1LQlxkJBlSKk6?=
 =?us-ascii?Q?aUM9Nk+FxH63ukD09bPdlcS6R4la+X1EFScNxZnDbvtnsEthRTVVYhaOnmwQ?=
 =?us-ascii?Q?zsEBjDlAgeUQLYKmr3QJfFAE0r/4SpqQH270fUZMtvUke7prrbw+Q6DMWUjr?=
 =?us-ascii?Q?vsjrIRNyv85oPI4Boc2u6BQxUOcjtaqf+SmDHchCll0ZG9yIfjAGCltsQlpC?=
 =?us-ascii?Q?iNNMWuCrX1SKfKmAfCX+Ea8GLhUZKPSOCZ6YPFyzUQDiPAdTHSO5I8YJb++3?=
 =?us-ascii?Q?/IztfnJ2RTNjXToXnKxszR3mejpZ4iZNIsx0ccpyAsn6OsWmQ7r87YYFIsLf?=
 =?us-ascii?Q?LkWeu2wnm+kB5ce8Icz0HZ/vvdlny8cKP3r1FYXP530GBs9PC5JzwUSiAMDW?=
 =?us-ascii?Q?TVzSioryZzdhXjRPV2zaz/CaKqIOLl0FzDNkqRv8F3heQNciuFATJWy7TvNi?=
 =?us-ascii?Q?QdIKukFJ+bcj/9lVIVrPrmJBntECkYSBJpII39MMOZfoV4fEHYZyCp3lq3H5?=
 =?us-ascii?Q?c9pFwIdclIfgYwHOqQxFv+/UidVv+L1/CCw3ipE8Ra8RedbG+FcvImFLkC+t?=
 =?us-ascii?Q?eda92pf3O/xU09P1whDDyrNE1MYtp4bOv6P/Q9lDbbbdY+oFXbBTLSpugugT?=
 =?us-ascii?Q?Lt0zvlBxD7B0juhnZDqRuMOdhATBuPaZphY0vnXaYrK6McbWO65gVwFfxjl5?=
 =?us-ascii?Q?a9U0HQWZc+aS0dDtb3I4az8eWAdpSNHMHPlIwrJYB8oHMqlpguucclGB4uym?=
 =?us-ascii?Q?0KYk+jGE+wJGx7+kbj2EMbRWMxINKcZT4dEv52cohvJJAmNhVmRI9YeWhwZC?=
 =?us-ascii?Q?qu32zC/PHxn3yNK7T7gw4x/26CqW72WWB3HZutpzP7ZCg45BuPiYg4fkbJMn?=
 =?us-ascii?Q?W9c3fIrLAagMTilC4BZtCQmHDPmsxobMr+gs9saIrt6qLV+ymGcSFF7BGJQc?=
 =?us-ascii?Q?aGgv0ST3d/qbY6r64CsBLJmr1Kle85mHE8bnHXmVpTThhHA6VpeCMC6zTOrw?=
 =?us-ascii?Q?PRbeL2PIc4vqftiE2OLLY4VI7GFC1F7b3Ybgqgpoc92K4w8MblczgP0l+mGx?=
 =?us-ascii?Q?ys2wUKboMX5lspr8VNZvseP8pa7oky/rv6P7C0q62nSPAhoH/Bm0oTByoKoF?=
 =?us-ascii?Q?9z0lyOSDwAsctrCzCygQFa4ITLCssEPMSbWT0x7FFy6isaA5xldn6jGj532B?=
 =?us-ascii?Q?yKxC/hMCWYloukFDQvw9oBcb?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <37ECC0657301E34FAD5F0A93C2751D92@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6202
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	58596d6c-5e64-4614-3748-08d8cc5c486c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JbE7Nw9nHR+aueWAJIgi4Sh86WjGVthAcx53D2iTlQX86PwWSMGtWCVkuS/cu/FpjYlKOLIQa9PXdzaLQScb9MKPHMcqJsXpP85+Vrf32x1j6U6qTLqFl7BnpKHeTgNffIpbaDivor3S0arXvib15u16DlHcsByN3waymEa8vYy0HOf3ymchQdd3RDZyW0DztfSPEVxI/TU+LSo4glAHzA40TCK2xPg21yW5yyvoUdW5uKRBZZeIX3gaQfkxTyo0sGVK7lJhxwPg08crBNOvA2yWSgbFtYETysRf+Q296Qv3ZBBQDjhbETk5iCRIYpztmje6vo4pZnDzzYf9IcTHEw0A0DOTE4K+wRgPoiHMYtIeaQni/4pNAdIOhMES1lmb1b8/DFIZ6ghGLkwqb1f90aR67ThVxMLU/G9eOLtWi2AsONjd1eCJn3HBErrlSS2SfFcqKvhp1t+RDb3ALfR0y4gWyf3N7bt1ARTuY1eOLEQ7EQJmdpf4Lv0+oa0wuWf7LX1ODuE4icUiOAonDbN8rhaMQmSYgdtfXJpJQxjELnJo52AoRg3q/L+36vQjw2kKKOTbAJlWlxrH+270Jmi2atmA8NZOFmWxOl32o6LAgUHICxLu/1puMWZDU8Jk3TDDYjNuDRlKtg1wF/Q2bs80ZMS7keX/DAItD4wxJy9fvH45xYjFXSzyNGShEIzw7L97yM7ARuZ578P4K3Gi1/HfE4jWY7caE/93YeZsI5FLnqw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(46966006)(36840700001)(966005)(26005)(316002)(4326008)(82740400003)(47076005)(54906003)(356005)(2906002)(70586007)(6862004)(36756003)(8936002)(336012)(107886003)(186003)(5660300002)(33656002)(6506007)(53546011)(6486002)(2616005)(82310400003)(36860700001)(478600001)(81166007)(86362001)(8676002)(70206006)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 18:07:03.5983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef40cdd8-359b-4000-4598-08d8cc5c56be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5523

Hello Stefano,

> On 6 Feb 2021, at 12:38 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
> The offending chunk is:
>=20
> #define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && need_iommu(d))
> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>=20
> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
> directly mapped, like the old check did, but the new check is always
> false.
>=20
> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
> need_sync is set as:
>=20
>    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>        hd->need_sync =3D !iommu_use_hap_pt(d);
>=20
> iommu_hwdom_strict is actually supposed to be ignored on ARM, see the
> definition in docs/misc/xen-command-line.pandoc:
>=20
>    This option is hardwired to true for x86 PVH dom0's (as RAM belonging =
to
>    other domains in the system don't live in a compatible address space),=
 and
>    is ignored for ARM.
>=20
> But aside from that, the issue is that iommu_use_hap_pt(d) is true,
> hence, hd->need_sync is false, and gnttab_need_iommu_mapping(d) is false
> too.
>=20
> As a consequence, when using PV network from a domU on a system where
> IOMMU is on from Dom0, I get:
>=20
> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=3D0x402, iova=3D=
0x8424cb148, fsynr=3D0xb0001, cb=3D0
> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK

I also observed the IOMMU fault when DOMU guest is created and great table =
is used when IOMMU is enabled. I fixed the error in different way but I am =
not sure if you also observing the same error. I submitted the patch to pci=
-passthrough integration branch. Please have a look once if that make sense=
.

https://gitlab.com/xen-project/fusa/xen-integration/-/commit/43a1a6ec91c4e3=
e28fa54dcbecdc8a2917836765

Regards,
Rahul
>=20
> The fix is to go back to the old implementation of
> gnttab_need_iommu_mapping.  However, we don't even need to specify &&
> need_iommu(d) since we don't actually need to check for the IOMMU to be
> enabled (iommu_map does it for us at the beginning of the function.)
>=20
> This fix is preferrable to changing the implementation of need_sync or
> iommu_use_hap_pt because "need_sync" is not really the reason why we
> want gnttab_need_iommu_mapping to return true.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Backport: 4.12+=20
>=20
> ---
>=20
> It is incredible that it was missed for this long, but it takes a full
> PV drivers test using DMA from a non-coherent device to trigger it, e.g.
> wget from a domU to an HTTP server on a different machine, ping or
> connections to dom0 won't trigger the bug.
>=20
> It is interesting that given that IOMMU is on for dom0, Linux could
> have just avoided using swiotlb-xen and everything would have just
> worked. It is worth considering introducing a feature flag (e.g.
> XENFEAT_ARM_dom0_iommu) to let dom0 know that the IOMMU is on and
> swiotlb-xen is not necessary. Then Linux can avoid initializing
> swiotlb-xen and just rely on the IOMMU for translation.
>=20
> diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/gran=
t_table.h
> index 6f585b1538..2a154d1851 100644
> --- a/xen/include/asm-arm/grant_table.h
> +++ b/xen/include/asm-arm/grant_table.h
> @@ -88,8 +88,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mf=
n_t mfn,
> #define gnttab_status_gfn(d, t, i)                                       =
\
>     (((i) >=3D nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[=
i])
>=20
> -#define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> +#define gnttab_need_iommu_mapping(d)  (is_domain_direct_mapped(d))
>=20
> #endif /* __ASM_GRANT_TABLE_H__ */
> /*
>=20


