Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07757047F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 15:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365131.595215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAteS-0006A1-QI; Mon, 11 Jul 2022 13:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365131.595215; Mon, 11 Jul 2022 13:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAteS-000674-MN; Mon, 11 Jul 2022 13:40:40 +0000
Received: by outflank-mailman (input) for mailman id 365131;
 Mon, 11 Jul 2022 13:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oAteR-00066y-2o
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 13:40:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b926cf3-011f-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 15:40:37 +0200 (CEST)
Received: from AS9PR04CA0092.eurprd04.prod.outlook.com (2603:10a6:20b:50e::6)
 by AS8PR08MB6695.eurprd08.prod.outlook.com (2603:10a6:20b:399::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 13:40:34 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::6a) by AS9PR04CA0092.outlook.office365.com
 (2603:10a6:20b:50e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Mon, 11 Jul 2022 13:40:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 13:40:33 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Mon, 11 Jul 2022 13:40:33 +0000
Received: from 0fdd8ed34ac7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F85C653-0F76-4295-926B-A769F466DF8C.1; 
 Mon, 11 Jul 2022 13:40:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0fdd8ed34ac7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jul 2022 13:40:26 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DBBPR08MB4759.eurprd08.prod.outlook.com (2603:10a6:10:f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 13:40:24 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 13:40:24 +0000
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
X-Inumbo-ID: 0b926cf3-011f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nzX0EM9ELMGczQnvtOdm3ynPBktFYg92hmiirsklHr+CAtW8vpUMgItQX7l/syRV9AV0biJwMjgzX3CdgfGe7uys27dTG7l+e6fdA/GTp+wrsPrIYD/sTbSakOrFNrrtTjQ3TFcp/gtVnleTUc7BwCbwd+nsXIWNs++7bI6QPJWSvYhtSHUSJoc+Ge+6TxpM60Sd+/hgMaRzJudsdJWkegqanBAAJm15W9nJjomRsAmQSNjKPBObmBCr2JpHd/WgL8GyoPmAMHpy2PRogplVelI4ZaWSy8Q6giCcqBGGPybL9JElikICN6ur9fyKK8woW0aNL5w/XMM1KxW+WCJUcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiDl7AjcjKfAQDcF4b1pL5X+NtcCzrj+va2tVc3T7nU=;
 b=cU4NaVXZRGCkJvYCSnsypyhV7tn1K+yECBPq4O4+prHCSASLtfAHkce3Ut5+jPPxda5kfo2QlWIApHd/ey29O4LBkH4d3e/BM+RSxm13RvJ96eS1xqYuzPLPx9r4TwgdjU1iThK0i4sSoRwDdwMvtHk7jSzQOiSrMaIA9wEe06twjSIejkVne7WA/Lp6aOdqLg7kOJoJUVIb2xnlOx9ueoYT2fA0ocADK7BJzDI4RSmNF/RhbEnLARNGB/Nvsta42U6xQAdvvL5nHsiY9eXG3ZXyjcsBq8ydImvYPuVpu1yWKS/KT56aKb0EKo7/UmuEWOmZguVaYV7ymNF6uEc27w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiDl7AjcjKfAQDcF4b1pL5X+NtcCzrj+va2tVc3T7nU=;
 b=pgvmor8lSvMe5bXxWuo09+4bvBbmcqLTejZ77AnX/lE4mZv80GpvKkVRI2Y8ft75lPnEHNlmCdMupasyovzC/Wlud+Raja7J/6hDiqkNN7orskpJOKsq1yS4+E/Vi1m91C7LsJr8bWpQmZuOrAcRIdShOZUudeZrCZqI0ETdyBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bbfb045e29fa712
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K21GRh6bKPRf/KnUkF6hYJ+QKClSM/lVcKwCnDKJl+mO072n6e7v9DLrUeg669KqRKWQJeagbSTXDdGxyZW2d75HwOOw6KY7fKeqt5gKPJUGTSC1NMdHHFApmCd4OgTySn5NVwPySnqdqXCU8b8EMubCdAfNtTlA6KuaDfLoW1o6D8Mrd1pALTkUdeDJ5iu6plnXEbHq30MtLCiOWCKRzHwERaA/TBGs8/WDRd+WIB9Yj2zoivwTSmVhJtnsh/8fRjpr5eiuEJnZSae+WYMiYYugSJdHH5agF2ibboKc6P2FIbmI3YffDLtpTaxL+/0AaKc8SNB8VjOKf7gapgXTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiDl7AjcjKfAQDcF4b1pL5X+NtcCzrj+va2tVc3T7nU=;
 b=PzNWAMqh/+xBlsBhyYl9JvGIyMC/s0prXxbhh8MkocmBKHzh7qfWRCpZsQecA00fLGdI90hqHOO7avOSPHb+KIc8bHLwnw0Uz9y3xgbdZz8K2Zeux7LAG/XPPFDUt8ZNREGe3fCHrICMRr+iNHQIEqXtMkF/5DQykIWR5dcOAo5motyzgyeSorAVfOsVGbSrgHAbGDoOvu+I5biTH5yVRAXFaNDoSAOudBZRS8s3t/oFpAaRwi9hA8nlEWGVydKDeHyjxw6ylqdi6ePPcQaLxAzXfisnQQKmH40Sn+icxbSpa467vzRyUJaSn0o7iRb2bGzn3G1b4gvX9clCFRx7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiDl7AjcjKfAQDcF4b1pL5X+NtcCzrj+va2tVc3T7nU=;
 b=pgvmor8lSvMe5bXxWuo09+4bvBbmcqLTejZ77AnX/lE4mZv80GpvKkVRI2Y8ft75lPnEHNlmCdMupasyovzC/Wlud+Raja7J/6hDiqkNN7orskpJOKsq1yS4+E/Vi1m91C7LsJr8bWpQmZuOrAcRIdShOZUudeZrCZqI0ETdyBU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Thread-Topic: [XEN PATCH v3 04/25] tools/firmware/hvmloader: rework Makefile
Thread-Index: AQHYh+Qt/49JLdoEv0uAADgNQkPLF610seaAgASVSoCAAACRgA==
Date: Mon, 11 Jul 2022 13:40:23 +0000
Message-ID: <316E0891-D201-47BE-B616-A785CE1B114A@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-5-anthony.perard@citrix.com>
 <35DF552D-E8EE-4478-891F-792F67D690D2@arm.com>
 <YswnzaCLry167ghv@perard.uk.xensource.com>
In-Reply-To: <YswnzaCLry167ghv@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2e464938-a073-4083-e16a-08da6342ee05
x-ms-traffictypediagnostic:
	DBBPR08MB4759:EE_|AM5EUR03FT048:EE_|AS8PR08MB6695:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hWipdXfb29WPqtHost+PCCM/LVm8DnKq9wFSnTuBenqKDkCunh2eHTjje13jTcXw00hLUmXBt9QQbsgT5SJCrWAtOz8xUN9j7DwlFfGQauxbLw17onc4DkQ2vz7UDJ5Jr16JDmwesKukAxbE288aA6pweJpDrgy+mbGwFCHyKmt2/CRFwzJ5ytmg4ozHfvRYDaGQ1+7UXTacwgyEWMx2IybsZtUNPuWmuAcTRaErEA3PCpeEnlJhFcO2ezqWNAXZU0eli7Mp5pv6Ei3gzCcaj7fhQL1fuvsTnu5hF0OxXBUJpMGzG6aXQIcrj2GPuEnelPkcXxaaTE+ss8z9PJgyJ8CrM3TV8n0lKVdvvK/hkp7S5EimTt/QRmZ+KLIIvJdjde28kGUnPDdrUrsCLFyTgIiENge0Cxt3hCH2Kcz3Mrjo5+H0OLlhF5gaWmBeEjA89fJLLKa1Lra1huzDWifj3HhnMUOQ9rbzvAkJorrvRD6BeM2T8YFA1hytopiT/D4rItOtghnoDj9urG3mXlhGeunjeURXOijbWZ+BDrzUlQLoyh1myv3lU+AbFQyz9PAZQVZPPuFXj7VYDirYZbCIZUkAdCIbcwL2TgvuJpTAykH+ghMyo6cSZ9FmqviBMCdw080VcQpG+jEOl8Zq0UKziuvSEF67fmifzyTo/p2akVFiONO8VIPJhaAJw3681B4E0/H13AGYhOkxlXpJWDBOfQO/el7svQ0vQq1peizdCR6nlKncESNsoQcUT/R6hlePD2CAe5T3SjWQd5C4NHt7TJMm4snnjgTcNARD3SjNrtn4QyfZlVeqoQsx7TEQ4cUlFWX4lCEFlTm0MIoGaHXJ3wGVkCsprz27Mj++9QCW5vo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(316002)(8936002)(5660300002)(122000001)(26005)(33656002)(91956017)(478600001)(54906003)(6512007)(38100700002)(6916009)(36756003)(2616005)(38070700005)(8676002)(66946007)(64756008)(66446008)(66476007)(71200400001)(76116006)(66556008)(6486002)(86362001)(53546011)(4326008)(186003)(6506007)(41300700001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <17A887557D9ECF4FB09046BA530EF901@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4759
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f40a5a7-cef8-4aa9-339a-08da6342e81e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YStjcKmmG36FT27FeiWCmH/AF/94pWJSrDPbjkrcmcrSwOTC7+uHBGNNZsXnygkVQo1Oe9/31hQyVapwi6ukqMPv7Yr7vwt6ZEXc44csECmwyEuHLfbkbgIwZkanlkZelrPszHseV9nO1dWTjSfGppxgqhCbK5tYem9EKEST6qKGK2nOFBYRHbOheDebosSiL6zdFSxaSTW9Tzns1+Iju0pciK4U4j/kkuSgOMmzalWqALPXoeWcxMFVytb48hnyM6lvX5j5C+YAyiBj5NkPiRCAI35fdqJDzHNsH+Jvs1Y+m8+ZfD5Fog5ZMBeqWNR8rPgyEWu0Eh9jkLEfDOm2n9TZq4ra8Bqh4bw7Tkv3W2AySN/CIsZ7PWmuVPnCqYVjBW/mk7zdn9kH3t9uQB7Gn9okFoEgW+Tcdxz3eZMNCj+dWcux7EhCpJCQjbL1FKtjq5qbcdfpMoD7+3BgeNTN0224jLSVLqz00i0uIzINV2UD56sh8XTQDweE/0dixkFBJaGbukXWtD5eQt1lcctUYBkHO/NRXY+BAHXk7Q/NyA0LpqhuAa0/VQxqq3NQhDYHjEkZvonfJBZJiowFlWeHJJ1NoxZyimrs7zicVHLjR99Cig/JN1YCaoEUq0aObjzxORxCVovrgZIc5auH38lm90BMYes/09fCxLlaiL/3uHx8k6r6Nkv9F9r6ABYgrUpJtmCxn/myCS+of7vEennlHrgchlZTtyW/Wv1e1IJEP5zzV3BykBqnyYmqmhmCfyJ60YctnGdN/43rl3yR+eR/g7wOxX0gWlNQ036VazzSsFDBoBUm7d1OLw/azvZa2ptd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(478600001)(2906002)(41300700001)(186003)(82310400005)(4326008)(40480700001)(36756003)(8676002)(54906003)(33656002)(86362001)(6486002)(70586007)(53546011)(6506007)(70206006)(26005)(6512007)(316002)(81166007)(2616005)(356005)(82740400003)(40460700003)(8936002)(6862004)(5660300002)(336012)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 13:40:33.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e464938-a073-4083-e16a-08da6342ee05
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6695

DQoNCj4gT24gMTEgSnVsIDIwMjIsIGF0IDE0OjM4LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIEp1bCAwOCwgMjAyMiBhdCAw
MzozOTowMFBNICswMDAwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDI0IEp1biAyMDIy
LCBhdCAxNzowNCwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdy
b3RlOg0KPiBbLi4uXQ0KPj4+IEZvciAicm9tcy5pbmMiIHRhcmdldCwgdXNlICIkKFNIRUxMKSIg
aW5zdGVhZCBvZiBwbGFpbiAic2giLiBBbmQgdXNlDQo+Pj4gZnVsbCBwYXRoIHRvICJta2hleCIg
aW5zdGVhZCBvZiBhIHJlbGF0aXZlIG9uZS4gTGFzdGx5LCBhZGQgIi1mIiBmbGFnDQo+Pj4gdG8g
Im12IiwgaW4gY2FzZSB0aGUgdGFyZ2V0IGFscmVhZHkgZXhpc3QuDQo+Pj4gDQo+Pj4gU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+Pj4g
LS0tDQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9NYWtlZmlsZSBi
L3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9NYWtlZmlsZQ0KPj4+IGluZGV4IGI3NTQyMjA4Mzku
LmZjMjA5MzIxMTAgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL01h
a2VmaWxlDQo+Pj4gKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL01ha2VmaWxlDQo+Pj4g
QEAgLTg3LDIxICs4OSwyMSBAQCByb21zLmluYzogJChST01TKQ0KPj4+IA0KPj4+IGlmbmVxICgk
KFJPTUJJT1NfUk9NKSwpDQo+Pj4gCWVjaG8gIiNpZmRlZiBST01fSU5DTFVERV9ST01CSU9TIiA+
PiAkQC5uZXcNCj4+PiAtCXNoIC4uLy4uL21pc2MvbWtoZXggcm9tYmlvcyAkKFJPTUJJT1NfUk9N
KSA+PiAkQC5uZXcNCj4+PiArCSQoU0hFTEwpICQoWEVOX1JPT1QpL3Rvb2xzL21pc2MvbWtoZXgg
cm9tYmlvcyAkKFJPTUJJT1NfUk9NKSA+PiAkQC5uZXcNCj4+PiAJZWNobyAiI2VuZGlmIiA+PiAk
QC5uZXcNCj4+PiBlbmRpZg0KPj4+IA0KPj4+IGlmbmVxICgkKFNURFZHQV9ST00pLCkNCj4+PiAJ
ZWNobyAiI2lmZGVmIFJPTV9JTkNMVURFX1ZHQUJJT1MiID4+ICRALm5ldw0KPj4+IC0Jc2ggLi4v
Li4vbWlzYy9ta2hleCB2Z2FiaW9zX3N0ZHZnYSAkKFNURFZHQV9ST00pID4+ICRALm5ldw0KPj4+
ICsJJChTSEVMTCkgJChYRU5fUk9PVCkvdG9vbHMvbWlzYy9ta2hleCB2Z2FiaW9zX3N0ZHZnYSAk
KFNURFZHQV9ST00pID4+ICRALm5ldw0KPj4+IAllY2hvICIjZW5kaWYiID4+ICRALm5ldw0KPj4+
IGVuZGlmDQo+Pj4gaWZuZXEgKCQoQ0lSUlVTVkdBX1JPTSksKQ0KPj4+IAllY2hvICIjaWZkZWYg
Uk9NX0lOQ0xVREVfVkdBQklPUyIgPj4gJEAubmV3DQo+Pj4gLQlzaCAuLi8uLi9taXNjL21raGV4
IHZnYWJpb3NfY2lycnVzdmdhICQoQ0lSUlVTVkdBX1JPTSkgPj4gJEAubmV3DQo+Pj4gKwkkKFNI
RUxMKSAkKFhFTl9ST09UKS90b29scy9taXNjL21raGV4IHZnYWJpb3NfY2lycnVzdmdhICQoQ0lS
UlVTVkdBX1JPTSkgPj4gJEAubmV3DQo+Pj4gCWVjaG8gIiNlbmRpZiIgPj4gJEAubmV3DQo+Pj4g
ZW5kaWYNCj4+PiAtCW12ICRALm5ldyAkQA0KPj4+ICsJbXYgLWYgJEAubmV3ICRADQo+PiANCj4+
IEhlcmUsIGluc3RlYWQgb2YgLWYsIGlzIGl0IHNhZmVyIC11PyBXaGF04oCZcyB5b3VyIG9waW5p
b24gb24gdGhhdD8gVGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQo+IA0KPiBtYWtlIHdhbnQg
dG8gcmVidWlsZCB0aGUgdGFyZ2V0LCBzbyB0aGVyZSBpcyBubyByZWFzb24gdG8ga2VlcCB0aGUN
Cj4gZXhpc3RpbmcgdGFyZ2V0LiBXZSBkbyBuZWVkIHRvIG92ZXJ3cml0ZSB0aGUgZXhpc3Rpbmcg
dGFyZ2V0IGlmIGl0DQo+IGV4aXN0Lg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3cyENCg0K
T2sgdGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbiwgYXMgSSBzYWlkIHRoZSBjaGFuZ2VzIGxv
b2tzIGdvb2QgdG8gbWU6DQoNClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNl
bGx1QGFybS5jb20+DQoNCg0KPiANCj4gLS0gDQo+IEFudGhvbnkgUEVSQVJEDQoNCg==

