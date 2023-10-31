Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8329B7DCE77
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625794.975438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpIx-00064d-U5; Tue, 31 Oct 2023 14:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625794.975438; Tue, 31 Oct 2023 14:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpIx-00061k-Po; Tue, 31 Oct 2023 14:01:15 +0000
Received: by outflank-mailman (input) for mailman id 625794;
 Tue, 31 Oct 2023 14:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxST=GN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qxpIw-00061e-3s
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:01:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f206b7e0-77f5-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 15:01:11 +0100 (CET)
Received: from AS4P195CA0047.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::24)
 by AM7PR08MB5512.eurprd08.prod.outlook.com (2603:10a6:20b:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Tue, 31 Oct
 2023 14:01:08 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::1f) by AS4P195CA0047.outlook.office365.com
 (2603:10a6:20b:65a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 14:01:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 14:01:07 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Tue, 31 Oct 2023 14:01:07 +0000
Received: from b89638decfc6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E87F8266-1337-4E17-A908-0E5F7152EAED.1; 
 Tue, 31 Oct 2023 14:01:00 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b89638decfc6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Oct 2023 14:01:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB10600.eurprd08.prod.outlook.com (2603:10a6:150:15e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 14:00:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 14:00:58 +0000
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
X-Inumbo-ID: f206b7e0-77f5-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DDhmon6HOQ2/xX8+dzIOxpFF7sBWYgNvmAenLUJFRWZLi7gWZ8lFsyzFTbv5iCJI/NStDFSqwwj80iQjGnO1GIfWvHOxKh6QUVXPmPnI9qoywK9ViSX0EZgMUbGRMhfyVWdXdGzDQl/fWdwq8WWlGBtX4Q9phXyT6avprPoNxi4RlOtx3nYLqcbnGH0d3f9XyosAnws7P3J2BEdcKNb8mlFm4++VB/omYavAjrDDNWeqEaC/b2HV4LMGmkcO1JW1I8EUL53zTj2f+YBtRSYOHciLyl1lhXD7xiRtrzEMLW/6fk+PRYaYRCMJ7cJHohS+AGVc/C8/hwXdhfM0m2Z6/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/aV2s9t5cBuGfzyjZ/LlgWms1Xfrs21IuCtMyAiN/4=;
 b=WW/kCKQ7t1usAVNm0AC58NoSS5GT7Ca7CrI+L3ar4QbHPFhhgQFgGP8s6texjweKav5ERQtGt99nathOsOC61h7U53izfxOYlgXWnkfeVbcJX6pwZOV89NdcxIwFTJIlt0dCkJMaTS2U7ZDDU6kXlpCvJWjprRsDg9TgtEC+u4LuOAK+Sgsw1hKf3W6cPw11EZznDTwd6meJUiaW2Y7EtxHCfJVAd7xE7r8thtVOj7/9GNnHrZhaMGdd2YtZML8LJso0Pvc1YJYF5aGgm+hRL048MW9usD/A2g6KSSq89kz083kCLJvi3GRqR1551ko69Xvq1euwPrC3CZWtAY+SYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/aV2s9t5cBuGfzyjZ/LlgWms1Xfrs21IuCtMyAiN/4=;
 b=fCPMJNbtPo5p89p14lCkoz1qoK3aoq0uWLdfFR9QVjka2Nwfy9P+esgFBjJxFpJWhl/o/FmxX9qd8JQyJbzvK77X9qG7XyY+k6xIRwlBuwg9MvowNIz46jJre9oYH/WEW8O+69YSoOCvnSVXoQhRXUI/Fdpt9wU3mkdcUVhxmr0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf998608088bb902
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7GIsPDUgvEwqrlTE+qnUCfHeDnbmo7hgfvAuDnkWSOSWbthxQZQs4s7TgK/YrP8qgqpIlNCY7vZ7a9XB27njcmh0G+7B8e1DQ4LBdlhW8t1HyctivFvHFCEvajOeHzwS9Dt9A8ZqWZknqyuV+oGtwOW9gMYn7UVwF8k39a95EdvcGM8WyB9BrelUSrqUmz950bRSUleAmTAlmfZASbP0drcuQTpisIbZQwtzhW0IZG2x5CEoIsiaR90ENwGMyaCMIgMUc4rTvCL7qgPMFM3ABn8SJsI/pBXL15URkYvdhZkZM5NWAIk3UKtafFonmhpO5S2pOqTQoWK4kIyYAp4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/aV2s9t5cBuGfzyjZ/LlgWms1Xfrs21IuCtMyAiN/4=;
 b=Ex8n+nmcfz2NcWmk006GE9nuNwcumyotPL/CeoLlvpWe9sDDYf/xcgkZlXguL/WfF4dtFTee1j37Ywf6fVMauESO3vN+Biudq/RP645nl2mRcJ96Aqg9y644obblGWbec6EQMQsG095lXRw+l80caJgTWiVs/3sESpyJvEv0JtGe35JE8E5nVmzXP0QcqOkNe7pgyCXdZB8Me1E+XclAYvwbtv4S8H5OkmAJ2gk7eaFg4LB3GvxJCLMdRkg09qiqoZFmoYquOKyTbPOOuhIIJwxuzN6qm40k2BQnbckBaEWaKTBbZXxN82TvuRBIbX5OnhKC/ZqjTcmEkrqnO/dqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/aV2s9t5cBuGfzyjZ/LlgWms1Xfrs21IuCtMyAiN/4=;
 b=fCPMJNbtPo5p89p14lCkoz1qoK3aoq0uWLdfFR9QVjka2Nwfy9P+esgFBjJxFpJWhl/o/FmxX9qd8JQyJbzvK77X9qG7XyY+k6xIRwlBuwg9MvowNIz46jJre9oYH/WEW8O+69YSoOCvnSVXoQhRXUI/Fdpt9wU3mkdcUVhxmr0=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.18 1/3] CHANGELOG: Reformat
Thread-Topic: [PATCH for-4.18 1/3] CHANGELOG: Reformat
Thread-Index: AQHaC/0Ecsd1JRRn0E2uPawidAiicLBj7VGA
Date: Tue, 31 Oct 2023 14:00:58 +0000
Message-ID: <6FD0B6D5-93DF-4CC0-9340-C9174FF59AC2@arm.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
 <20231031131954.3310725-2-andrew.cooper3@citrix.com>
In-Reply-To: <20231031131954.3310725-2-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB10600:EE_|AMS0EPF000001B2:EE_|AM7PR08MB5512:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e77a36-8011-446a-af66-08dbda19d48f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /mcCSYlWyjju/DPE5iBI33SpOMqHePxAYIvPC70PSLY9DpNz2FWl+lXvWsCUO6yZxDt0tSAtTlru2O7TXvdr7bB/TgCn4XiE2NaBqDUMOkHL5tyjZ40YCh0EkejVfArMtN+eSwFeLEpKh+f8aA2dbmctJA6nviT5+GQQN5Ylh0oGd3x7lzBrbV3XL4bZ3hZ3UGtWDZ4NSAMCqrX8IvM+gW3looQ5KD9ewOtPoMVnUoSFZKxwAMLeaa9nF95lpkcrEguNi0R6WXdiHxkpgCzZkLqACFFcEl/oNCp0aa/Xpq43SMb2Bzm2bQL+BxdzDnBCiNENIPx2SsdAPyNVuZsHpaiZjajuepTh3LPg05971cI+IkO3ZcZM5sqkLuzWbMUXdRu5/8Q0jod+s9lKLhTTXe/szUGJlHwv3yeCvw7IVe71NDLOD+FRcu3qy2qTeU9d/lVSQft5Al1vnXUTr7VF9JuMyKpWcZfN92sKqt7hEvKZ/p8uyr19xAkiuwwCvJmnsBCX3i2yY8ItYv+9iGGyBBN/RkoPLh4jwfPeB65/eUYt2ecSj4aCZ5rbWEUl/46vlIZhU7648QH4hVHjg2f/RO74sNi14wMm+JuHkDnTFtC6v9A7lraonKYVJ5y6StTgdOBGMKhYg/CR405+7LpanqlS/xTfNUY8qwdQjP6ZAqUot8YQMuA8HIxr0/zFOS0o
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6512007)(2616005)(26005)(38100700002)(38070700009)(558084003)(33656002)(86362001)(36756003)(122000001)(2906002)(6486002)(6916009)(478600001)(71200400001)(6506007)(53546011)(66446008)(66476007)(8936002)(41300700001)(4326008)(64756008)(54906003)(316002)(8676002)(91956017)(66556008)(5660300002)(66946007)(76116006)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <01074C852D16794791861A62DC2B9AD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10600
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bfb739ee-3922-4a4b-ab17-08dbda19cec7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1UrwuO1U6R903z6aQLxZPXAAkQrtCUU+goA9OGsi8bkdWy7OHc/A4aj+EgC9T8+yhMfC/58+cmSzJkMcWGauTubvLj/Zu/TvqzKVv3HSDJH/0nb7MDsxSoZvKs+TIXCkRkRsWqkJ0vcYRBVNnAe2b61yHK4l9n05VQT8zlbI9owEyQYWKBpyysjrF4ocfN/1T3El6GXnQ5ChmRWMbegUKyvVxmIqfPQBhaotfGUiS0JNAxRZKuqkvqmJq9W42pCPezkPYnR9I9EsFxbRBzdwiHSAnJunfz7VSxlQlSy7EUUSAWgrMW6h00d83S4cz9RNz5ugR4RdwlW6vBZSeEUVPRbXlF1tYWKdQflOk7FeYwyotP6BKZr1XcV18UotvwMIySzNxtxwOyf3VuRVwSzc5en/+aqxGKlcqIxnEGKWevfiODfK/ZgO1feDTOZdzQuLND680XCBLXFG73e/rGbhEymzmWvBFtB8vaJ282buz+eMut25tV3mEETgWcDkbw8jK4lQj4pxYd+oozmO3GQTqqjsBKBSx9fdWBA6RlvqYSswtJXvr44HopdEdQ7GazFsVPBDHY316N/4Nei3s/f7NgaUDNHEulaiXE41YMld9JEDKpbzRlolpB6EJOEHhHbZgaWwH5qYzeMEUCudzlcGf89Fa1pcU/++FPrRauvoCz8UWfn+LAuIbxUv+wH8ZWiazNNqLdVV/3dJy6DK735PvjPfH2QgUZ8bjN38Vtwwq/SlcwyawVd7h6m0ocvrA+F9WOaNgRQmCBQlN1jKSDoTQHM5bCIEHSoq/KT814rLR1U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799009)(46966006)(36840700001)(40470700004)(36756003)(4744005)(33656002)(40480700001)(41300700001)(6862004)(5660300002)(4326008)(40460700003)(8676002)(2906002)(86362001)(54906003)(6512007)(6506007)(53546011)(82740400003)(26005)(478600001)(6486002)(356005)(107886003)(336012)(2616005)(8936002)(316002)(36860700001)(81166007)(47076005)(70206006)(70586007)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:01:07.7649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e77a36-8011-446a-af66-08dbda19d48f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5512

Hi Andrew,

> On Oct 31, 2023, at 21:19, Andrew Cooper <andrew.cooper3@citrix.com> wrot=
e:
>=20
> Collect all x86 and ARM changes together instead of having them scattered=
.
> Tweak grammar as necessary.
>=20
> No change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Henry Wang <Henry.Wang@arm.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


