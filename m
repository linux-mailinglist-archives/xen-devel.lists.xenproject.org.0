Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6BD3F5C52
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170885.311877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITsX-0007uT-N7; Tue, 24 Aug 2021 10:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170885.311877; Tue, 24 Aug 2021 10:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mITsX-0007sW-J1; Tue, 24 Aug 2021 10:42:01 +0000
Received: by outflank-mailman (input) for mailman id 170885;
 Tue, 24 Aug 2021 10:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r+0=NP=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mITsW-0007sQ-NR
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:42:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e91c7c14-04c7-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:42:00 +0000 (UTC)
Received: from AS8PR04CA0200.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::25)
 by DBAPR08MB5605.eurprd08.prod.outlook.com (2603:10a6:10:1af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 10:41:55 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::87) by AS8PR04CA0200.outlook.office365.com
 (2603:10a6:20b:2f3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 10:41:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 10:41:55 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Tue, 24 Aug 2021 10:41:55 +0000
Received: from f4505f0dd98f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CD7EDC6-7D2B-49F0-B42A-41425008A0A0.1; 
 Tue, 24 Aug 2021 10:41:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4505f0dd98f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 10:41:48 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6830.eurprd08.prod.outlook.com (2603:10a6:102:130::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 10:41:40 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4394.023; Tue, 24 Aug 2021
 10:41:40 +0000
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
X-Inumbo-ID: e91c7c14-04c7-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwt8ow94lMbyTe2O9Zr+xCrdeKG7wR68frym4d9H2Ek=;
 b=LiCTdE6Y0g1TBpMIbIdYPfmA+N/yuDr9+pBXV9iLqDnhhygyW94Oyv4JRWzXjxoNdTNXryizZZwtzhIgXUiqg++oB3EVeY+HfIW3sLLIAzo1w0drCkzcII6E4oSCDvm31kG9N9/vgl8uShv31PksvKQYzzdyNkImkeWibLfM6jc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4a3e5c42d3e8a96
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl9rG8ckASHSptIaAGHkUnyvveYWYCU4BcjjMDf1gGKMktb0klgPIXn/HIlPmh5i7uyj9AtOtDfqtw/TpNHygmyCCdt4VGektZyWL7PaNE+rDiT0phh+US8fxB3/85hmKZ0fiBLhudchbG958cYJ1rMWIEcrD4pXTpUUz3DcS7FnCwSJg5DziuCaSfA8a7/Ro/imIIccW7EfJOMZVpeSCHWXb5ICPzx4WYc8+HeetMbTU8nDaj3x0+IvttZXouecwHt7uuYVplzxlcf/wd67MraaJqyNxIzgwgl74lcBttLmPlYbEhAvfztDSlMKMZmjwhobxHlh/bSigeCtEDbTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwt8ow94lMbyTe2O9Zr+xCrdeKG7wR68frym4d9H2Ek=;
 b=T4B+Kw6YgOSsF1F6COgbEZK7s5FzG0hQ/o6qWc6gA9r5ehzqboUuJaBgj+ev5YR4J74BCLer20GitB9/Drc/W5wPD/kSTrBeif462SDbIa8rvjoenSJf1BfdZV//wkgHspAqrp8ht4EAgljA7T5+9mCkS3h71nB3H7qa5pajPct/moDzG0wJyxDkLSw5edV7rZqnfXgFrQN0eyLAG8yanW63Fo91YOhlpavlwobxLWdP3KVIAceR5J8z9tBxOrpciENr6TnbCrx+Qm5zu2OBxjsTjtkOf+SqBKV7/19tLshf4+PIFtA4G9+s506uqmqeRPn2+MdwPVPkS7uQBnvoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwt8ow94lMbyTe2O9Zr+xCrdeKG7wR68frym4d9H2Ek=;
 b=LiCTdE6Y0g1TBpMIbIdYPfmA+N/yuDr9+pBXV9iLqDnhhygyW94Oyv4JRWzXjxoNdTNXryizZZwtzhIgXUiqg++oB3EVeY+HfIW3sLLIAzo1w0drCkzcII6E4oSCDvm31kG9N9/vgl8uShv31PksvKQYzzdyNkImkeWibLfM6jc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/7] xen/arm: Sanitize cpuinfo
Thread-Topic: [PATCH v2 0/7] xen/arm: Sanitize cpuinfo
Thread-Index: AQHXmApE4Kv6+ShsZkCCCMo7AkZIk6uA/4aAgAA89ICAATGKgIAACyUA
Date: Tue, 24 Aug 2021 10:41:40 +0000
Message-ID: <CA410FEE-796C-4065-AC16-BB202009AACD@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
 <30ad3be3-b8b2-b83f-e061-5a428175e3f4@xen.org>
 <07661F12-BA25-4854-92A3-86172AC0ACF6@arm.com>
 <f9d7e8d4-f804-55f8-5a01-1f1733a83bdf@xen.org>
In-Reply-To: <f9d7e8d4-f804-55f8-5a01-1f1733a83bdf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6887597f-118c-4a18-eca1-08d966ebcad1
x-ms-traffictypediagnostic: PAXPR08MB6830:|DBAPR08MB5605:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB560516D841D77B186C0F73019DC59@DBAPR08MB5605.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4iu+VrgOLxbfAVOsQK26OSSGR1mHzCi0dfXu4JWgB12Kd5/K347aG9FmTCJJGsU52+XsuvVrJP/vGlnqoBkNBAAdfJpk/jovmnwGIjita1weNCZqtjcPpW4+1fjrL3yF/BzpC2/pNZteUlGdtOUeTvd7tnLZXajL+m+7Ya37WUKskQ5eZ+HjYvDEGjlTbmOnDvUk43wxdfn/Ir1IqwFylgecrjwsXfRUwiFmC46qkKmAQpnGRRr1mv0dMx4f8Gf6p9+JfeqSTyWIMz1h1jH6JwUiQ2sQNTrEuc9z2qnEVsgjXpZ+0M3aloJE18ew1DAqZyGBx7kNzAGVzbVYNIn/DLGyjXBL1PnjJFeQwMGdp1Gv2hQua9ywMHoSCjKbrJye3+aWrgNMGeRJFuCtYYqrw0KvvpGku2fcMq3z22doH6JLD9IBSxBuTmW8ttJb4GqKm89Vc4D7Jzr6YxTfjrbcAj3td5NtuQNQdirYediYZVpUFejWPZYPTZl4ktgdMP9b8Di+zSbci5gCu6UC8Ij+jweoOUO/2Fea1uohdQts0/jVxMrXsE9u10VDodWhXMH0EXIGio6i7FGPXZvy0YAjG/u5vsPnFP3aXgO2JtxJJB4adl4E14D7+5kcOyIVKiJ2COnEk57YJjivA0oQWzMhCPvp3DLk0+3tyio/AOn4wFFBpo60CDjgBQV5r5mTQCruNBq2+pUiu3pcQtD6fQUgjGKzijTAyMAJYnsz3r+vKkjHlsxnZRsRZp5F1z6CrpAA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(36756003)(2616005)(122000001)(5660300002)(6486002)(66476007)(8676002)(38100700002)(71200400001)(83380400001)(66556008)(6512007)(33656002)(66446008)(66946007)(4326008)(26005)(316002)(2906002)(64756008)(186003)(478600001)(6916009)(54906003)(8936002)(76116006)(53546011)(6506007)(86362001)(38070700005)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HbBb4uShFHuRbmH19Le1c6onW13Nd9BXRWB3LV8bHF4Tt/beXfaIHbBHdN6l?=
 =?us-ascii?Q?aqrmAkFKA+5bUcBFHReUdZYQwrM20wipF41TkuN+R+NKoIhJFqTgmHqmHWsn?=
 =?us-ascii?Q?nAxcNP6f1pl2ne/RGV67dgbeLu6aW6drcCipuOjgPoqrY1k55knwaG5bDpB/?=
 =?us-ascii?Q?OLKQC6VlAIzi/hDt8Fz3Zswt76eO416sHRK+AoTfwTqzoKMFvOQZxYRzV9Ks?=
 =?us-ascii?Q?d/i+hbvFMMThy3WJulZb/caN60bindmE1HeBDzs2ED1Kvnvt+ZMi07mPdK0Y?=
 =?us-ascii?Q?MhNDcTDt6sW4IRynG5ySSNhDGgQpibrIhq1Gy00FHaop5rvceDRbgPh6VDlk?=
 =?us-ascii?Q?LmKTjaI14wja/fY9o9W/pCA9R3hpdT3SsUw0drYkYqUVZITdWJoFYWOEImnF?=
 =?us-ascii?Q?LQZegwIHHC9FG2wvOwlNwRcyCtJc5MMd0G/D1uZHwOdOkeLun5Zue/hQ2uL1?=
 =?us-ascii?Q?bEpd5zcjrNpGi5GoGjLhb3ZDCtwdhQ1YIC5ZKvmwBlCoWpyNppKqyhEanJHN?=
 =?us-ascii?Q?YWSvjL2QcF87p8dg7OT+R8vrJdgmBc92EdT+lpwxqwf+2prGTUmnrVQa1gie?=
 =?us-ascii?Q?r1dOZLzR6KhE9PyBkux+Yhrf5P5DQ63fRjH+rx+DDXXofzc/MmQZIoZxBbKT?=
 =?us-ascii?Q?zeXdCkL4y1880g1v7t3R8a0I1AkpY1hoi2Iri77EnNWZ2KIf71wKwb5jImnU?=
 =?us-ascii?Q?WlKJMk1PgGAiMhig02u0eVOo9fEbmXmgEcVT7RjL15h3DsSXSEaO3YVyVELy?=
 =?us-ascii?Q?niKTwrz7PHUfPP3DJDFqQYvnPxTHq0Wz8pnHc9jb80dTc9fghqIOkhnKCtdy?=
 =?us-ascii?Q?XTCxUbN8aoURS1YnG+mS7Gba1z9awI5V/6cZ3fBsmIeCK1f0exo73X939KN0?=
 =?us-ascii?Q?W7Iq+b2Hr5U3IHnbQH/vS7ZvrFvqpTB5pLNTzAI1dN3uHUD3v0LG6ZpAVaEC?=
 =?us-ascii?Q?YS3zfe6ffzesSqQCriLprfk/cuFEqr+6n8YNOED1dazzP8srQJiVFatQ7ydY?=
 =?us-ascii?Q?WdiK0nOw/SbUIMFsIvhKR3b5m9w0UmvgBLq3HHXUUVawqdIXM3epws79rR9a?=
 =?us-ascii?Q?JVHWnUDCKxbtW8vCuOVVzj183rE3vDpbYrvZs+mn9hegGtPkO37v7gqt/WDL?=
 =?us-ascii?Q?wThAIk0cXle4LZNBaq+NpA7RUpP1/UvL179pwTVMXfKK6ZsBfgUTYsS2SDQD?=
 =?us-ascii?Q?WejaQ4j5jBIoczCKY9kq9FB5ZZ9ou1JXi01WdLfydEWOHBcp7t4gHVemZkay?=
 =?us-ascii?Q?cVoHLHvlQ3lLFit9z9O+Piw06FsC9uf/B3R5lqjdUk0dW0qHz3Sb8CsH4nDD?=
 =?us-ascii?Q?eIsBbOhjs6rD0TeiwFXuhz3r?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46696445DCDB3B4F8A915D7346F046B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6830
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06232a04-b8cc-41cf-daed-08d966ebc1fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F+4HPuV5ZbbVgHs5LqZ7qSK10ItIhmVr1eEr2G+J7Y9QrB0k6uXAz3FxDY8XhVAV1BRa7tk3IKj9o8NwiWfGPopO8A+Hr1m0FlIKfvZfHm3fB5Fe0lO557ySFVNS49/D/bLeJJ4HnEkRaTKQMjpXf27/p/iws+qGHJs/uVw/DHnnhS7004nkyjqzdMcCbvAat47s64/UHPHohVaS/Ensp+4ctj7AElq6z1w3hNQDw9NXmRLt+dMBPPwddwWFHjb+iBZ1R+nKlpIHuU5wWRIrK+s8CDdOb3ToB3lKd+DrhawKV7YoSjUkQfa0e9fyuhUL5hK7fWfDKripJKKN3IXT6ceq8WEXnowLCGBL0SCamY8GOsCQnXqUaQ7yAMydbkcypKRe/fHo66k9dVG6Cz0z8tco0jZ6IoJE/6WNxiofVScXWfV9AsFSBBkhcJdCrRgKEy65B9+guxBU7npB8lqmfwwkaKcYykjsVFvSWd1iK7kX+jqqRuIQfE22S/BWvKe8PUcveo0FCoINVjkrqzPzDVPrkeQvS84VnpfE1SXTrGZ19S8OWq3nGLf/uuF9pCekfRqEuqcNCzng8Qt9k2CpRv/WnNambg7anUg+4C9H3Hqm7QAg9Y/P+/Q1v6+Id2EeaWM4Bx9BLOV3gJ+KBBjPqcrAGggE2H417uN+GA+qPR7fjMWhbs8Ski5RuNPfuC+0ZWIlw54pzmpFH3b7fFwjSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(46966006)(36840700001)(8936002)(36860700001)(478600001)(53546011)(6506007)(5660300002)(107886003)(82310400003)(6862004)(36756003)(47076005)(83380400001)(2906002)(33656002)(86362001)(54906003)(6512007)(2616005)(70586007)(4326008)(82740400003)(70206006)(316002)(186003)(8676002)(6486002)(336012)(356005)(26005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 10:41:55.4669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6887597f-118c-4a18-eca1-08d966ebcad1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5605

Hi Julien

> On 24 Aug 2021, at 11:01, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 23/08/2021 16:48, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>> [Keep only arm maintainers in the CC list]
>>> On 23 Aug 2021, at 13:10, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 23/08/2021 11:32, Bertrand Marquis wrote:
>>>> On arm architecture we might have heterogeneous platforms with differe=
nt
>>>> types of cores. As a guest can potentialy run on any of those cores we
>>>> have to present them cpu features which are compatible with all cores
>>>> and discard the features which are only available on some cores.
>>>=20
>>> Sanitizing the CPU info is important for Xen so it can correctly size t=
he P2M, flush the cache... However, I don't think this is going to be suffi=
cient to be able to move a vCPU between different type of pCPU.
>>>=20
>>> The main hurdle I can see so far is errata handling. Not all the errata=
 can be fully handled in Xen so some of them are left to the guest to mitig=
ate.
>> I agree this is something to work on and a problem with the current seri=
e.
>>>=20
>>> The errata are usually detected based on the MIDR while the OS is booti=
ng. IOW, a guest will not be able to know that it needs to handle an errata=
 for pCPU B if it only runs on pCPU A.
>> Ack.
>>>=20
>>> I don't know yet how this can be solved, but errata are not that uncomm=
on on Arm. So until this addressed, we will still need to make sure that vC=
PUs are not migrated between pCPUs with at least a different MIDR.
>>>=20
>>> This prevention can be either done manually by pinning the vCPUs or imp=
lementing the proposal that Dario sent a few years ago (see [1]).
>> My current proposal would be the following:
>> - add a command line option to allow to use all cores on a heterogeneous=
 platform (different MIDR)
>=20
> We already have a command line for heterogenous platform. How about re-us=
ing it?

I guess you mean hmp-unsafe which is in fact already mentioning big.LITTLE.
That is what I was planning to use (I should have mentioned it)

>=20
>> - taint Xen on this case
>> - keep the feature sanitize as it is as on this case it will create a sa=
fer setup (apart from the errata potential problem)
>> - keep current behaviour if command line option is not passed
>> Having a solution to enable all cores (even if it is unsafe) could still=
 be a good improvement for development on big.LITTLE
>> platforms or for people knowing how to properly configure the system to =
prevent the problems by using properly cpupools so
>> I still think this serie with the proposed changes is still making a lot=
 of sense.
>=20
> +1.
>=20
>> I will start looking at a long term solution, maybe automatically create=
 a cpupools on boot or investigate on the design you provided.
>=20
> IIRC, all vCPUs of a domain needs to be in the same cpupool. If your plan=
 is to expose big.LITTLE to the guest, then you would need to look at the d=
esign proposal from Dario.

I started to look at Dario idea and I was also thinking we could in fact pr=
e-create cpupools for each kind of cores.
I will continue to dig and come up with a design for that because we have s=
ome use cases which might be more
complex like allowing a guest to actually have both big and little cores in=
 which case we need to provide them with
the right cpuinfo and make sure the vcpus are always assigned to the same k=
ind of core.

I will work on a v3 with the agreed changes and then write a proposal for t=
he next step.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


