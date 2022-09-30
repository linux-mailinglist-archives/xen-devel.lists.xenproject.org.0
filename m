Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96455F0C84
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 15:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414249.658428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeGBd-0002qR-NU; Fri, 30 Sep 2022 13:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414249.658428; Fri, 30 Sep 2022 13:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeGBd-0002no-Jy; Fri, 30 Sep 2022 13:36:17 +0000
Received: by outflank-mailman (input) for mailman id 414249;
 Fri, 30 Sep 2022 13:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrHG=2B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oeGBb-0002ni-L5
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 13:36:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daab3ba9-40c4-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 15:36:14 +0200 (CEST)
Received: from AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) by GV1PR08MB7731.eurprd08.prod.outlook.com
 (2603:10a6:150:52::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Fri, 30 Sep
 2022 13:36:06 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::a) by AM5PR0201CA0002.outlook.office365.com
 (2603:10a6:203:3d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 13:36:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 13:36:06 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Fri, 30 Sep 2022 13:36:05 +0000
Received: from 2534b0f46798.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBF45B78-C332-4517-A018-4C3637A4B9B1.1; 
 Fri, 30 Sep 2022 13:35:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2534b0f46798.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 13:35:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6580.eurprd08.prod.outlook.com (2603:10a6:20b:369::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 13:35:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 13:35:52 +0000
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
X-Inumbo-ID: daab3ba9-40c4-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j0E8Aj23k9p9RmM1BVNGRYDOxgRxHSjFk2GaPHlJiilPiMqSToCwoUHADIUYB6KNsr0119CahAMI5wcG1l98gWFy4QNEvxsOW+HHpgmrg+Q45hCs5ko/kQG5AaHjameMYdCIxZZseXSjNKsHl2LilzdoV0dm2nqEOifgtKedTmEk4dtwKE9Yy4KdWsfeUi07Bcx7sThVZXLp5wjbQrm1lYtp2CicAi6l1j3v4C2pevraxjYinsKMZen3v+GONWYUxWL7JxjrTXVNs/ySiOiZUHCeRhCxvvldFTQSdh8jHleaI5tJzRRXBHZiH3hRzXi/5xlzV/6MCamvlN2rvWy+ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y+lBaMls16rVioLuUsn0KwrXVphZcG9st/d78u+DP8=;
 b=FQ2rVT+qHPoaUfvuedma58hhky7iDvPK1EVkjx7hawBoAcchH5gH8fASq51XC9ez0Tp3WiaBu8vRPOIjid/pDICE60koAo5PVy7wm5UO2mKSiI65UL5ZRNhwnMC9EShKXgRqQ6X3GyYy3f7SeYZEfltHMPIzBN4hHuH91QlMVRcgrOF1ujSzjxtQbODiUmte1VGTcnUiR2TdzDvG5ZhWl19Bu5Y29m6XMdu75Ci5QXt/UgB1RX0kwQ+kdQ7fJSzcuh6SuvSyTCfFjLHaioHslqM4ZZp1P3OKrdHpr7nzrqyUKtbhWTtpE+M29MVGsni2V/+YbuMjvvlXSj8WOG7oZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y+lBaMls16rVioLuUsn0KwrXVphZcG9st/d78u+DP8=;
 b=hh+hACxzVgOxPLJVL2tqzBgikdWcAP/E6+gyflnRrcKXLrcpd536Jfsp77lJEZWh0OvbXgKXZZbHumSns5dGQktpS0tnuaDFUASg0MK9Gs770u3xmiH3zlY9iNlNBZR1OKzP7/LuZdufoIbM5f9ohNvqcYj4k+h0A85y3mNZbyk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43ee581f62df41a3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsW8GYKVLOb/jIixFNXrWjukyl6FShddFtmx1/Q9qHEnp2O1Bbr0Tqhv3/T2qyMYReVubV1YEi3dNAxl7FXi5/9qIokp56NmPM8EzAjl30hrowEUDxd6M1/3D1R/czmBAxi3QVpBDHuKmPIb7CmwI8gzBeS+PdzGgMOoTIkGdE2xFgW/10yjySMcB4dQ6/LEKsK2HqoVYWpz3FbtpIQ8wEQ8a/9VxJ4/g4EWkhP4LKVZUpplebxeDct+OX+DKfIA0yCqnut7jL6ebccJlD66PX+uEahbHkyOG+ciBVL48tgqIGt/00MNGF3Rez+8g+XjBt8DrCJpkTTy58RbsivGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9y+lBaMls16rVioLuUsn0KwrXVphZcG9st/d78u+DP8=;
 b=bR4Fs+e6fOFZLliXD72lBR5slaAcFArXBLJQdOzJEdXbfFQ3I6ZYnd/oSlNXoysaPL/ynsmTydqaHTig4fAplSjeUmkCgwbtYLAr48EXA2G2niCy1aJceoT7Cbac8NInnLDVLqhVZA8cDUXdK/oHguaZXzu/V1EI8KFpF94h1HfXRqfB4scj3MnxvzTwG1rvf8MwfT83rLnJdM9jg5wROexNFDH5/b9ipbshDKQlkQ+QzBCdBM1hTbF4wa6agsjrGXGmNk+93ovuKO8E09JVipmC9a9FAGC2GqHb6rvJ4P5Aki/HWYndDcVocUayCwbVlpKyziM5bqmrg+N2iihZBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9y+lBaMls16rVioLuUsn0KwrXVphZcG9st/d78u+DP8=;
 b=hh+hACxzVgOxPLJVL2tqzBgikdWcAP/E6+gyflnRrcKXLrcpd536Jfsp77lJEZWh0OvbXgKXZZbHumSns5dGQktpS0tnuaDFUASg0MK9Gs770u3xmiH3zlY9iNlNBZR1OKzP7/LuZdufoIbM5f9ohNvqcYj4k+h0A85y3mNZbyk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH][4.17] EFI: don't convert memory marked for runtime use to
 ordinary RAM
Thread-Topic: [PATCH][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Thread-Index: AQHY1KFdAull5ChokkeaXft6EPXQra337hgAgAALwoA=
Date: Fri, 30 Sep 2022 13:35:51 +0000
Message-ID: <A156BA81-A345-4462-B340-6FCF9A1509BF@arm.com>
References: <cc0fbcb4-5ea3-178c-e691-9acb7cc9a3a7@suse.com>
 <bd694db3-683e-a856-d4de-97589e4520aa@citrix.com>
In-Reply-To: <bd694db3-683e-a856-d4de-97589e4520aa@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB6580:EE_|AM7EUR03FT005:EE_|GV1PR08MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3d6d4d-8214-49eb-3e76-08daa2e8b9e1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IWBhi0yfHG/5+VGn22f0mhDU4VwuEuTkqjjyCZDVUJ7Lx7JKOTzKVUs38OA0fN4s2p/b35U5nxVIZiKzEcLJQR5+XTpvQLkyjrozsg8Jy8tGr/J9ZyzbbKOPvDsSKrTDovEUaWPciaMxhBzmVFKuToo2KfnPkydrXxNbQD2rLBfSOCJR7qujg6B1fkA0Fuon+PTbsf5SsgoHgVU3IzzQ5VbCcwqfEdB0TInddUMeD5YOAzktjrY3DfWmHX1StCS3lhZTBrx+OMQUm+OMueCHqJqSwiCOxOEN5AWy+W4RI386bO/W2ZxXfgbaaeOR0R544LSkVxNOAmsOJfdLmhxP5e36Nm8LMAPr+Y0zUQBwj8EApOJnpee0vFbcUPtO5r14G8tPVkfJQTo7u4V8s2oUqypEbJkQ4QEkqrFuRvlLKIjtBOBvPTOPGlIgrcyJWtdYpcV8+/gy2lOdVn7J49UfvXBZV1IflUkliwbUtHS503ji4rwz1GjHdAom2dn7TaKfZ73W/DT9K0ZhWF14d7TuionezinN87a9cgVqHgblhvMAlAjns4KgZLFZbeHGPNj8wdfUsSlDqDHhVK10zhRatYCxJn5BU2/z7mHMyNC22zeM7hSkHvRG8yDVwQFKypCee6sgVvP6TyWCO4e7zu4ipITE55Oe/FSZ2DcV13Rn9DsFe8QTyNrI6B0We2751xJ96rXkx65S1CawwpeCa54d4WbkCu5MkUSOo+aPITNWllmowOlh6BYLwn1j/3erpMZW4FHMCh143/nNSxvFnBhZ+r89xkZSgPYtwvtSTfsUHOQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(4326008)(41300700001)(64756008)(8676002)(66476007)(66446008)(6916009)(54906003)(66556008)(91956017)(76116006)(66946007)(316002)(122000001)(38070700005)(33656002)(38100700002)(86362001)(71200400001)(478600001)(6506007)(83380400001)(6486002)(26005)(6512007)(2616005)(186003)(53546011)(36756003)(4744005)(8936002)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5502F0C1115CDD498108F180601ACB22@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6580
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7e02943-f62d-47e3-bf1e-08daa2e8b17a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qjebGNbTy634WMUYJrgl1ZoGyyCSgL5VsxWwcvYHL+kV9M9580ctTKz78Ctn13jZrARzKUe4ESGfDYBEHUunf2Ia+VEicVkmyhWCKlXuM2vLGlmV9x2ZsLhKfi7oNeXa+ouZubVc6lviCZT5rhD5XaYi4LwIGToDx/x+AROuw5a5RaJHRNQXD/FgCHYkwOv/y6P/C2iqRDEQmCeeWuQKWoVOQVovbqTp2sL219LmNmUzXbUfXVJAjQoro6oyCcYZz1aWIMS5qF7hAe58yEvPBfruKosYRNOClBw/CH/VR4r8BO/O5heE0CShSPbwWA2H8BaRXizYlnvYkDPz+5iVuTZ3JRRoM/kK3j0Olgv6x0KsGtuGLf5HYsE9xtkupdcVr9zp2UWRhtbY2uP5wKHfhv1ennt8AeFwYv/hul1+SJL+dPrn9Cn6bj+V9Hbzr+vlFNnvucnCnWvQB2LNttB7LuNsELYhkFiNcWNy6U908cb2AgOTA1/elsQA21FAmkcP4Du3styT3JqX3F07HmK+60wBBj1KQnA54g/JiTIvqOxFIUbgvi6cZUBBPRJgY5e6XJr3DCpBdOHZ4qgWT522DFojYQz0LRpTrX9xG1FeIv+v3kr39VebB/d2V+fU+sgWzPwU9QR27FOmS8iwootpODo16w+l8fwCuygEeH+yr4qgrnzezqndUD/Ivx9bsVA9aDeC1tFpi+kPWTHRe3iJeKezM+whXGuGScKmLeZdMVuvjGDvTENSXFHctw+2yC4xFaNqOPWhC6JrumBJE+HTYg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(186003)(4326008)(8676002)(70206006)(6486002)(478600001)(336012)(2616005)(70586007)(47076005)(316002)(6862004)(6512007)(26005)(5660300002)(4744005)(86362001)(8936002)(53546011)(6506007)(40460700003)(41300700001)(2906002)(54906003)(82740400003)(40480700001)(36756003)(356005)(81166007)(36860700001)(83380400001)(82310400005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 13:36:06.0380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3d6d4d-8214-49eb-3e76-08daa2e8b9e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7731

Hi Andrew,

> On 30 Sep 2022, at 14:53, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> On 30/09/2022 08:50, Jan Beulich wrote:
>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>> higher priority than the type of the range. To avoid accessing memory at
>> runtime which was re-used for other purposes, make
>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>> E820_ACPI memory there and hence that type's handling can be left alone.
>>=20
>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Isn't this also liable to be the root cause of the crash reported on
> IRC, where a read-only page was being inserted into the heap?

No this should not be related at all.

Cheers
Bertrand

>=20
> ~Andrew


