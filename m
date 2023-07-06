Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10C9749CF1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 15:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559892.875307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHOfR-0003Fm-TC; Thu, 06 Jul 2023 13:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559892.875307; Thu, 06 Jul 2023 13:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHOfR-0003DV-QR; Thu, 06 Jul 2023 13:05:05 +0000
Received: by outflank-mailman (input) for mailman id 559892;
 Thu, 06 Jul 2023 13:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NM3K=CY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qHOfP-0003DK-QR
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 13:05:03 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe12::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b755970c-1bfd-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 15:05:01 +0200 (CEST)
Received: from DUZPR01CA0265.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::15) by AM0PR08MB5297.eurprd08.prod.outlook.com
 (2603:10a6:208:18a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 13:04:57 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::f3) by DUZPR01CA0265.outlook.office365.com
 (2603:10a6:10:4b9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Thu, 6 Jul 2023 13:04:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.25 via Frontend Transport; Thu, 6 Jul 2023 13:04:56 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Thu, 06 Jul 2023 13:04:56 +0000
Received: from 98b2a3619080.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DFEC923-1132-4DDC-9E31-A147C79C331F.1; 
 Thu, 06 Jul 2023 13:04:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98b2a3619080.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 06 Jul 2023 13:04:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6245.eurprd08.prod.outlook.com (2603:10a6:20b:293::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 13:04:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::3861:64c:eb82:afa1%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 13:04:41 +0000
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
X-Inumbo-ID: b755970c-1bfd-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNmXZzv9rE6xoyvZGJQ2zheUllSb6Z5PLPixAz+g5f0=;
 b=7179aILZ2LLwtf3fz0fB2N1M50M2KSPspkYy5h4piqJkBd1+LR7fv5qLdcYaXzu/shnTgn+KwEP4fCjmajctZfpyyxaYttGwEEnmxCArOGQV9dgvZSf5vtuC0DYuaNbr2ou2bSmJ3i6l00+iKyuD2iglFDBqjJu4gcYHzG4CzKA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 731cf3a407cd7a37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ5GdfYIiEwcLBPozqyAv3UfpwB2tnIJbGHaad8cql+V2XU3ZHaJQaq8e+2qrwUiCLdNPyaBCdv7JagMspfV1g/Ey3JhCacA+ex58TKDp8GpGzlkrLIDndIHZoxmuDcM7vr2lH6xwJCp/inXiWe7VDzT3G29EfEd9fSEboOTiRmg16HBQk++CR72OuPZHUpVjgMSfiOaxVhF1H0WrkWMRSx3rc4Rta/KWQ6LcxxMnebgVfkj3fVcsz78S7eDeq804c2zxhPbYRr+t/ffjkuPPWubB4ggYl5/M7yXO8tujHwWJihbYAXBiJ9+D6/XnbBXJRCWoaFVQhjZhFlyaLvcMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNmXZzv9rE6xoyvZGJQ2zheUllSb6Z5PLPixAz+g5f0=;
 b=GnO7JfPJ7MwU8P3bSnom8Jcf9E7GNaCekH0Hj5GMTHdOxT3+2hO6rdlnmnKktyfdHWo/4tIy89Gt7duRpSZGV4ffPhMDaOnE4QN94nMi0EAHuJbRUtK5Gwq7gi5TCnpSaXTXGauqBXB7xtyojPMJ4auhNvoQ+lm37XZDkkmlpCnBk66btzvbKD+wX6fL07Ciz8KMA2aRvTUe0uSC1VDBFKT8QtIqhazs//CMi61rDQ6noxU4ZSD6l+jrJ1k88UVnSHnLUPqhlElnjbqnY2O7QXnPjKAIqbknX3fv3ei09MLcyuRyiQEiv2cYhr1eG0a+5rIzaqM8FYLkN+wCTFIjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNmXZzv9rE6xoyvZGJQ2zheUllSb6Z5PLPixAz+g5f0=;
 b=7179aILZ2LLwtf3fz0fB2N1M50M2KSPspkYy5h4piqJkBd1+LR7fv5qLdcYaXzu/shnTgn+KwEP4fCjmajctZfpyyxaYttGwEEnmxCArOGQV9dgvZSf5vtuC0DYuaNbr2ou2bSmJ3i6l00+iKyuD2iglFDBqjJu4gcYHzG4CzKA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: George Dunlap <george.dunlap@cloud.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, P S <pairspace@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Topic: [RFC PATCH] xen/arm: Rebranding dom0less feature
Thread-Index:
 AQHZqzMUKP6yBnvUfEC1egkdxmuozK+ki8cAgAB66ACAAukxgIAAZuEAgAAgQQCAABPDAIACuauAgACBNoCAAMWkAIAAKcoAgAAD6oCAAAVoAA==
Date: Thu, 6 Jul 2023 13:04:41 +0000
Message-ID: <4717B214-33FF-4B8B-B213-E6C0767D69C6@arm.com>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
 <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
 <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
 <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com>
 <A89C2FC7-999E-4FCE-8A05-4F4B86573DBA@arm.com>
 <4aec2aca-e2e6-d9e4-1f73-b5f98245033a@xen.org>
In-Reply-To: <4aec2aca-e2e6-d9e4-1f73-b5f98245033a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6245:EE_|DBAEUR03FT039:EE_|AM0PR08MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: ce70e8a3-d5b9-4f3a-6abe-08db7e2198c1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Oyfac2SaPks3Z7XJl4lYym3jtSW+jM0cRMI0RMcwcc7mATKPqjQT5ipO1oFUhfaxqWDN+tYGWASucrn2IwZdoA7fi288/pcsyL3Er4/hJ6TYZEfxBGEJGsfQ+kg5rh4aG3AwWtWCl38gnuHKtTA0rf+e2KXqYpn4RQ3C6wrDszCBRaaySm4KK+TiMOthjt5RU7+dbMMjVw+KXIAaxUlSavVmoC6WlDLOcqPsLZIby8EZkCL9/9LroWtkrsrhYy6tQP4HUKOjOjr8UZxf+0OeVXuEIwHF6Xk1SNYZpAd7BMX1pMweQs6/TFwb8zgF+Zp8UCyG3BFDOctQxA4IDdR9eGT1Zckyr4pm7KnWZc/WmId9e6dPXmVfhHZ/jVoIxbCcE7wyQ/m9kK2xQvTbfKqOdYSKJcFD+P0wk4mK7J6ND1MJaC0ObsGQ7ueUc1BTPqUCVhAASvkj99BNA0JwYM+mcdcqNHij0F7mmTGp5u2a57mOuS/y+QT/Ki0cJweVzoTZLMqeULdDlJ/30Y7gHD9/xowyrqxUNAAUqurx6j6DYmeylox5+lYLzUxvDjUUCEYFAIsTp90NIxBAjkLwiH4JY2ySmcdGYyp4ZErThNmT8aPsQWyl+BJ1dEOqgT7poesQQAbOY6HLr7bgGI/UJ6sZKJaXrXzYnng9jVouL7aNt5M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(41300700001)(66556008)(64756008)(478600001)(6512007)(38070700005)(54906003)(86362001)(38100700002)(122000001)(71200400001)(6486002)(66946007)(316002)(4326008)(66476007)(76116006)(83380400001)(6916009)(36756003)(91956017)(33656002)(8936002)(2906002)(2616005)(5660300002)(66446008)(8676002)(186003)(7416002)(6506007)(26005)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <233756765D36714CAE12938E937082FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6245
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e8308a1-6125-4948-5835-08db7e218fc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5uUTeDr/x7RbI41zq0+zhOo9tCCkNtRUgzUhCGQbqWmIdnOZv83jYBh1OhcFMjZ2Dnr8nDF98VH6h2Ue1Mrc2mEZq+HG075r5Id8C1GP+g4uWA1ecTvvKs33avrIJ+owN5RoVBIqIuxU0iysImeZiKcF7Lud6W5wYwFVmQBn9S6G+Qxw/YKi270fURz1FwR7ISkrRdfsLoc960i/nMDhK2gpu1YviqYzYX3I/LkZCRbsChWlskD8RYYUqpOjvVThH/2kJAOG4ze8DQSODe2PBWeDCBO8FZMtzYp7A5sF0OJCk+pVGb/H196uT1SHUJw5rVhbyjff0ATal1VWaXV6F5lgeDJoTZ67qqbfVOlAmUonRaHDDpsDG1QiAdM888abJp08XPWhhx9xuneTD0e9f/KmW8wrcPIxgGf+ZohFEZykYf8kusLZTy0HBWyuKqPE1x1A/6mODq/OzTF++/gCbjAD/sKmaw9HUypFVNP5mzlzk/s/06IoorYe2sXod1pB9JPCfWsj87RAYiRGa5QNS+QShHEadC17F4PxPDkdl3XiMWUjHzVejua7HHSv2fueFKzsVGwJZU1yK8wLkndX0dI8LQ7BCsPRuA0wbvBErQkPzMQ2Hf8/D3dYCBG4+wjpt4mbv9BHpouiPbyXPoOApME24C2OJvvFvClewjULS2PVCunlAmdBRreso1NN9vtPVsjIdHP3CQXY4hJlW5j/EZ52nkpd/DgDPGqZEneCh1RK7ReAgGpQCj0qhyEV/q17ijDmtbQx7SNl4HElVJwiSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(4326008)(70206006)(70586007)(356005)(81166007)(2616005)(40480700001)(186003)(86362001)(36756003)(33656002)(6486002)(6512007)(478600001)(6506007)(107886003)(54906003)(26005)(82310400005)(40460700003)(36860700001)(6862004)(8936002)(8676002)(316002)(82740400003)(2906002)(336012)(83380400001)(5660300002)(47076005)(41300700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 13:04:56.4890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce70e8a3-d5b9-4f3a-6abe-08db7e2198c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5297

DQo+Pj4+IA0KPj4+PiBUaGUgInN0YXJ0IFZNcyBmcm9tIFhlbiBvbiBib290IiBmdW5jdGlvbmFs
aXR5IGlzIHRoZSAqb25seSogdGhpbmcgdGhhdCBhIGJpZyBjaHVuayBvZiB0aGUgdXNlcnMgb2Yg
dGhpcyBmdW5jdGlvbmFsaXR5IHdhbnQ7ICByZWZlcnJpbmcgdG8NCj4+Pj4gaXQgYXMgIkh5cGVy
bGF1bmNoIExpdGUiIG9yICJIeXBlcmxhdW5jaCAtMSIgd2lsbCB1bmRlcm1pbmUgdGhlIHZhbHVl
IG9mIHRoZSBmdW5jdGlvbmFsaXR5Lg0KPj4+PiANCj4+Pj4gV2hhdCBpZiB3ZSB1c2UgIk1lYXN1
cmVkIEh5cGVybGF1bmNoIiwgb3IgIkh5cGVybGF1bmNoIE1lYXN1cmVkIEJvb3QiIHRvIHJlZmVy
IHRvIHRoZSBmdWxsIG1lYXN1cmVkIGJvb3QgZnVuY3Rpb25hbGl0eT8NCj4+PiANCj4+PiBJIHRo
aW5rIHRoaXMgaXMgdGhlIGJlc3Qgd2F5Lg0KPj4+IA0KPj4+IA0KPj4+PiBPciwgIkh5cGVybGF1
bmNoIERUIiBmb3IgIkJvb3RpbmcgVk1zIGZyb20gWGVuIHVzaW5nIERldmljZSBUcmVlIiAod2l0
aG91dCB0aGUgaW52b2x2ZW1lbnQgb2YgYSBkb21CKSwgIkh5cGVybGF1bmNoIEJvb3QgRG9tYWlu
IC8NCj4+Pj4gSHlwZXJsYXVuY2ggZG9tQiIgZm9yIGEgbW9yZSBnZW5lcmFsICJkb21CIiBmdW5j
dGlvbmFsaXR5LCBhbmQgIkh5cGVybGF1bmNoIE1lYXN1cmVkIEJvb3QiIGZvciB0aGUgZnVsbCBm
dW5jdGlvbmFsaXR5IChhc3N1bWluZyB0aGVyZSdzDQo+Pj4+IG1vcmUgdG8gdGhpcyB0aGFuIHNp
bXBseSBoYXZpbmcgYSBkb21CIGludm9sdmVkKT8NCj4+PiANCj4+PiANCj4+PiBXZSBuZWVkIGFu
IG92ZXJhcmNoaW5nIG5hbWUgdG8gY292ZXIgdGhlIGZlYXR1cmUgInN0YXJ0IFZNcyBmcm9tIFhl
biBvbg0KPj4+IGJvb3QiIG9uIGJvdGggQVJNIGFuZCB4ODYuIEZyb20gbXkgdW5kZXJzdGFuZGlu
ZyBhbmQgZnJvbSB0aGUgb3JpZ2luYWwNCj4+PiBlbWFpbHMgb24gdGhlIHN1YmplY3QsIHRoZSBu
YW1lICJoeXBlcmxhdW5jaCIgd2FzIGl0Lg0KPj4+IA0KPj4+IFN1cmU7IGJ1dCB0aGluayAiZ3Vp
dGFyIiB2cyAiYWNvdXN0aWMgZ3VpdGFyIiB2cyAiZWxlY3RyaWMgZ3VpdGFyIi4gICJFbGVjdHJp
YyBndWl0YXIiIGlzIG5ldywgImd1aXRhciIgY292ZXJzIHRoZW0gYm90aCwgYnV0IHlvdSBzb21l
dGltZXMgbmVlZCBhIHdheSB0byBzcGVjaWZ5ICJhY291c3RpYyIuICBSaWdodCBub3cgdGFyZ2V0
IGNvbmZpZ3VyYXRpb25zIHdlJ3JlIHRhbGtpbmcgYWJvdXQgaW5jbHVkZToNCj4+PiANCj4+PiAx
LiBCb290aW5nIGFsbCB5b3VyIGRvbWFpbnMgZGlyZWN0bHkgZnJvbSBYZW4gdXNpbmcgRFQgY29u
ZmlndXJhdGlvbnMNCj4+PiAyLiBCb290aW5nIGEgZG9tQiwgd2hpY2ggdGhlbiBleGVjdXRlcyBz
b21lIG1vcmUgY29tcGxpY2F0ZWQgcHJvZ3JhbW1hdGljIGNvbmZpZ3VyYXRpb24gdG8gbGF1bmNo
IFZNcyBiZWZvcmUgZGlzYXBwZWFyaW5nDQo+Pj4gMy4gRG9pbmcgZnVsbCBtZWFzdXJlZCBib290
IG9uIHRoZSB3aG9sZSBzeXN0ZW0gdXNpbmcgYSBkb21CLg0KPj4+IA0KPj4+IElmICJIeXBlcmxh
dW5jaCIgbWVhbnMgMS0zLCB3ZSBub3Qgb25seSBuZWVkIGEgd2F5IHRvIHNwZWNpZnkgdGhhdCB5
b3UncmUgdGFsa2luZyBhYm91dCAzLCBidXQgKmFsc28qIGEgd2F5IHRvIHNwZWNpZnkgdGhhdCB5
b3UncmUgdGFsa2luZyBhYm91dCAxLiAgSW4gdGhlIHZhc3QgbWFqb3JpdHkgb2YgY2FzZXMgZm9y
IHRoZSBmb3Jlc2VlYWJsZSBmdXR1cmUgYXJlIGdvaW5nIHRvIGJlIDEuICBBZGRpdGlvbmFsbHks
IHdlIHdhbnQgdG8gbWFrZSBzdXJlIHRoYXQgIkh5cGVybGF1bmNoIiAqYWN0dWFsbHkqIHR1cm5z
IG91dCB0byBtZWFuIDEtMywgYW5kIG5vdCBqdXN0IDEuDQo+Pj4gDQo+Pj4gVGhlIHRoaW5nIEkg
bGlrZSBhYm91dCAiSHlwZXJsYXVuY2ggRFQiIGlzIHRoYXQgdG8gbWUgaXQgc291bmRzIHByZXR0
eSBjb29sIGJ1dCBhbHNvIGlzIHZlcnkgZGVzY3JpcHRpdmU6IEkgaGF2ZW4ndCB0YWxrZWQgdG8g
cGVvcGxlIGJ1aWxkaW5nIHRoZXNlIHN5c3RlbXMsIGJ1dCBpdCBzZWVtcyBsaWtlIHNheWluZywg
IlRoZSBoeXBlcnZpc29yIGxhdW5jaGVzIFZNcyBiYXNlZCBvbiBhIERldmljZSBUcmVlIHBhc3Nl
ZCB0byBpdCBhdCBib290IiB3aWxsIGJlIGltbWVkaWF0ZWx5IHVuZGVyc3Rvb2QsIGFuZCBzdGlj
ayBpbiBwZW9wbGUncyBtaW5kcy4NCj4+IFBlcnNvbmFsbHksIEkgbGlrZSB0aGUgbmFtZSDigJxI
eXBlcmxhdW5jaCBEVOKAnSwgYmVjYXVzZSBpdCB0ZWxscyBtZSB0aGF0IHdlIGFyZSBsYXVuY2hp
bmcgVk1zIGFuZCB0aGUgRFQgaXMgaW52b2x2ZWQsIGlmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHkg
dGhlIGRlc2lnbiwNCj4+IGl0IHdvdWxkIGJlIHRoZSBzYW1lIGFsc28gb24geDg2IChhbmQgaW4g
ZXZlcnkgYXJjaGl0ZWN0dXJlIHRoYXQgd2lsbCBjb21lIGxhdGVyKSBzbyBiZWluZyDigJxIeXBl
cmxhdW5jaCBEVOKAnSBhbiBhcmNoIGFnbm9zdGljIG5hbWUgbWFrZXMgaXQgYSBnb29kDQo+PiBj
YW5kaWRhdGUgZm9yIHBoYXNlIG91dCBkb20wbGVzcyBuYW1lIGFuZCBmb3IgdGhlIGZ1dHVyZSB3
aGVuIGEgY29tbW9uIGNvZGUgd2lsbCB1c2UgdGhlIERUIHRvIGxhdW5jaCBWTXMgYXQgWGVuIGJv
b3QuDQo+IA0KPiBJIGFzc3VtZSB0aGF0IERUIG1lYW5zIERldmljZS1UcmVlIGhlcmUuIElmIHNv
LCBJIGZpbmQgYSBuYW1lIGEgYml0IG1pc2xlYWRpbmcgYmVjYXVzZSB3ZSBhcmUgdGFsa2luZyBh
Ym91dCB0aGUgd2F5IHRvIHBhc3MgdGhlIGNvbmZpZ3VyYXRpb24gcmF0aGVyIHRoYW4gd2hhdCB0
aGUgZmVhdHVyZSBpcyBkb2luZy4NCj4gDQo+IE15IGFzc3VtcHRpb24gaGVyZSBpcyB0aGF0IGEg
RG9tQiBzb2x1dGlvbiB3b3VsZCBzdGlsbCB1c2UgdGhlIERldmljZS1UcmVlIHRvIGRlc2NyaWJl
IHRoZSBkb21haW5zLg0KDQpUaGUgc2VudGVuY2UgYmVsb3cgbWFrZXMgc2Vuc2UgdG8gbWUsIOKA
nERU4oCdLCDigJxkb21CL0Jvb3QvQm9vdCBEb21haW4vQkTigJ0sIOKAnE1lYXN1cmVkIEJvb3Qv
TULigJ0gY2FuIGRvIHRoZSB3b3JrIG9mIGRpc3Rpbmd1aXNoIHRoZSBmdW5jdGlvbmFsaXRpZXMs
IGV2ZW4gaWYgdGhlIERldmljZSB0cmVlIGlzIGludm9sdmVkIGluIGFsbCBvZiB0aGVtLg0KDQo+
Pj4+IE9yLCAiSHlwZXJsYXVuY2ggRFQiIGZvciAiQm9vdGluZyBWTXMgZnJvbSBYZW4gdXNpbmcg
RGV2aWNlIFRyZWUiICh3aXRob3V0IHRoZSBpbnZvbHZlbWVudCBvZiBhIGRvbUIpLCAiSHlwZXJs
YXVuY2ggQm9vdCBEb21haW4gLw0KPj4+PiBIeXBlcmxhdW5jaCBkb21CIiBmb3IgYSBtb3JlIGdl
bmVyYWwgImRvbUIiIGZ1bmN0aW9uYWxpdHksIGFuZCAiSHlwZXJsYXVuY2ggTWVhc3VyZWQgQm9v
dCIgZm9yIHRoZSBmdWxsIGZ1bmN0aW9uYWxpdHkgKGFzc3VtaW5nIHRoZXJlJ3MNCj4+Pj4gbW9y
ZSB0byB0aGlzIHRoYW4gc2ltcGx5IGhhdmluZyBhIGRvbUIgaW52b2x2ZWQpPw0KDQoNCkF0IGxl
YXN0IGluIG15IHBlcnNvbmFsIG9waW5pb24sIHdlIGhhdmUgcGVvcGxlIHRoYXQgd29ya2VkIGEg
bG90IG1vcmUgdGhhbiBtZSBvbiB0aGlzIHByb2plY3Qgc28gdGhleSBjYW4ga25vdyBiZXR0ZXIu
DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

