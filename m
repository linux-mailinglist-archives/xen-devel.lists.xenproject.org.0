Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF53FCB55
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 18:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175884.320262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL6QB-000811-Em; Tue, 31 Aug 2021 16:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175884.320262; Tue, 31 Aug 2021 16:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL6QB-0007y8-BR; Tue, 31 Aug 2021 16:15:35 +0000
Received: by outflank-mailman (input) for mailman id 175884;
 Tue, 31 Aug 2021 16:15:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8Jn=NW=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mL6Q9-0007y2-8L
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 16:15:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9e0a976-0a76-11ec-ad55-12813bfff9fa;
 Tue, 31 Aug 2021 16:15:31 +0000 (UTC)
Received: from AS8PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:20b:312::33)
 by DBBPR08MB6282.eurprd08.prod.outlook.com (2603:10a6:10:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 16:15:30 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::21) by AS8PR04CA0058.outlook.office365.com
 (2603:10a6:20b:312::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Tue, 31 Aug 2021 16:15:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 16:15:30 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Tue, 31 Aug 2021 16:15:30 +0000
Received: from 146e42c06228.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4174234B-60D1-4D4D-AED4-AB413B7D6030.1; 
 Tue, 31 Aug 2021 16:15:22 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 146e42c06228.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 16:15:22 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB5886.eurprd08.prod.outlook.com (2603:10a6:102:e2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 16:15:21 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 16:15:20 +0000
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
X-Inumbo-ID: a9e0a976-0a76-11ec-ad55-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8Wl3UuMRC2nlOUxwD1uv9KtvlUtqhpl7emd3rUdLLE=;
 b=dcOAvFQKh9Us72rorLrUBftxkjuHxFY2CW0RlJE2aKy9QSqL2hos1p/nZCxdj+aycZA7rilGFV52CdcvFgjrWyNlQ/Amnw9DPps9/sBswRXvLbr3SAafGYk05IOEphafZh6iIt4Ti4F7HQ98f/KMKQ2LxIrgBiz57j8zg0Ob0GA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22d4123a4bcb3286
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQziuc6Cvx4XP2fc7mOlzmCrxp3pZwyTiqhSSBDXyi861S714qzS1geRjjUEpdJr+mvTBgG8wRp10gpM4P6/Atg/1/scXkW6kaCar9MED/cucIC7aJTXp8OF+6k4WP0nMWXmwJ/mHQvzi9kxs0gn3hVNlPSrr+8LbVC6kLVcBGogDwQ6iIEVFBzwH6SFiilhKTImtBe/ruRUgsW7XBThvowEmHq80s0PC52pYVZX12tnAnmvflwFknLe9bbh/nzQakKSIy+62fMJ5Au0v7xLuN5VwT7NHG6x0f21JkSmU9hrS9UcPdg1UkYXwt/bBJxs2e04dAUp+2hPOvfW3S6DOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8Wl3UuMRC2nlOUxwD1uv9KtvlUtqhpl7emd3rUdLLE=;
 b=dcOq0UyGrm1OZP55rAX63M7u4JGSTfzsfdqQo/BIVvgGmfByUvThfawDXoGQGihpMuBslfa9tkzKTktNRxoj8RvxgFhOipRKRbtJFhdw/R8Ts5OLslglCt+x0U/CEF7ce1FxNiL4bS0fJlEciMNc1WzZfeTNnKvl4vlFDGuUFiX1/D+ACJOQ514Pjyo7ekSOmJ74+G0FHvqr4myGSekk4QVnDQPb2FaD4nRBofrT2mAMsyDT7IG6uz8LASk9TBmY2MQ92Vov1u1byNyx6GVvbR1W6FAv/LPdeITDja9bgjA/xWkoXnT2bu0TYExZCBVC+o49Tg60vD2k6JtvVu0GeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8Wl3UuMRC2nlOUxwD1uv9KtvlUtqhpl7emd3rUdLLE=;
 b=dcOAvFQKh9Us72rorLrUBftxkjuHxFY2CW0RlJE2aKy9QSqL2hos1p/nZCxdj+aycZA7rilGFV52CdcvFgjrWyNlQ/Amnw9DPps9/sBswRXvLbr3SAafGYk05IOEphafZh6iIt4Ti4F7HQ98f/KMKQ2LxIrgBiz57j8zg0Ob0GA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if needed
Thread-Topic: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if
 needed
Thread-Index: AQHXmbPyaqNt71/0B0WMx26sIln5R6uHdm2AgAYrXACAABkoAIAAGG+A
Date: Tue, 31 Aug 2021 16:15:20 +0000
Message-ID: <CA9E8DFA-E0D8-4C33-A277-E19EFFCAFDC4@arm.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com>
 <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org>
 <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
 <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org>
In-Reply-To: <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a9b70e50-a540-4898-3b1f-08d96c9a8d4e
x-ms-traffictypediagnostic: PA4PR08MB5886:|DBBPR08MB6282:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB62824B2833B694BBE7A10D479DCC9@DBBPR08MB6282.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DI2WbU0FEClSvqGxhn6dnPvjdrY4ZA/jAXPu4SVBpSTQuEQIxMSvpseHUT6GC2afV3DM2eqc/MZjxruObfrRKrim3BOPJt/DdGI4vjTso7xdYOVpMWu11NgX2ep/Aa+g+FLV52StMoyMbqEez9DmSPSUohW7rWDcmxsCRNK/S3y0XD2z7j2rd68XzJKm7jZlJ+fh+RacArLMhVNiFgVbh9H1bJa9HIrUzI3HSS7KnO0MNItpx7qqC7cXnYAtgYli/FWWoRDNBZ1s4BhTot5MbKmwr+BtKZrwJZhMciFK5s5fha16StEe4IRZFi/de68uYypssKm1dH+Bfl/1Ro2azsq0mFdtYcnkMtdUuXnmtOZfkc4RplctB/bu3iOXPvZU6wIDRYOzKBi+Qsr0VbkPXGcHSVBkZ2EgZh1cnVnrNhqyA+wFMpymtTOCRSTRNlLVqxWzLwz4xgfE70SnIp+fR/hQExqhLdGRrIwsD+FoDpPOs3pWc8G2wbm9KWT03365LVDHqad9Pu00RPrI9V25eUqlRyTDyVYgLQd7HG+YGpOqV2CYFTVTTF1ixiN7KttF10ubnSPvHrTfzVLW1l/5KGsB3nttxJ6+rNDwViYp5aZqxM8DDOGZuef3GB2BCOKV24Ms54nrxWWaisV7XKUVWOh7/Jr1G3apiuk2/TPpJaxCkdnQFlWx321Y+NHNsoHn8Sv+aoGQz49UKytvBqqoyIg6mtLLW868DhIg/E9KJrnDqA/rL5avD596afGpAjBy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(66476007)(83380400001)(76116006)(91956017)(316002)(2906002)(5660300002)(66556008)(66946007)(86362001)(36756003)(66446008)(2616005)(64756008)(478600001)(8676002)(71200400001)(122000001)(8936002)(6916009)(6506007)(38100700002)(53546011)(26005)(186003)(38070700005)(6486002)(4326008)(33656002)(6512007)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DNk0rIC5Zx0iROWQR5rv74XcTkiQhw1SZUB1KpH/gioQRJmTIZpEf8btiab9?=
 =?us-ascii?Q?8jo53IfcdSA0/tvaq7jZFpGygmbT/uyhSUTZ6e17z5N9yOSsuv+zwrXh2b69?=
 =?us-ascii?Q?Xa5bKK6Jajblr74tkQjFGMrXSOWp793S5rTISAqVClBqiFGyf9E0kk6p60b7?=
 =?us-ascii?Q?wXzNldu5HXrzUgsJntYOEUIdtuBIlj1JHe5+9j5s1Lt/nivqdaADuACDLLls?=
 =?us-ascii?Q?m58C2QaeMAPfqu60urWzXLPexAcuEgekQUi+3QjzXQM7E0ex+9otB93VA14V?=
 =?us-ascii?Q?+gXhu7X/TZFhkohovqV6SOfMF5uTuICPSD7E5N8kRVvioYkFgYerKgyxgQI4?=
 =?us-ascii?Q?3K+F81CjnC1sYtgz6YVVc45dk6nR95wAQYfASYGZz8h1bnzJxlmibU9geLfI?=
 =?us-ascii?Q?lx3FDd5USiISZKPep4F5tuKm0Or1KdL1KKt3pVx7n5GOMwrLN7yXg1phWoMV?=
 =?us-ascii?Q?kYn4FRDYLUhpeOqZl3ehxPVTRjEKBE19/V24Ti16QZbhEWHj1jE/f1XRS6c8?=
 =?us-ascii?Q?2Zw7jQ0Kn1ag7o/8/XLc7G79xP2lEkUCFLlsLvHG+AQ20hIXdRc7vRcsaC+Y?=
 =?us-ascii?Q?KTm4aEuHlZ5j6At5cJD2WBnbqMpa+/nxl0/TSWggVZ9fvQ/r4a02yVzhAGvU?=
 =?us-ascii?Q?9747XT3gPXAP7OvymXq0HZOzlRnBAFW7cPhjRxIwaEdVI7IjgzBAOj4KE0EM?=
 =?us-ascii?Q?U89EfZdWM0qKN2stpxP3vy6A6g9BiezJIKbmSLzP3JjkGhKEwTOcFKNARYlf?=
 =?us-ascii?Q?qWVlekVJsYOmis086JpZc4hKTX2pbXHNNFudO/bXHQgJCOiWqYrN1pVGoGZ2?=
 =?us-ascii?Q?CTL3uyau4IwfpDOwb9llB7wHH+J6jtQfYMtt+/swERdG8JvovCOmIK7dtUKC?=
 =?us-ascii?Q?iBHF4qFa/dbaBp3tm0prAmgPQSSLrztBg2dUDcDx7XepEsPwOSQc5PYIYR2w?=
 =?us-ascii?Q?hXmROcaFL6Ir2KcgIwoA2lZVKgf4hEfRbEEsVzDcd4RbTaZ1Jao/dC/bxmzv?=
 =?us-ascii?Q?B5Fh8YZAQ8IUCq+bpAWkeVic94h3+HfWuKqeb7W44PlUXW+/tOBpanc+ECLg?=
 =?us-ascii?Q?c2GstNjobhOucyfQ06F1Vq99CdeE3knKYQINOHf2rcAl2kZV9f7wx79ljk7m?=
 =?us-ascii?Q?vbesRA8bOA/F2uxnThBaF2DRMG8tVlPN9Cf92QR4wCU3AhchEQSDe2XLx5Kz?=
 =?us-ascii?Q?J7J327Yyhog5QxsSvPowUDULXxQzzGCOe68R9+0LxDdKUdMBao7+FtJYQvlN?=
 =?us-ascii?Q?X73Sn78zLu3fiOaA3RFabGKEQl1M2/xKqi0M58aOScwIFiJZOazp7yC9lLCK?=
 =?us-ascii?Q?HBEP1faLq69zz/Wn4BLBr5b3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2AD171B30DD80941A05EFEF5E3715AFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5886
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3086b224-a9fb-4232-6b7b-08d96c9a8798
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ujolIWmM3pDrH0KohPlR2LxqcrCh09zeuXr5wlsLKCUFD5Y4Mn/DcdasT9zAHi/nXkjR67eTs1LlcKJDSLsHhXQY8AFn9NTi7M095ULJdusbaF0ZxtGSb/dsoVguXJ27e1CHgVF0ZtUfvkVz04GC7VTJWhzElm6pMkRSWjDIIU0Pwi+kph5/qelnbcNke0jkwBnu4WYGfIIEaVydJl8kMXxVnCUTbeBC0pa7ZQAGiv+5P3lDS9Iz4MNTlpzufehs0t2Kysa3MTGSTJllrhA0I+JbFWxADDA49EeZkKBRlNFylZknw3zUmPT8Cw5dvfxLLIsfPjPQzmy4rZK2KIV2lB93BU/cyf84sZ7FnK7EzhybRPfLmjNnIR6s8CRJR2qVTU2FG8kxPlfXGSwOy+2y/KS1A+UiFl4oQcQwZUXTcSqwa0zkN1EAvTxSPxcTDJhsbMlKk2pylhAFTMCVTgX4zy0U0f2PW5FmV/vjvz6yea42JcN4GMRhKxUa44sGsYK32tx+fVBdgtMrj7Ow4XDhbFMe9PAgR7A2m6ZoidCdFtBg7/O+Lx99QJtDB1IMnKLVJkNouoIpXoWKsakbLDTe1QXCPC/0qpiGyQkGuXGf6lftOOHVkC90H9C5Mr79Zscka2dfzwECeZdXjOo/3i8H/Eap5c7kG3euwNxDkG9ko+qOYe7OPB5JZrnfyPKXcaHw0UCmlQ/7IHBFC1pq5fQLig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(36840700001)(4326008)(47076005)(36860700001)(5660300002)(478600001)(54906003)(82310400003)(81166007)(70206006)(6506007)(70586007)(356005)(82740400003)(36756003)(107886003)(86362001)(336012)(83380400001)(316002)(6862004)(8676002)(53546011)(186003)(6512007)(2906002)(33656002)(2616005)(26005)(6486002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 16:15:30.0533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9b70e50-a540-4898-3b1f-08d96c9a8d4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6282

Hi Julien,

> On 31 Aug 2021, at 15:47, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 31/08/2021 14:17, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 27 Aug 2021, at 16:05, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 25/08/2021 14:18, Bertrand Marquis wrote:
>>>> Sanitize CTR_EL0 value between cores.
>>>> In most cases different values will taint Xen but if different
>>>> i-cache policies are found, we choose the one which will be compatible
>>>> between all cores in terms of invalidation/data cache flushing strateg=
y.
>>>=20
>>> I understand that all the CPUs in Xen needs to agree on the cache flush=
 strategy. However...
>>>=20
>>>> In this case we need to activate the TID2 bit in HCR to emulate the
>>>> TCR_EL0 register for guests. This patch is not activating TID2 bit all
>>>> the time to limit the overhead when possible.
>>>=20
>>> as we discussed in an earlier version, a vCPU is unlikely (at least in =
short/medium) to be able move across pCPU of different type. So the vCPU wo=
uld be pinned to a set of pCPUs. IOW, the guest would have to be big.LITTLE=
 aware and therefore would be able to do its own strategy decision.
>>>=20
>>> So I think we should be able to get away from trappings the registers.
>> I do agree that we should be able to get away from that in the long term=
 once
>> we have cpupools properly set but right now this is the only way to have
>> something useable (I will not say right).
>> I will work on finding a way to setup properly cpupools (or something el=
se as
>> we discussed earlier) but in the short term I think this is the best we =
can do.
>=20
> My concern is you are making look like Xen will be able to deal nicely wi=
th big.LITTLE when in fact there are a lot more potential issue by allow a =
vCPU moving accross pCPU of different type (the errata is one example).

I agree and this is why Xen is tainted.

>=20
>> An other solution would be to discard this patch from the serie for now =
until
>> I have worked a proper solution for this case.
>> Should we discard or merge or do you have an other idea ?
> Please correct me if I am wrong, at the moment, it doesn't look like this=
 patch will be part of the longer plan. If so, then I think it should be pa=
rked for now.

Not sure it depends on what the final solution would be but this is highly =
possible I agree.

>=20
> This would also have the advantage to avoid spending too much time on res=
olving the emulation issue I mentioned in my previous answer.
>=20
> No need to resend a new version of this series yet. You can wait until th=
e rest of the series get more feedback.

Ok, I will wait for feedback and next serie will not include this patch any=
more.

>=20
> [...]
>=20
>> If we get interrupted, someone could program CSSELR differently and the =
next read
>> will not be reflecting what the guest actually wants to do
>=20
> AFAICT, CSSELR is preserved during the context switch of vCPU. So that so=
meone would have to be Xen, right?
>=20
> If so, what you describe would also be an issue even if we didn't trap th=
e register. Therefore, if Xen would ever use CSSELR, then that code would n=
eed to save the value, use the register and then restore the value with pre=
emption disabled.

I could just remove the comment, I added it as information, but if you thin=
k it is misleading no problem.

Anyway as we will park this for now no need to discuss that further.

Cheers
Bertrand

>=20
>> The code is not preemptible right now so this cannot be an issue but I a=
dded the
>>  comment more as a warning.
>> This is not something from the documentation, this is because value writ=
ten
>> in CSSELR is defining what is read from CCSIDR
>>>=20
>>>> +            WRITE_SYSREG(v->arch.csselr, CSSELR_EL1);
>>>> +            set_user_reg(regs, regidx, READ_SYSREG(CCSIDR_EL1));
>>>> +        }
>=20
> Cheers,
>=20
> --=20
> Julien Grall


