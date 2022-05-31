Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378D539358
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 16:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339705.564594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3CL-0006qW-Od; Tue, 31 May 2022 14:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339705.564594; Tue, 31 May 2022 14:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw3CL-0006nU-Jw; Tue, 31 May 2022 14:50:17 +0000
Received: by outflank-mailman (input) for mailman id 339705;
 Tue, 31 May 2022 14:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nw3CK-0006nO-7D
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 14:50:16 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe07::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fabe6018-e0f0-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 16:50:15 +0200 (CEST)
Received: from AM5PR0701CA0053.eurprd07.prod.outlook.com (2603:10a6:203:2::15)
 by GV1PR08MB7361.eurprd08.prod.outlook.com (2603:10a6:150:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 14:50:12 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::28) by AM5PR0701CA0053.outlook.office365.com
 (2603:10a6:203:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 14:50:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 14:50:12 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Tue, 31 May 2022 14:50:12 +0000
Received: from 45a7cead38c6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C66D9E34-1F6B-4D4C-AEBF-93DAF2879751.1; 
 Tue, 31 May 2022 14:50:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45a7cead38c6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 May 2022 14:50:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5531.eurprd08.prod.outlook.com (2603:10a6:10:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 14:50:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 14:50:02 +0000
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
X-Inumbo-ID: fabe6018-e0f0-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gcEuIwOHN1qJAoTv5VFUkC0t+mnU3LXBp6uZtjEhTlgTHpRbgYSLaqbQxKOnRdps34apQ2lA/oX4YrnOvEwcaJtRotkE97m5/kO4aCuEVb6qhyAJyAOMEpYLWm+T+6BRJuq2rXM5kdiQBGSc7ciosl6HTncPcYdElNSiB2aqAE71yjcRGZdCBPEUDsRXECE5FuSrnfNxvi5eUHlC79bt/sjzp0GgUROBj6WrFzrYEcgusUrNAD+rJOe9QvJQ0wxR6EFQMEuaEJt2fAydDAuWAPTsJxP3TTxIG63n2FHcLlLjzr6BW4GWSGgTjAypemqdXeZqakakb5yDEUvs8hKVxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woTtoY/Yu0DZ7KYZFusF/MiSekw8kB15eXAdmD2W55c=;
 b=Swhq9vot+YrkAaY0gZOMCpnFsqzHFrmbqEXwycEgoDvkK5uz0ktbke9UBTmoQLKBuNsygQQeGNIiWmNP2lH7AYJ4pvm6uH3eZQu71wboQMmi6SahmqiAQsMxKE8HT6/NoA2LSgR+MtoiPkmoYIVunHTBfwuyYpPKf6Lkl4X/yul4LSt/ICs0CrLiNuXvvBkDbUuXaxENmyBQWBYolUlAZYFVnyA8vptT+1cUC6+eNiijouqGWMFdzIFtTHIN6YH4fOplak68C+vO2Ngp+e0/fdJJQOO9nIwp6dNlsslFMosxz3JFK9uhKyqbu2mHrdPxYhrbXBiVmaZ3RzH2Ct0Vzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woTtoY/Yu0DZ7KYZFusF/MiSekw8kB15eXAdmD2W55c=;
 b=tkJs0JdJd+lXqADlPd25zKcg9IDytwB1uCcAMr+BVCMMU7Ijz7cKM5bzK9RKKkWUPtc3QZvPakms1/AQkyJvc+NpLfV17c6UPli9a3y+W1rrVxqI/fB/5noxlrcYH4JB1yzOCc1n6bNltGttZX8ugINS9i0WNVPDj6uj7pnkgjs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b5a2b729e7e433d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVQtnMpNVZ0W5A7n4mRU2bt8UPfJdXCaWpyEDsxkjAF8jXxDsHN8TfFsmbdsC6FsMIkGG4+ZbP4cu+Wqll7XE4m/Xbak8cVzAjGyw/2gi393307z43F5g0VzZicRMo+aL0P7coAiDZJx9DwkoPaCjKw7ckxJWWDN4TqMMOYV5U0+/it8tynKy8gZ9ZcmFQOGvfGSzVQ/kZJQsz2q5DVNP7DoUS33vLmTFAwBr3hmDkBhtloEY2DWPlhg4xAEVeejFq2h1u5EvQOT9y9kslkagrbWvesePd4az/yQtd++WryyUu94KM3KxTo+X+q0Sw34aILS0UNxo/15xjHbYP6G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woTtoY/Yu0DZ7KYZFusF/MiSekw8kB15eXAdmD2W55c=;
 b=LrJX+fTCfIYYuJBI3aHTh0N2iaql9uN22xP3bBpNw7zciwwPFYmqRhM35P42D1eDhK/VENzeJ+5u9VAPIHLCcR+Le0l5OlnbbbsKbX3XbJE7qZrI4+luUSR+H8l+m50KOVCYOcUdgSsug1YYpmkfhM/zgPF7IBSVR+NMotTW63CMYYM4FhvLQuxYl2T/MnHNhqwy9AtcEyKf4fCo4EwYgikb4XF2IKdtgY017CEE2uQ8ItxWKUJtnu8xtGnY+x5hTBwNTfQHUWyp14osW7ozlBEhvvi8J75g6S3YpY5mvVyMxo9nJg2/XrlwSBnEwUL+0nwWeN0AbM+uhp+UOcl16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woTtoY/Yu0DZ7KYZFusF/MiSekw8kB15eXAdmD2W55c=;
 b=tkJs0JdJd+lXqADlPd25zKcg9IDytwB1uCcAMr+BVCMMU7Ijz7cKM5bzK9RKKkWUPtc3QZvPakms1/AQkyJvc+NpLfV17c6UPli9a3y+W1rrVxqI/fB/5noxlrcYH4JB1yzOCc1n6bNltGttZX8ugINS9i0WNVPDj6uj7pnkgjs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Add MISRA support to cppcheck make rule
Thread-Topic: [PATCH] xen: Add MISRA support to cppcheck make rule
Thread-Index: AQHYdPKgb8OwohyX90ebe0mOYdpVU605ANEAgAAGrYCAAAQfAIAABecA
Date: Tue, 31 May 2022 14:50:02 +0000
Message-ID: <FD54D7F2-1A9A-4171-8708-C66BFD8510E5@arm.com>
References:
 <5467d017fa1c6721436e21f8cc10c5d74adeb5bf.1654002661.git.bertrand.marquis@arm.com>
 <a6e11bdb-976f-fdf4-6e07-a130980af90f@suse.com>
 <F7B128AC-3DB1-40E3-B3C0-D95CA367E766@arm.com>
 <b84ed70c-dc34-6eb8-4b0d-a14b3fb91710@suse.com>
In-Reply-To: <b84ed70c-dc34-6eb8-4b0d-a14b3fb91710@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d7d0288f-5f6f-415d-69c4-08da4314ddbe
x-ms-traffictypediagnostic:
	DB8PR08MB5531:EE_|AM5EUR03FT021:EE_|GV1PR08MB7361:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB73615EC9D7FB0528ADB476AE9DDC9@GV1PR08MB7361.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MO3k+ONslgl9Y1/KnGWZm5In9PC5N0YKH4t8GlBCvRP97TWnIYSHiSWN2ls32ZIE2XyKJLGOLhr8HkAGNsFXiWGlesbD3GP6T9+HYEQcLHnhPWaLo8UPRSjdSxKgJwHub1g/XKE0oDwr20v1/NjfM9EPZQyCoXUCvS9XjFtIoxmVDsjwKJnYQ/Fq8UhFMgoyNVNGSuENy4c9EddZLZfLsauOjeOMwJzvqatCRKiwwWwjgmG5zOZH4oMGCoIbIFmxtykwyxA75Y32DKYDmjwKshKNf/PNzdWwhLms5yVlj+N+KnATx5y0ecs0OSvvkoyJIQHmwjej1MV136J19AyrlcbG9wGdT8CEfyvNLTzrnHawCMVfREXAhmoxYj7XDoSlscj8QH/g6hcAo9xoiLpaxwySMjexCwl+aY8l/t/sW4fKQlMB3pWp+J1dIDk5g54ZWRYoP0CphcvxprKfkVCAZUDNwQqU66Re9WTHxh/LtBwew5UacSI9RzL/eXJLwOws63uvG7cbDRikT4E+eUj9h0sqIvAR3eb8mVyBlIi4UnDPXPAddeJeWRbNP8MSCHYGUy380qydyKk7y+KxR04y2ozgRfxV1nZq14S+1w4PNg9+C0SQ2mYaTnIe2fftSinLzF/R3WVcz59I4kkOsbaC9lRGDQJgI+XXMsf73YiGSjmQv09KEvA2NhxB3uUEBXh8PNy6DhqenSIHv3T0XnwAcZyp+u3WRNCgrS0e6A4HBvE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(53546011)(316002)(2906002)(26005)(6506007)(6916009)(6512007)(122000001)(36756003)(38070700005)(8936002)(83380400001)(4326008)(2616005)(86362001)(66946007)(5660300002)(38100700002)(66476007)(76116006)(8676002)(91956017)(64756008)(66556008)(66446008)(508600001)(6486002)(33656002)(71200400001)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A679810D4A6CA4B815C368BF3E826F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5531
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d70a25c-f909-4ae4-c697-08da4314d7db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tUG7ir9AxhStLq+AQO0a0uEN5RL88miADD7SBFYcC3qoa11P0ZLkmOn4f7VNKl2AQNxlgsNYw/AWVlVcvImlRXmPHIIglXdsItwaL0k/UIWsXQF5J7a0yV7iaB9ax+N+VLoq1cd9rdm298bzHAyyUlzmVKEMldoRKCvw5yGVouMxWE0W/gu6DNMeKw/fw3aMNk6Hd43LdT2K+viyRdIjZR5Kqr3EXtQR98P5C5+r8R3mvQOCs2nHv5cflSQJXmtT/f66oWprNJz+7vv1lGSvyClcOt1imcJZ1pDKYOdtH8sx5lR0ImJGbQcfhQVnbt7lNsKUOup/PhVfpIh7+AKvG3hpifrQaNEEC0cMUhGJ1L0rTQVbaIcg82KzDCp2Hbds5jELKWzW2WZwQd4FdxKquOBqizSnjRsMNQOUW0KddXf/PsgxKs67+0DBC+MLK7mQny20roB4HUs1tiGWczwDUTnNP74gNA1e9flYPneKlH5ZBlkRXUj41HlBDRORCNnjn//dvuuGe9IQcUjBtFxBVx6oDzBMRqhIJuQzv9Wvxd+4cJ6aAqy0W0Be3UKS6D+pfExW2PrSfmznuyFIiq7Adw6E7+/OlxuxAgCIs97Jji4Mhtc1wTmArAm7RruMpiQXyWO5EpjDDoo550d3LfyqxfXshwLKUhyZoABsVvFjfoky+RaHY+anAw7XsnOFnghJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(53546011)(26005)(2906002)(6506007)(6512007)(2616005)(33656002)(356005)(36860700001)(83380400001)(81166007)(186003)(6486002)(70206006)(8936002)(47076005)(336012)(5660300002)(54906003)(4326008)(6862004)(40460700003)(70586007)(8676002)(316002)(36756003)(86362001)(508600001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 14:50:12.4372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d0288f-5f6f-415d-69c4-08da4314ddbe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7361

Hi,

> On 31 May 2022, at 15:28, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 31.05.2022 16:14, Bertrand Marquis wrote:
>>> On 31 May 2022, at 14:50, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 31.05.2022 15:30, Bertrand Marquis wrote:
>>>> +# Replace current by goal in the dependency to generate an analysis f=
or all
>>>> +# rules we would like to respect.
>>>> +cppcheck-misra.json cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.=
rst
>>>> +	$(Q)$(srctree)/tools/convert_misra_doc.py -i $< -o cppcheck-misra.tx=
t \
>>>> +		-j cppcheck-misra.json
>>>> +
>>>> +# Prevent parallel make issues as script is generating both files
>>>> +cppcheck-misra.json: cppcheck-misra.txt
>>>=20
>>> With this dependency the earlier rule should not list multiple targets
>>> (and it generally should not, for not being a pattern rule). If I'm not
>>> mistaken the way you have it the Python script would be invoked twice,
>>> and all you prevent is that it is invoked twice in parallel. And then
>>> please use $@ inside the rule. Additionally, with the script being an
>>> in-tree one, the rule should also have a dependency on that script
>>> (such that the targets would be rebuilt if the script alone changes).
>>=20
>> I am a bit lost on the $@, previous patch adding cppcheck was changed
>> to use $(Q) instead. So can you justify this request ?
>=20
> I'm talking of $@ (a macro expansion), not @ as a prefix to suppress
> command echoing.
>=20

That make a lot more sense.

Thanks
Bertrand

> Jan
>=20
>=20


