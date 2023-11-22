Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4287F3B55
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:32:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638364.994875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c5q-0002PB-0V; Wed, 22 Nov 2023 01:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638364.994875; Wed, 22 Nov 2023 01:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5c5p-0002MG-TF; Wed, 22 Nov 2023 01:31:53 +0000
Received: by outflank-mailman (input) for mailman id 638364;
 Wed, 22 Nov 2023 01:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d996=HD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r5c5o-0002M8-O1
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:31:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2082.outbound.protection.outlook.com [40.107.13.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e975e169-88d6-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 02:31:51 +0100 (CET)
Received: from AS8PR04CA0044.eurprd04.prod.outlook.com (2603:10a6:20b:312::19)
 by AS8PR08MB6278.eurprd08.prod.outlook.com (2603:10a6:20b:29a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 01:31:20 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:312:cafe::ff) by AS8PR04CA0044.outlook.office365.com
 (2603:10a6:20b:312::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Wed, 22 Nov 2023 01:31:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.14 via Frontend Transport; Wed, 22 Nov 2023 01:31:20 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Wed, 22 Nov 2023 01:31:19 +0000
Received: from 14fdb663e4fc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF92CC20-59DC-46A1-8E3C-CA9A9B04375F.1; 
 Wed, 22 Nov 2023 01:31:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14fdb663e4fc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Nov 2023 01:31:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8382.eurprd08.prod.outlook.com (2603:10a6:20b:559::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 01:31:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Wed, 22 Nov 2023
 01:31:10 +0000
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
X-Inumbo-ID: e975e169-88d6-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aScLD5cn87gxnrzKp0i3olQ7umL4tjmB+FeE0iXcu8PYQ21U378boHLPlz5oRYAgy/J07JcpW6loJYSJ6285SDvkmnOD/aI7kA8YfP3056Y2C7+12MiWcgLuHPvi5TRmEzvabqOGhKYCrNO1qm5I8HEPvyKebU6UEPyujktE62Hzwd5ipkDUlPjHaLpk6eRJqal7AMJ2lgKd0iUxwlEVTapndYaQdQLzS4Wk8+p855OLhgA7YUN8Wxtlm5zP/gSPkHS+flZQJ0gjjyXJGjevNUXwlsZMQD+4bTDWT0OLjMpPmfiApmP36ZCGxGv4QtNzxwA68Bpp5mF8rTxNfescVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NeEvXvgiFb9cKJ0ps5RkrwdrOx4jX3PP5/CeFgbPlk=;
 b=XInnceH64J6tC9pmAR2BiuRcMxIV6fQMtLMrzOH1LHZQix8mREIg8VFVCDiToryuO55LV9oiYHqL705YnVqmTwDwsKyaqrr04xuW646i3XrgskRlJDAeGxxmeBi02L+yZqFcSVMw99LPiwCEKquEMqB6wMGBdYvKqb2MEm0CuBi3TQ3eBGWxenr55vcdDc0lZzxL2Ktav7ca/Q2oiqxcw00AkysV9Oli6g4ZGI1Ytcb6+1S0zBk4xNgyORkcowYTwlemQ3fWa1a7caikUUNH6kL8DnaxAZhlPXGmXVvSXsCDPZVUrlWUf4WGn9cE5OdOhRXE4qN+yjbiaKppRpbYlg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NeEvXvgiFb9cKJ0ps5RkrwdrOx4jX3PP5/CeFgbPlk=;
 b=PHN1+Hi733GZQDrqHqeOpbPDpBQfj9hdt083eEIc/2VQDNsNmaylDvO4ccmrZ2dvK2Jr+ZcLC05DU1sKir6A7V9Mp/UcAF8sgjwoxEhfIYgFbUt3fqmlLCgcDU0jO1nemwm1EQErA6XBgjDxZbi/B1En22eidV74yQ1ODt7yxn4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88de4e1721a526b6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDGxxGfedS+1UD8cB0sewkK8iLQyIqSBrQYYfav8m675mbXhXQovDNw/jnrGmy16p+1/htaqvjXiTO1ZrgOVYFLrAu3Qtsskbx5bcV6Kb82onZ/ocCKlCHk5E96F82PTxBcMq1EK6k6OkiIR31AK7i0weTqsAQyBDfBsLUjpjtasp4pD5KjBWxEY7r12N+4kV8b0MM7k1iGvciWlyEF9X6T6h9Z34RsGX/yszBj9ldPXBABbxFRTT5rUjFoC4bdDTPz2zyqcq5nZ5ZD1E3bjzf/oQnaczCMMPCWRxmQymn09ykxM37AyRXDoibAUyXk21kS88eqOGjfs5NRiDgSMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NeEvXvgiFb9cKJ0ps5RkrwdrOx4jX3PP5/CeFgbPlk=;
 b=brHMw+HSHCExCw/shg77zFUr8pjKygFpuYkhGe3ulb4YLnvVSnJsXRidd8kScFyAHKGke3vrlXMs83PLLkx24R4l5MSxOwHN0cdtcnah93Cqh0KIob7a24/fM+KvyIBD6obwN71wfgyWDd+Iad/43aGJzFSTdb6gUoRadM6zibTy00h4qGVYaPKsp/8cyqgBFjRPk6qKcmU8XcLgtpB0JY4hBePvwMWtuCbgTOBHItiTPYU1IC5SJF9AHdRtgsAzlMNALnMMGe8DR5f621zUGf2a5k4tNEW6K3+PL8/xX5RoWZxgKl7wfoeeskYM7rKi8irC/IM33W+9GvCmqzEnXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NeEvXvgiFb9cKJ0ps5RkrwdrOx4jX3PP5/CeFgbPlk=;
 b=PHN1+Hi733GZQDrqHqeOpbPDpBQfj9hdt083eEIc/2VQDNsNmaylDvO4ccmrZ2dvK2Jr+ZcLC05DU1sKir6A7V9Mp/UcAF8sgjwoxEhfIYgFbUt3fqmlLCgcDU0jO1nemwm1EQErA6XBgjDxZbi/B1En22eidV74yQ1ODt7yxn4=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Topic: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Thread-Index: AQHaHLke0d1pJZFGt0mE36h4hBLGpbCFOo4AgAACQQCAAFDVAA==
Date: Wed, 22 Nov 2023 01:31:10 +0000
Message-ID: <FEF56E45-6A0E-4B04-A7E1-CC753A9ED7BF@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
 <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
In-Reply-To: <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8382:EE_|AMS1EPF00000044:EE_|AS8PR08MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 853a3e78-f84b-465e-ae45-08dbeafabb31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 X/8QTOnqHgsmv/z30e5hHOONxEGb8oU7HMytieLotHQIh/muW/nrvmVgjL3YMveJop59qF4xeWgAEx8UTcWaKMsbZqtpYsbTA1XQ6ZpqwNRJPhg4S1LmzVMwSHk24d541PfbCM49/EfMBCCmI0YI9daKhehDBQOkopHWvN3VB2vTvKnGUzzUVnf37+jSXKHUXlnmoSMH/iwYDkY4VFufuPhDAL/UoQN4rzkIBVDFEMKqhfr2UAGM3tvEbm+JwnYJShjq6gN3hQ0a29W6NVJpP9YW+SEsqmXR7moFo4YRfbm9L4uip7a1ZqL/IFEd/jAFHMgevbeCrWAWoS0rgYv0J+e1PyfhGDNr3M2NesW9WwSWeHM+prQ+UnwRBN2k6Hy74iGbHuWLenoUKk150aUEFVchRWXeXnA5b/GaYF+/1IwMpeHqpE6u5hFH7lmVRUDI4AUJ7fzl2C2u+e4DyyqScDVD2H5oVrk5V5WtZ9r8eUTO1D+b3v7LPaF1A79SzVu3BROTiwC0ct5xaYWmLQ2zuoRwH35/gYvNEcs+vES6V7drA3akURxH1qtVv6d7vQ2K7SEiZb7PFa38TgosYhiH92Hm3vfvc3twcKem+iCH1qLx8JOsLKKlJykDtS21k8C1amgxJi1yFRyVJBVk98wGUA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38070700009)(36756003)(86362001)(33656002)(6512007)(2616005)(6506007)(4326008)(8936002)(8676002)(83380400001)(53546011)(26005)(5660300002)(7416002)(2906002)(91956017)(110136005)(66946007)(76116006)(6636002)(316002)(54906003)(66446008)(66476007)(66556008)(64756008)(71200400001)(478600001)(6486002)(38100700002)(122000001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0EC494C3754074CB547DF47872ED096@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8382
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c651bb7e-bb11-4194-07c4-08dbeafab520
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sRgZ5kw5Giovr2KNe7nyQMgyA0+DmTGOjR6wwn6Cw565yzVIinLFVckoJTGGY308xVxkBiAaTDETwa81pXIPTJRnACQVgwEk7N8T1B9fhnh43akFt/WWgoZ4fccIYXGAkGL5RFLckoGnvOmb0iT9A9Le1gjatHUyG+qgHsTmhXs0adbzGMMNlU6aMDWqqxFgz764RK9i/YtF1qsrRufhs0j567EgjqFMiKDZ9+MXVyGd1My7EJMPjJXPPH4y2jwQiUwn/iHKQCfErAawIvuV+m2r5A5gs2fT8JnXMhi5EDtIMFlHMimyonCR4OTBZS6S1uH4TL0xnnGtRJ80qPG8lBbaBV6d64xyuur8xQKPgKR3cUHfX2ze1A7DwztqxPVxnIB5Jxrt3cZmAoelN4Vheghwq9CoxEo1eddkv6DrrHKWVlPje/pK8hzEZe5suIWVxPAOb2MSobqBhWbvIBL5TkkGMkXupr1MZLMWSJBMIWh84KG4uFoxKSCritjw8ci4n5WWebD/lZ6v0XmOMNMDibAFbOhPzqaQjyV23rEosk4F8O5cYBquBNO99lE9VDyO1J77V913nnPujBTvq6YpoXyNKoqOmOrEVwur7Py36llct4G999rlp6fL5+NDU9lGOOYb7DPZ3wO9G16CiW1JIpyOF8A7Aiox/2m0RzEDMTVPBRnBq3255NOnDyzt7hAERJ7BhXHbDACtSmCmtV28f5ZLCoLIUv4/RSYhIamicSu2YLOR7WZEq7gcFzBjbsDx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(40460700003)(6486002)(478600001)(4326008)(8676002)(8936002)(54906003)(70206006)(6636002)(70586007)(316002)(110136005)(86362001)(356005)(41300700001)(81166007)(83380400001)(33656002)(40480700001)(36860700001)(47076005)(26005)(82740400003)(336012)(36756003)(2616005)(53546011)(6506007)(6512007)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 01:31:20.5594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853a3e78-f84b-465e-ae45-08dbeafabb31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6278

SGkgQm90aCwNCg0KPiBPbiBOb3YgMjIsIDIwMjMsIGF0IDA0OjQxLCBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDIxLzExLzIwMjMgODoz
MyBwbSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+ICsgQ0MgaGVucnkNCj4+IA0KPj4+IE9uIDIx
IE5vdiAyMDIzLCBhdCAyMDoxNSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gLVd3cml0ZS1zdHJpbmdzIGlzIHVuaGFwcHkgd2l0aCBh
c3NpZ25pbmcgInhlbiIgdG8gYSBtdXRhYmxlIHBvaW50ZXIsIGJ1dCB0aGlzDQo+Pj4gbG9naWMg
bG9va3MgaW5jb3JyZWN0LiAgSXQgd2FzIGluaGVyaXRlZCBmcm9tIHRoZSB4ODYgc2lkZSwgd2hl
cmUgdGhlIGxvZ2ljDQo+Pj4gd2FzIHJlZHVuZGFudCBhbmQgaGFzIG5vdyBiZWVuIHJlbW92ZWQu
DQo+Pj4gDQo+Pj4gSW4gdGhlIEFSTSBjYXNlIGl0IGluc2VydHMgdGhlIGltYWdlIG5hbWUgaW50
byAieGVuLHhlbi1ib290YXJncyIgYW5kIHRoZXJlIGlzDQo+Pj4gbm8gbG9naWMgYXQgYWxsIHRv
IHN0cmlwIHRoaXMgYmVmb3JlIHBhcnNpbmcgaXQgYXMgdGhlIGNvbW1hbmQgbGluZS4NCj4+PiAN
Cj4+PiBUaGUgYWJzZW5jZSBvZiBhbnkgbG9naWMgdG8gc3RyaXAgYW4gaW1hZ2UgbmFtZSBzdWdn
ZXN0cyB0aGF0IGl0IHNob3VsZG4ndA0KPj4+IGV4aXN0IHRoZXJlLCBvciBoYXZpbmcgYSBYZW4g
aW1hZ2UgbmFtZWQgZS5nLiAiaG1wLXVuc2FmZSIgaW4gdGhlIGZpbGVzeXN0ZW0NCj4+PiBpcyBn
b2luZyB0byBsZWFkIHRvIHNvbWUgdW5leHBlY3RlZCBiZWhhdmlvdXIgb24gYm9vdC4NCj4+PiAN
Cj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+Pj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4+
IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4gQ0M6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+Pj4gQ0M6IFZvbG9keW15ciBCYWJjaHVr
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4+PiBDQzogQmVydHJhbmQgTWFycXVpcyA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4+IENDOiBSb2JlcnRvIEJhZ25hcmEgPHJvYmVy
dG8uYmFnbmFyYUBidWdzZW5nLmNvbT4NCj4+PiBDQzogTmljb2xhIFZldHJpbmkgPG5pY29sYS52
ZXRyaW5pQGJ1Z3NlbmcuY29tPg0KPj4+IA0KPj4+IHYyOg0KPj4+ICogTmV3Lg0KPj4+IA0KPj4+
IEknbSBhZnJhaWQgdGhhdCBhbGwgb2YgdGhpcyByZWFzb25pbmcgaXMgYmFzZWQgb24gcmVhZGlu
ZyB0aGUgc291cmNlIGNvZGUuICBJDQo+Pj4gZG9uJ3QgaGF2ZSBhbnkgd2F5IHRvIHRyeSB0aGlz
IG91dCBpbiBhIHJlYWwgQVJNIFVFRkkgZW52aXJvbm1lbnQuDQo+PiBJIHdpbGwgdGVzdCB0aGlz
IG9uZSB0b21vcnJvdyBvbiBhbiBhcm0gYm9hcmQNCj4gDQo+IFRoYW5rcy4gIEkgaGF2ZSBhIHNu
ZWFraW5nIHN1c3BpY2lvbiB0aGF0Og0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9z
ZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gaW5kZXggOWI5MDE4NTc0OTE5Li44YmNh
NWI5YTE1MjMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ICsrKyBiL3hl
bi9hcmNoL2FybS9zZXR1cC5jDQo+IEBAIC00Niw2ICs0NiwxMiBAQA0KPiAgI2luY2x1ZGUgPHhz
bS94c20uaD4NCj4gICNpbmNsdWRlIDxhc20vYWNwaS5oPg0KPiAgDQo+ICtzdGF0aWMgaW50IF9f
aW5pdCBwYXJzZV91Y29kZShjb25zdCBjaGFyICpzKQ0KPiArew0KPiArICAgIHBhbmljKCJYZW4g
aW1hZ2UgbmFtZSBpbnRlcnByZXRlZCBhcyBhIGNtZGxpbmUgcGFyYW1ldGVyXG4iKTsNCj4gK30N
Cj4gK2N1c3RvbV9wYXJhbSgieGVuLmVmaSIsIHBhcnNlX3hlbik7DQo+ICsNCj4gIHN0cnVjdCBi
b290aW5mbyBfX2luaXRkYXRhIGJvb3RpbmZvOw0KPiAgDQo+ICAvKg0KPiANCj4gd2lsbCB0cmln
Z2VyLg0KDQpJIHNhdyBJIGFtIENDZWQgZm9yIHRoaXMgcGF0Y2gsIHNvIEkgdGhpbmsgSSBhbSBu
b3cgZ29pbmcgdG8gdGhyb3cgdGhpcyBzZXJpZXMNCnRvIG91ciBDSSBhbmQgc2VlIGlmIGl0IGV4
cGxvZGVzLiBEbyB5b3Ugd2FudCBtZSB0byBhbHNvIGluY2x1ZGUgYWJvdmUgaHVuaz8NCg0KS2lu
ZCByZWdhcmRzLA0KSGVucnkNCg0KDQo+IA0KPiB+QW5kcmV3DQoNCg==

