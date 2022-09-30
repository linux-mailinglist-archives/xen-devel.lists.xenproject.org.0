Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3FA5F0283
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 04:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413984.658005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe5N0-0001Vk-1c; Fri, 30 Sep 2022 02:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413984.658005; Fri, 30 Sep 2022 02:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe5Mz-0001TI-V4; Fri, 30 Sep 2022 02:03:17 +0000
Received: by outflank-mailman (input) for mailman id 413984;
 Fri, 30 Sep 2022 02:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QDfz=2B=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oe5My-0001TC-7I
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 02:03:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0af8761f-4064-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 04:03:14 +0200 (CEST)
Received: from DB6PR07CA0009.eurprd07.prod.outlook.com (2603:10a6:6:2d::19) by
 DB9PR08MB9827.eurprd08.prod.outlook.com (2603:10a6:10:460::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Fri, 30 Sep 2022 02:03:12 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::e8) by DB6PR07CA0009.outlook.office365.com
 (2603:10a6:6:2d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Fri, 30 Sep 2022 02:03:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 02:03:11 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Fri, 30 Sep 2022 02:03:11 +0000
Received: from 978746b0b2c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAB31E6B-6D28-4B49-A19A-527454D04EEE.1; 
 Fri, 30 Sep 2022 02:03:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 978746b0b2c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 02:03:05 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS2PR08MB8288.eurprd08.prod.outlook.com (2603:10a6:20b:557::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 02:03:04 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 02:03:04 +0000
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
X-Inumbo-ID: 0af8761f-4064-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KGTYM85lprnTuWLTQqCEVCC5nHoZbK/w6pAyA2O8AG/xKo3I2qryJA6purGSAiG/4eyJp6+kIlCpggAgRPrFZk4IlIAiEn+Z+ALgw/nfqECadZgjt1e+brRw3p662q6bKVoyVyfpVA0K9w+H3lpFZ5es5iTPstHTsM5Q8g9O9VVRQInAv4CbYEzWNGwlnwgcOu44mccrUvm/CVwLC4wDiweaqZlx5XrRrg4eKRNplmSvbGba6PyyEB30WoDvybD3LfmUkAWyBJug8VZNn11fSj4Txp4tRwXg/UBzs/wIjZieVIuOg0BPzCYK0snuCx37HeKeUdUr7CuimpMG/e4NLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUIrSkDojgIsAMGB4NZOMta2ZWq8pre8E8cSdPjMHLU=;
 b=j+4Oiml/TLIygP+R1W8n6ZHVmrLfT8dYStpLNzogzM8PJIlZ0zHguQ9i9BTMXRuQ8aaVHtbrhgMSRpGi+KYHS3WsGO4P+IUgn30H0rBSQGg5C5rr+V7iEJCL081PJi55TJ3/QT6XhJIVbMXY7glxckHce7vYXi2/hRJjsIasqtOR0mHxSbiVN2pWvi0Dr3Ohz/g7xFfZuzitemVBFBXlI7C5hMKReW7nMG3nxo5NAiuH1St4/6sPwQ9LDq42D6Vw7Qm5oNjmRg2f1f3LjYdHnYRMq+6XcotThEdd0qr6nVyo3emsb/tpI1bUvPKbwfNWR0KUfIYdYyTPkegKDTtiPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUIrSkDojgIsAMGB4NZOMta2ZWq8pre8E8cSdPjMHLU=;
 b=HdBwm7mZZApWfHdPzGbbNTPlaKpiz25Zb7+srhvcK5Kfnk7xE+t4lrj+FpRXkORcdXDA8oxHqduAjmMYqwMsrzVQZHi42LAF7CJFEKJVlAVcC9jr6iXsfEXFNTXzJvXGDx+Vx+l4nqdGWHIZg6M0in1iVwLH451hfrnBPA7GHb4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LthxgXcQbw5QHZvE10jFllByKjwJfQXh9/lCU4Md7F95pB+BnpjlT7Fka94BRYlIBpe5FSDLb3Ran8inr1VBM/PDyzVWwhXFCq/BgN/ViXpTJtHwmabTc4pgbCW9Y8a4fHOcOMAUHOwk2qXjxJ6YiD1YSDcvQmoQOlK+ZfJVVn4amXWfRJNNjei7QVW53f/bFBIY4x4aFRXosPuvNV2mvd5S/EIU0xeuXWoCcy5eewgZYajr0BN4SpSwUt7TnWXks7c8bXkiQOMvSmC+KLx1NnDkbRGTCvNv9yPjsjwBxd+JDom8jBGBYdiZwSbUgBmBZLiR7W4hAor4RBP1m90Adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUIrSkDojgIsAMGB4NZOMta2ZWq8pre8E8cSdPjMHLU=;
 b=VfBBte5k7PCoy5ZIsIqGa22gWvPG3XL0P7+tO2TUoCuJDEHbX4D9o8On3+t1PpSyidpLsgpQkgQPpHPS7Kuy6J6jm0tXCz6EdQA6Rk53o3TivkAnsdrPw9qm0/iusBJmFkzm2DYsDL4PtOBKuZo+z11q+rDeB7QU5PpS0Q+L9+Jp7LKeK+DseAhp8WNnH3BU1JzIOGPDRhn3+8SIV1sj8AOv7+8PelIr+qL1I/0W+4/AV0RD1+P13DYXLr9ArNYbmiicZmqsyvAKr3vdTfkz2tD6uP1W7YGkoNEzUWzBQJVTSPQBPPl0p6PLBGJtzDjZhqDVm1kEB+QJ8fOwev4KmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUIrSkDojgIsAMGB4NZOMta2ZWq8pre8E8cSdPjMHLU=;
 b=HdBwm7mZZApWfHdPzGbbNTPlaKpiz25Zb7+srhvcK5Kfnk7xE+t4lrj+FpRXkORcdXDA8oxHqduAjmMYqwMsrzVQZHi42LAF7CJFEKJVlAVcC9jr6iXsfEXFNTXzJvXGDx+Vx+l4nqdGWHIZg6M0in1iVwLH451hfrnBPA7GHb4=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: [PATCH] x86/NUMA: correct off-by-1 in node map size calculation
Thread-Topic: [PATCH] x86/NUMA: correct off-by-1 in node map size calculation
Thread-Index: AQHY0nuHFsNZDqjVQEGO++a4qSB4Ua33PGOQ
Date: Fri, 30 Sep 2022 02:03:04 +0000
Message-ID:
 <PAXPR08MB742012E676799B43D60563ED9E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <adb17b3a-f57d-0a34-73e5-6f32ec60ab5e@suse.com>
In-Reply-To: <adb17b3a-f57d-0a34-73e5-6f32ec60ab5e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 555C03A4ACB96E448546ECF8F2E899FA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS2PR08MB8288:EE_|DBAEUR03FT046:EE_|DB9PR08MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 1455d7fa-dc43-4250-2025-08daa287ed9f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1iLzZtggbvxfNA3n+wkGBfAa+jasieGn4k/EgniVcsyP3YA2ipGb6mjS1bt6UEsh1RzIuSX0O7gTY3AQz7vjpi9tc6ca9lZDhfJLvi3J1evPPJEQnmGYYWkWWlKI1OagWBwUia9YkYzdSv0cZdKYA40IK4rnYPjvriJwepuSJTz+Q/8flh4r2pAIkFNjdB4nfC7xYrR3dwxVrOF51boEGO51LVg2CS2aznn1NYI9R3WY7KqxKK5BfvHL/X56amsTEmx3YU3ncNPjA0mVuWxQ1gL6hH/LgnYwGjZlzDi7WMaOnQ7J7RtOW7paPqJQRCNOutGBXJDhv8lwUegoGSteUkTpGTQYhqcGZ1kS3JzQcyvD7TFlLrpSH26oZyGgAZHjI7oVx9lJ/DC0bU76ohvmolG2C5RDMfFgsb81blamVyjDdFMQXz5/0cFC0DTjcAVQmTn3iz0E7DGTc6qjPoSrdJp9m9J6Hyx4lNUPnETDBKv2HBBHDs2TFPsReJ801v8A4WmB0g6DnJlpfXA6i1DuOZlIBG2GcDeaT5oK/Py5walCglLAoYtPtoXV4z9eBmZV15piKz5uGe0O2EXt3kAAGdeV3/YkYWjoCsk9986H4AHJpcc4zW75XIh7eqH3V6rSg2lj5PBNUzO+XVnbbYvYnUtPQHTqz6AgnEcbiDTNwntFJzp10hjC+TmQVYR2WPtaxsCkRxVDhcjglyV1OhsyoMzuVLy03SNepYWjv5MLb2DhkIvflsyzYiq0BSfb/oSwuxWsY6QvrvzMpXvhJgHXlg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199015)(8936002)(5660300002)(52536014)(316002)(6506007)(76116006)(66946007)(54906003)(53546011)(86362001)(66556008)(7696005)(4326008)(64756008)(41300700001)(8676002)(110136005)(66446008)(66476007)(83380400001)(55016003)(71200400001)(38070700005)(38100700002)(122000001)(33656002)(478600001)(186003)(2906002)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8288
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e10c119b-04e9-4ef6-e0b4-08daa287e94e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+9BdM/KzjJRqOQDXD27u3Gsy5nb969EzNls5GwZjVPNHAKXFnen1roWKENL2DJ/SKWwbHrqoeab18M9nopd2DkSDw5miNRwlxSMGT9SLpvgDQE8+93/KOtodbLNLVETjCgPLaML4ErMgYY5vjJGEr29vyxGxdzxfaXtZMQsymireXF9ty/REquyzBW49ggFxFY91HIXqGhsQOzh7WjSwp/xXPzUzXXkeyYv8rxS4ioFotqmOqnRg9Ae3vrSM21UWSLvcI8n6RIeMzGxur5NSFC1k8MLIeeXUuoittCDNpad9Z2WV65gl8GOcz8s7dU90HBxVjeVXGfz+CiwvTv4m0KTeQtf2NfRaKtblVdQG/P4jmyY/Og3bEG6GeEr1RiO5MZuwg7V88zCkrufhhg54p0c8vsuSN4/x9YI4iHnF1BLfFqLZGNNKISbPfLm3QVFKzgbgSuiEKeckVYrDQOOZLZk+TKMB7Mm/nX0UjxyUTYhurqHKsYcvbwGDHK0qFVaS31rTARxydrn3TwvKa0r1ogze23N+Hmb+t3jHcCj6XotPT16X7qYVBsLSskqegDwBHMAlr1NfT0/yHKhzJk3fQTu2c7WNk+CkY2yeu7udQVFFRMhNLxXRxb2VGAd4Lpod25rBYtaUYbs2ztzy4tBobN+FbL5Q0n08oxBV9Yop7k96C1rI8iSc6djm545vcwb0Jc1oQSXbYJj9sPG8TQaK3jvLmsQImweseWPrkVRXoFMxTSqEjAr1tunDZtM/990CtjTQMRHc9WGoEVzu4TMaBg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(54906003)(86362001)(36860700001)(110136005)(5660300002)(52536014)(33656002)(8936002)(356005)(83380400001)(7696005)(26005)(53546011)(40480700001)(2906002)(70206006)(70586007)(55016003)(82740400003)(6506007)(107886003)(41300700001)(316002)(478600001)(336012)(81166007)(82310400005)(47076005)(9686003)(8676002)(186003)(40460700003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 02:03:11.7103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1455d7fa-dc43-4250-2025-08daa287ed9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9827

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1kZXZl
bCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBK
YW4NCj4gQmV1bGljaA0KPiBTZW50OiAyMDIy5bm0OeaciDI35pelIDIyOjE0DQo+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXINCj4gUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0geDg2L05VTUE6
IGNvcnJlY3Qgb2ZmLWJ5LTEgaW4gbm9kZSBtYXAgc2l6ZSBjYWxjdWxhdGlvbg0KPiANCj4gZXh0
cmFjdF9sc2JfZnJvbV9ub2RlcygpIGFjY3VtdWxhdGVzICJtZW10b3AiIGZyb20gYWxsIFBEWGVz
IG9uZSBwYXN0DQo+IHRoZSBjb3ZlcmVkIHJhbmdlcy4gSGVuY2UgdGhlIG1heGltdW0gYWRkcmVz
cyB3aGljaCBjYW4gdmFsaWRseSBieSB1c2VkDQo+IHRvIGluZGV4IHRoZSBub2RlIG1hcCBpcyBv
bmUgYmVsb3cgdGhpcyB2YWx1ZSwgYW5kIHdlIG1heSBjdXJyZW50bHkgc2V0DQo+IHVwIGEgbm9k
ZSBtYXAgd2l0aCBhbiB1bnVzZWQgKGFuZCBuZXZlciBpbml0aWFsaXplZCkgdHJhaWxpbmcgZW50
cnkuIEluDQo+IGJvdW5kYXJ5IGNhc2VzIHRoaXMgbWF5IGFsc28gbWVhbiB3ZSBkeW5hbWljYWxs
eSBhbGxvY2F0ZSBhIHBhZ2Ugd2hlbg0KPiB0aGUgc3RhdGljICg2NC1lbnRyeSkgbWFwIHdvdWxk
IHN1ZmZpY2UuDQo+IA0KPiBXaGlsZSB0aGVyZSBhbHNvIGNvcnJlY3QgdGhlIGNvbW1lbnQgYWhl
YWQgb2YgdGhlIGZ1bmN0aW9uLCBmb3IgaXQgdG8NCj4gbWF0Y2ggdGhlIGFjdHVhbCBjb2RlOiBM
aW51eCBjb21taXQgNTQ0MTM5MjdmMDIyICgieDg2LTY0Og0KPiB4ODZfNjQtbWFrZS10aGUtbnVt
YS1oYXNoLWZ1bmN0aW9uLW5vZGVtYXAtYWxsb2NhdGlvbiBmaXggZml4IikgcmVtb3ZlZA0KPiB0
aGUgT1JpbmcgaW4gb2YgdGhlIGVuZCBhZGRyZXNzIGJlZm9yZSB3ZSBhY3R1YWxseSBjbG9uZWQg
dGhlaXIgY29kZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gLS0tDQo+IFJlYWxseSB0aGUgc2hpZnQgdmFsdWUgbWF5IGVuZCB1cCBuZWVk
bGVzc2x5IHNtYWxsIHdoZW4gdGhlcmUncw0KPiBkaXNjb250aWd1b3VzIG1lbW9yeS4gV2l0aGlu
IGEgZ2FwLCBhbnkgYWRkcmVzcyBjYW4gYmUgdGFrZW4gZm9yIHRoZQ0KPiBub2RlIGJvdW5kYXJ5
LCBhbmQgaGVuY2UgbmVpdGhlciB0aGUgZW5kIG9mIHRoZSBsb3dlciByYW5nZSBub3IgdGhlDQo+
IHN0YXJ0IG9mIHRoZSBoaWdoZXIgcmFuZ2UgbmVjZXNzYXJpbHkgaXMgdGhlIGJlc3QgYWRkcmVz
cyB0byB1c2UuIEZvcg0KPiBleGFtcGxlIHdpdGggdGhlc2UgdHdvIG5vZGUgcmFuZ2VzIChudW1i
ZXJzIGFyZSBmcmFtZSBhZGRyZXNzZXMpDQo+IA0KPiBbMTAwMDAsMTdmZmZdDQo+IFsyODAwMCwy
ZmZmZl0NCj4gDQo+IHdlJ2QgY2FsY3VsYXRlIHRoZSBzaGlmdCBhcyAxNSB3aGVuIDE2IG9yIGV2
ZW4gMTcgKGJlY2F1c2UgdGhlIHN0YXJ0IG9mDQo+IHRoZSAxc3QgcmFuZ2UgY2FuIGFsc28gYmUg
aWdub3JlZCkgd291bGQgZG8uIEkgaGF2ZW4ndCB0cmllZCB0byBwcm9wZXJseQ0KPiBwcm92ZSBp
dCB5ZXQsIGJ1dCBpdCBsb29rcyB0byBtZSBhcyBpZiB0aGUgdG9wIGJpdCBvZiB0aGUgWE9SIG9m
IGxvd2VyDQo+IHJhbmdlIChpbmNsdXNpdmUpIGVuZCBhbmQgaGlnaGVyIHJhbmdlIHN0YXJ0IHdv
dWxkIGJlIHdoYXQgd291bGQgd2FudA0KPiBhY2N1bXVsYXRpbmcgKG9mIGNvdXJzZSByZXF1aXJp
bmcgdGhlIGVudHJpZXMgdG8gYmUgc29ydGVkLCBvciB0byBiZQ0KPiBwcm9jZXNzZWQgaW4gYWRk
cmVzcyBvcmRlcikuIFRoaXMgd291bGQgdGhlbiAibmF0dXJhbGx5IiBleGNsdWRlIGxvd2VzdA0K
PiByYW5nZSBzdGFydCBhbmQgaGlnaGVzdCByYW5nZSBlbmQuDQo+IA0KPiAtLS0gYS94ZW4vYXJj
aC94ODYvbnVtYS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9udW1hLmMNCj4gQEAgLTExMCw3ICsx
MTAsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhbGxvY2F0ZV9jYWNoZWFsaWduZWRfDQo+ICB9DQo+
IA0KPiAgLyoNCj4gLSAqIFRoZSBMU0Igb2YgYWxsIHN0YXJ0IGFuZCBlbmQgYWRkcmVzc2VzIGlu
IHRoZSBub2RlIG1hcCBpcyB0aGUgdmFsdWUgb2YNCj4gdGhlDQo+ICsgKiBUaGUgTFNCIG9mIGFs
bCBzdGFydCBhZGRyZXNzZXMgaW4gdGhlIG5vZGUgbWFwIGlzIHRoZSB2YWx1ZSBvZiB0aGUNCj4g
ICAqIG1heGltdW0gcG9zc2libGUgc2hpZnQuDQo+ICAgKi8NCj4gIHN0YXRpYyBpbnQgX19pbml0
IGV4dHJhY3RfbHNiX2Zyb21fbm9kZXMoY29uc3Qgc3RydWN0IG5vZGUgKm5vZGVzLA0KPiBAQCAt
MTM1LDcgKzEzNSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGV4dHJhY3RfbHNiX2Zyb21fbm9kZXMN
Cj4gICAgICAgICAgaSA9IEJJVFNfUEVSX0xPTkcgLSAxOw0KPiAgICAgIGVsc2UNCj4gICAgICAg
ICAgaSA9IGZpbmRfZmlyc3RfYml0KCZiaXRmaWVsZCwgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKjgp
Ow0KPiAtICAgIG1lbW5vZGVtYXBzaXplID0gKG1lbXRvcCA+PiBpKSArIDE7DQo+ICsgICAgbWVt
bm9kZW1hcHNpemUgPSAoKG1lbXRvcCAtIDEpID4+IGkpICsgMTsNCj4gICAgICByZXR1cm4gaTsN
Cj4gIH0NCj4gDQoNClRoYW5rcyBmb3IgdGhpcyBmaXguDQoNClJldmlld2VkLWJ5OiBXZWkgQ2hl
biA8V2VpLkNoZW5AYXJtLmNvbT4NCg0K

