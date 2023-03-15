Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F216BAC37
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509997.786863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNTw-0000Pf-RK; Wed, 15 Mar 2023 09:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509997.786863; Wed, 15 Mar 2023 09:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNTw-0000Nj-Nq; Wed, 15 Mar 2023 09:31:40 +0000
Received: by outflank-mailman (input) for mailman id 509997;
 Wed, 15 Mar 2023 09:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pcNTv-0000NN-CU
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:31:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e89d5f4-c314-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 10:31:37 +0100 (CET)
Received: from DB6PR07CA0079.eurprd07.prod.outlook.com (2603:10a6:6:2b::17) by
 AS4PR08MB7686.eurprd08.prod.outlook.com (2603:10a6:20b:505::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Wed, 15 Mar 2023 09:31:27 +0000
Received: from DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::9a) by DB6PR07CA0079.outlook.office365.com
 (2603:10a6:6:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Wed, 15 Mar 2023 09:31:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT055.mail.protection.outlook.com (100.127.142.171) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Wed, 15 Mar 2023 09:31:27 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135");
 Wed, 15 Mar 2023 09:31:26 +0000
Received: from afa638ed6a2b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 20FB736A-40C5-482F-B362-CF38757EC5C8.1; 
 Wed, 15 Mar 2023 09:31:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id afa638ed6a2b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Mar 2023 09:31:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB10342.eurprd08.prod.outlook.com (2603:10a6:10:3fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 09:31:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 09:31:13 +0000
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
X-Inumbo-ID: 2e89d5f4-c314-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLNiiaJGGa7XLtFQIAVfeZLE6ISIuFFdYiDBo07evGc=;
 b=k9P8TQuNwksO48sJbtXWjliKDGz0i9KSvfuCDXkqa1wYalyMTktPxRACdaISL5RV9SfDHM56QvbvJNnLR22dpZLLkkYY0E9eJJ4K/Kvyu4P85l+3UlpFA3VWLL5YnNaBgD5cOQPwydpvD0thXOhDBSQ4BPqcJyaQzixt822AWq4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89a4c7f0ef60554e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWpU+JVG1JT2pLX191lEbP0B763rtEI5F25oyyDGDCX7JQnGfEJIWc+OG+DEdVZtdutuQflZLTxTBeFLo//r8dQZcVi7TuI4pHjdHa+WwLgQjl6eitEtKpQttpNYDVfARXnxDQ9RoYmWyyuoQN49gh85WhJQ8YcWUP+hBKZ2HQyAaE/sH8YnuhCwsr95cLKL5P8BmfZ7QlGnW2Xgk5PCNweUBlUfM5hx0r1+f/CWMPT2IWPk6S9kNoA8KHcPAIwsq2XHYJvoYvqWDgOCsAkTg8W03oUGVMdbu55uFMsqogKNArFSb2wCvFV9X4ykL2KJKJfJUZbLCI5SMBshPV9bSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLNiiaJGGa7XLtFQIAVfeZLE6ISIuFFdYiDBo07evGc=;
 b=AlS4rHP2C+jub16gg1KdcCdM9TyaPhiaH/LPpNZv9fiEdpN2gAbf/pkNASSjhwQtr9iIZVW/93H+gnYV1jXE0XfKGqLeNN6JhYHLRRlVbu259alOdjeOyQ4KCMs1U6yKC9BarzSNppQ0g1A13Jrhd2FtqgOEDOaunXwzdWbbOdpi3NepkDNRIaiC7eAwn4emCPbujVg4RW/YwrdIx8kHXtmSziMdu8s44OCy/wKSoUuWwRUoPUK8zWxFdCLLnBQqHvNhB5ZZT3sIoUvnALL5GwaD23yxXdWuMCWndGFDoZZI1khKb2dwVFJyLuwCiazpOmX3YJTffdqxv6KacWzByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLNiiaJGGa7XLtFQIAVfeZLE6ISIuFFdYiDBo07evGc=;
 b=k9P8TQuNwksO48sJbtXWjliKDGz0i9KSvfuCDXkqa1wYalyMTktPxRACdaISL5RV9SfDHM56QvbvJNnLR22dpZLLkkYY0E9eJJ4K/Kvyu4P85l+3UlpFA3VWLL5YnNaBgD5cOQPwydpvD0thXOhDBSQ4BPqcJyaQzixt822AWq4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Nick Rosbrook <rosbrookn@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 00/10] SVE feature for arm guests
Thread-Topic: [PATCH v2 00/10] SVE feature for arm guests
Thread-Index: AQHZVx16irPEm0reLU+hpmaaPhWzXa77kJkAgAAC5IA=
Date: Wed, 15 Mar 2023 09:31:13 +0000
Message-ID: <F8CBCE6A-68F7-4A1F-85AC-3ED0659ED197@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <4e154f3c-1daf-1979-12f9-2baac097d292@suse.com>
In-Reply-To: <4e154f3c-1daf-1979-12f9-2baac097d292@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB10342:EE_|DBAEUR03FT055:EE_|AS4PR08MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa4ad94-2993-4240-f2df-08db25380d0f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CdKwHvgkrSmJKxgDgkcBNOqNoqEIkszl8ylk4tKKWtfrt0t8j8vaoou5hmNSM1SgxqkF4UqQwyxxMdjY/MtF/+PBfZTqhMSGnYewM+HJ8m6sV1IAfrzMwZnWNaIfVUWmzjW/7hIFIzB9KKU2AXurhUi5IGxtlpKC+EE6yJXs/lDi/y3t0j7gjsxIBD+PFBLhirtSzADeoaXakTeXWBAJAYf/v/XwlRR0h91wOY4nTs+jyQwC5m1TRVR51r9iRL8PmjPTN30D2uFMOxAnl/E/hB86qownWOh0h0Aam26ufj83X9jwN5+TabxyPYAiEJiT0MVXMuMIN7uGoFAlrSn+HVM8FBzstXAA4ZsR7SaYqLvgU2dN3d6Z3YKsPcw/feULoyrDB/IooAUAWRi21N3uF8HIAtZbmybD05hSWAU7qYc+d0N67VnVkaMxPiHtZZ816aYIl44JzdCvosKRzTocgGUrDvzqIxPqrqBv79DyaB/fS0LW/RjIdST6qVa/EG4q3co+LzeXKyp7271sfW2XWpyHr7ek7DfZIyLMqKk5QqymeCs9Au8bQtw5ZfUhjAkhl5F23P0f55TF6R91TOWpB0y0NLZl6AgjctfTa9mBPhmdHV0l3N933rYTxW2rwDbbpEDevFUpz/Efj5y3Hy7LCU9VWLbtIYaf2SZhWywfi6PU+x8Ot36bVr5ugQDM8MVJcOSezHYTlJBbA0JZx8JLlPXGgofGq2nu/3xRFy8jBGM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199018)(122000001)(2906002)(83380400001)(6916009)(5660300002)(36756003)(7416002)(8936002)(64756008)(66446008)(66476007)(41300700001)(66946007)(8676002)(76116006)(91956017)(4326008)(86362001)(38100700002)(33656002)(316002)(54906003)(478600001)(66556008)(38070700005)(186003)(53546011)(2616005)(6512007)(6506007)(26005)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2753A5FB4A97BB4EB55F443C1D77C1AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB10342
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	570914cd-8a94-40dd-1d3c-08db253804f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H4QrgGdR+T90QaiMzt/k1uImtCT8uJ1R987rO0L6wCYSx5Ty39S3zPC7OS87xPGHWsVfiHEIsnwRWi33Gp94nlG4qeNSoudvAcX/RCXpU3FcqBZeB0tcXSBamSZTZqbQGp9Y30/ZnGvug/IxSx3+kGgFPS32bGjqxDbrv4TFpHme1Uc+Rg3gZOlG9KfsKvx+uNFrQ3/qKdiFTs42l0untRp5brdZwPDRxPL9lP2y6uy3VmktfP23Kt4xKdcPEltc1YR/2N2Nu84Svz6Q8d/zIvz21RYyemjAWBb9F2KB7iyPVcJy9iBvbvtu0r7PLPi3iQmcurUM0f5gNPE+XyPtYDHbGltPpqW427bMGCFccfX5Ot/qQEHlDX8ftEF+hMyzSp/CKKZJE/+GUKtz0/aqJkOhpf4R1GJ9eZWf8BkuLfmNUHj8Pqv4b8dRHof0eqoWW6ArL7mySkM0UTpADUvZ64DlPY6GXGUUDFYWKXRTI9ZncdX2zrtGSdyy6bjIJ3ZjcqN1/RT8tLQqb2i3tLwKRGP67AP7i3D/HVag1a3FydYx84UAFcgMCcIDEyjEtzww3A30wGgVb3tyVP3Gg+BcIazQuxOD+ws6VLyn2SZnioZQVg6vpEv8rJE5tuLmzSx7dOUnlZfZuHJjLOi6seL4Kliuxjv2gP9yT4GMeWIhTlALqFB1kp0fMXtRT+QA3jxR4KSi6gGn/8EOO4IKLk5D6A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199018)(40470700004)(36840700001)(46966006)(47076005)(478600001)(26005)(186003)(336012)(83380400001)(6486002)(70206006)(70586007)(316002)(2616005)(6506007)(54906003)(6512007)(53546011)(8676002)(36860700001)(41300700001)(4326008)(8936002)(6862004)(5660300002)(81166007)(40460700003)(82740400003)(2906002)(356005)(82310400005)(36756003)(86362001)(33656002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:31:27.0602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa4ad94-2993-4240-f2df-08db25380d0f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7686

DQoNCj4gT24gMTUgTWFyIDIwMjMsIGF0IDA5OjIwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTUuMDMuMjAyMyAxMDowNSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IFRoaXMgc2VyaWUgaXMgaW50cm9kdWNpbmcgdGhlIHBvc3NpYmlsaXR5IGZvciBE
b20wIGFuZCBEb21VIGd1ZXN0cyB0byB1c2UNCj4+IHN2ZS9zdmUyIGluc3RydWN0aW9ucy4NCj4+
IA0KPj4gU1ZFIGZlYXR1cmUgaW50cm9kdWNlcyBuZXcgaW5zdHJ1Y3Rpb24gYW5kIHJlZ2lzdGVy
cyB0byBpbXByb3ZlIHBlcmZvcm1hbmNlcyBvbg0KPj4gZmxvYXRpbmcgcG9pbnQgb3BlcmF0aW9u
cy4NCj4+IA0KPj4gVGhlIFNWRSBmZWF0dXJlIGlzIGFkdmVydGlzZWQgdXNpbmcgdGhlIElEX0FB
NjRQRlIwX0VMMSByZWdpc3RlciwgU1ZFIGZpZWxkLCBhbmQNCj4+IHdoZW4gYXZhaWxhYmxlIHRo
ZSBJRF9BQTY0WkZSMF9FTDEgcmVnaXN0ZXIgcHJvdmlkZXMgYWRkaXRpb25hbCBpbmZvcm1hdGlv
bg0KPj4gYWJvdXQgdGhlIGltcGxlbWVudGVkIHZlcnNpb24gYW5kIG90aGVyIFNWRSBmZWF0dXJl
Lg0KPj4gDQo+PiBOZXcgcmVnaXN0ZXJzIGFkZGVkIGJ5IHRoZSBTVkUgZmVhdHVyZSBhcmUgWjAt
WjMxLCBQMC1QMTUsIEZGUiwgWkNSX0VMeC4NCj4+IA0KPj4gWjAtWjMxIGFyZSBzY2FsYWJsZSB2
ZWN0b3IgcmVnaXN0ZXIgd2hvc2Ugc2l6ZSBpcyBpbXBsZW1lbnRhdGlvbiBkZWZpbmVkIGFuZA0K
Pj4gZ29lcyBmcm9tIDEyOCBiaXRzIHRvIG1heGltdW0gMjA0OCwgdGhlIHRlcm0gdmVjdG9yIGxl
bmd0aCB3aWxsIGJlIHVzZWQgdG8gcmVmZXINCj4+IHRvIHRoaXMgcXVhbnRpdHkuDQo+PiBQMC1Q
MTUgYXJlIHByZWRpY2F0ZSByZWdpc3RlcnMgYW5kIHRoZSBzaXplIGlzIHRoZSB2ZWN0b3IgbGVu
Z3RoIGRpdmlkZWQgYnkgOCwNCj4+IHNhbWUgc2l6ZSBpcyB0aGUgRkZSIChGaXJzdCBGYXVsdCBS
ZWdpc3RlcikuDQo+PiBaQ1JfRUx4IGlzIGEgcmVnaXN0ZXIgdGhhdCBjYW4gY29udHJvbCBhbmQg
cmVzdHJpY3QgdGhlIG1heGltdW0gdmVjdG9yIGxlbmd0aA0KPj4gdXNlZCBieSB0aGUgPHg+IGV4
Y2VwdGlvbiBsZXZlbCBhbmQgYWxsIHRoZSBsb3dlciBleGNlcHRpb24gbGV2ZWxzLCBzbyBmb3IN
Cj4+IGV4YW1wbGUgRUwzIGNhbiByZXN0cmljdCB0aGUgdmVjdG9yIGxlbmd0aCB1c2FibGUgYnkg
RUwzLDIsMSwwLg0KPj4gDQo+PiBUaGUgcGxhdGZvcm0gaGFzIGEgbWF4aW11bSBpbXBsZW1lbnRl
ZCB2ZWN0b3IgbGVuZ3RoLCBzbyBmb3IgZXZlcnkgdmFsdWUNCj4+IHdyaXR0ZW4gaW4gWkNSIHJl
Z2lzdGVyLCBpZiB0aGlzIHZhbHVlIGlzIGFib3ZlIHRoZSBpbXBsZW1lbnRlZCBsZW5ndGgsIHRo
ZW4gdGhlDQo+PiBsb3dlciB2YWx1ZSB3aWxsIGJlIHVzZWQuIFRoZSBSRFZMIGluc3RydWN0aW9u
IGNhbiBiZSB1c2VkIHRvIGNoZWNrIHdoYXQgdmVjdG9yDQo+PiBsZW5ndGggaXMgdGhlIEhXIHVz
aW5nIGFmdGVyIHNldHRpbmcgWkNSLg0KPj4gDQo+PiBGb3IgYW4gU1ZFIGd1ZXN0LCB0aGUgVjAt
VjMxIHJlZ2lzdGVycyBhcmUgcGFydCBvZiB0aGUgWjAtWjMxLCBzbyB0aGVyZSBpcyBubw0KPj4g
bmVlZCB0byBzYXZlIHRoZW0gc2VwYXJhdGVseSwgc2F2aW5nIFowLVozMSB3aWxsIHNhdmUgaW1w
bGljaXRseSBhbHNvIFYwLVYzMS4NCj4+IA0KPj4gU1ZFIHVzYWdlIGNhbiBiZSB0cmFwcGVkIHVz
aW5nIGEgZmxhZyBpbiBDUFRSX0VMMiwgaGVuY2UgaW4gdGhpcyBzZXJpZSB0aGUNCj4+IHJlZ2lz
dGVyIGlzIGFkZGVkIHRvIHRoZSBkb21haW4gc3RhdGUsIHRvIGJlIGFibGUgdG8gdHJhcCBvbmx5
IHRoZSBndWVzdHMgdGhhdA0KPj4gYXJlIG5vdCBhbGxvd2VkIHRvIHVzZSBTVkUuDQo+PiANCj4+
IFRoaXMgc2VyaWUgaXMgaW50cm9kdWNpbmcgYSBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIHRvIGVu
YWJsZSBEb20wIHRvIHVzZSBTVkUgYW5kDQo+PiB0byBzZXQgaXRzIG1heGltdW0gdmVjdG9yIGxl
bmd0aCB0aGF0IGJ5IGRlZmF1bHQgaXMgMCB3aGljaCBtZWFucyB0aGUgZ3Vlc3QgaXMNCj4+IG5v
dCBhbGxvd2VkIHRvIHVzZSBTVkUuIFZhbHVlcyBmcm9tIDEyOCB0byAyMDQ4IG1lYW4gdGhlIGd1
ZXN0IGNhbiB1c2UgU1ZFIHdpdGgNCj4+IHRoZSBzZWxlY3RlZCB2YWx1ZSB1c2VkIGFzIG1heGlt
dW0gYWxsb3dlZCB2ZWN0b3IgbGVuZ3RoICh3aGljaCBjb3VsZCBiZSBsb3dlcg0KPj4gaWYgdGhl
IGltcGxlbWVudGVkIG9uZSBpcyBsb3dlcikuDQo+PiBGb3IgRG9tVXMsIGFuIFhMIHBhcmFtZXRl
ciB3aXRoIHRoZSBzYW1lIHdheSBvZiB1c2UgaXMgaW50cm9kdWNlZCBhbmQgYSBkb20wbGVzcw0K
Pj4gRFRCIGJpbmRpbmcgaXMgY3JlYXRlZC4NCj4+IA0KPj4gVGhlIGNvbnRleHQgc3dpdGNoIGlz
IHRoZSBtb3N0IGNyaXRpY2FsIHBhcnQgYmVjYXVzZSB0aGVyZSBjYW4gYmUgYmlnIHJlZ2lzdGVy
cw0KPj4gdG8gYmUgc2F2ZWQsIGluIHRoaXMgc2VyaWUgYW4gZWFzeSBhcHByb2FjaCBpcyB1c2Vk
IGFuZCB0aGUgY29udGV4dCBpcw0KPj4gc2F2ZWQvcmVzdG9yZWQgZXZlcnkgdGltZSBmb3IgdGhl
IGd1ZXN0cyB0aGF0IGFyZSBhbGxvd2VkIHRvIHVzZSBTVkUuDQo+PiANCj4+IEx1Y2EgRmFuY2Vs
bHUgKDEwKToNCj4+ICB4ZW4vYXJtOiBlbmFibGUgU1ZFIGV4dGVuc2lvbiBmb3IgWGVuDQo+PiAg
eGVuL2FybTogYWRkIHN2ZV92bF9iaXRzIGZpZWxkIHRvIGRvbWFpbg0KPj4gIHhlbi9hcm06IEV4
cG9zZSBTVkUgZmVhdHVyZSB0byB0aGUgZ3Vlc3QNCj4+ICB4ZW4vYXJtOiBhZGQgU1ZFIGV4Y2Vw
dGlvbiBjbGFzcyBoYW5kbGluZw0KPj4gIGFybS9zdmU6IHNhdmUvcmVzdG9yZSBTVkUgY29udGV4
dCBzd2l0Y2gNCj4+ICB4ZW4vYXJtOiBlbmFibGUgRG9tMCB0byB1c2UgU1ZFIGZlYXR1cmUNCj4+
ICB4ZW4vcGh5c2luZm86IGVuY29kZSBBcm0gU1ZFIHZlY3RvciBsZW5ndGggaW4gYXJjaF9jYXBh
YmlsaXRpZXMNCj4+ICB0b29sczogYWRkIHBoeXNpbmZvIGFyY2hfY2FwYWJpbGl0aWVzIGhhbmRs
aW5nIGZvciBBcm0NCj4+ICB4ZW4vdG9vbHM6IGFkZCBzdmUgcGFyYW1ldGVyIGluIFhMIGNvbmZp
Z3VyYXRpb24NCj4+ICB4ZW4vYXJtOiBhZGQgc3ZlIHByb3BlcnR5IGZvciBkb20wbGVzcyBkb21V
cw0KPj4gDQo+PiBkb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gICAgICAgICAgICAgICAgIHwgIDEx
ICsrDQo+PiBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0ICAgIHwgICA5ICsr
DQo+PiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgICAgICAgIHwgIDEzICsrDQo+
PiB0b29scy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28gICAgIHwgICA0ICsNCj4+IHRv
b2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4uZ28gICAgICAgfCAgIDIgKw0KPj4gdG9vbHMv
aW5jbHVkZS9hcm1fYXJjaF9jYXBhYmlsaXRpZXMuaCAgICB8ICAzMiArKysrDQo+PiB0b29scy9p
bmNsdWRlL2xpYnhsLmggICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCj4+IHRvb2xzL2xpYnMv
bGlnaHQvbGlieGwuYyAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPj4gdG9vbHMvbGlicy9saWdo
dC9saWJ4bF9hcm0uYyAgICAgICAgICAgICB8ICAgMiArDQo+PiB0b29scy9saWJzL2xpZ2h0L2xp
YnhsX3R5cGVzLmlkbCAgICAgICAgIHwgICAyICsNCj4+IHRvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybC5tbCAgICAgICAgICAgfCAgIDQgKy0NCj4+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bC5tbGkgICAgICAgICAgfCAgIDQgKy0NCj4+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9z
dHVicy5jICAgICAgfCAgIDggKy0NCj4+IHRvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMu
YyAgICAgICAgfCAgIDggKy0NCj4+IHRvb2xzL3hsL3hsX2luZm8uYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDggKw0KPj4gdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAyNSArKy0NCj4+IHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKy0NCj4+IHhlbi9hcmNoL2FybS9hcm02NC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAg
IDEgKw0KPj4geGVuL2FyY2gvYXJtL2FybTY0L2NwdWZlYXR1cmUuYyAgICAgICAgICB8ICAgNyAr
LQ0KPj4geGVuL2FyY2gvYXJtL2FybTY0L3N2ZS5jICAgICAgICAgICAgICAgICB8IDExOSArKysr
KysrKysrKysrKw0KPj4geGVuL2FyY2gvYXJtL2FybTY0L3N2ZV9hc20uUyAgICAgICAgICAgICB8
IDE4OSArKysrKysrKysrKysrKysrKysrKysrKw0KPj4geGVuL2FyY2gvYXJtL2FybTY0L3ZmcC5j
ICAgICAgICAgICAgICAgICB8ICA3OSArKysrKystLS0tDQo+PiB4ZW4vYXJjaC9hcm0vYXJtNjQv
dnN5c3JlZy5jICAgICAgICAgICAgIHwgIDM5ICsrKystDQo+PiB4ZW4vYXJjaC9hcm0vY3B1ZmVh
dHVyZS5jICAgICAgICAgICAgICAgIHwgICA2ICstDQo+PiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMg
ICAgICAgICAgICAgICAgICAgIHwgIDQ4ICsrKysrLQ0KPj4geGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jICAgICAgICAgICAgICB8ICAxMSArKw0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2FybTY0L3N2ZS5oICAgICB8ICA3MiArKysrKysrKysNCj4+IHhlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9hcm02NC9zeXNyZWdzLmggfCAgIDQgKw0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L2FybTY0L3ZmcC5oICAgICB8ICAxMCArKw0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Nw
dWZlYXR1cmUuaCAgICB8ICAxNCArKw0KPj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFp
bi5oICAgICAgICB8ICAgOCArDQo+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vcHJvY2Vzc29y
LmggICAgIHwgICAzICsNCj4+IHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICAgICAg
ICAgfCAgIDUgKy0NCj4+IHhlbi9hcmNoL2FybS9zeXNjdGwuYyAgICAgICAgICAgICAgICAgICAg
fCAgMTEgKysNCj4+IHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAgICAgICAgICAgICAgICAgfCAg
NDAgKysrLS0NCj4+IHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oICAgICAgICAgICAgfCAg
IDMgKw0KPj4geGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oICAgICAgICAgICAgICB8ICAgMiAr
LQ0KPj4geGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oICAgICAgICAgICAgICB8ICAgMyArDQo+
PiAzOCBmaWxlcyBjaGFuZ2VkLCA3NDggaW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pDQo+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvaW5jbHVkZS9hcm1fYXJjaF9jYXBhYmlsaXRpZXMu
aA0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9zdmVfYXNtLlMNCj4+IGNyZWF0ZSBt
b2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmgNCj4gDQo+IEkg
dGhpbmsgSSBoYWQgYXNrZWQgZm9yIHRoaXMgYmVmb3JlIC0gY2FuIG5ldyBmaWxlcyBwbGVhc2Ug
dXNlIGRhc2hlcw0KPiBpbiBwcmVmZXJlbmNlIHRvIHVuZGVyc2NvcmVzIGluIHRoZWlyIG5hbWVz
PyBVbmRlcnNjb3JlcyByZWFsbHkgc2hvdWxkDQo+IG9ubHkgYmUgdXNlZCB3aGVuIG90aGVyIHBv
c3NpYmxlIHNlcGFyYXRvcnMgYXJlbid0IGF2YWlsYWJsZSBiZWNhdXNlIG9mDQo+IGhhdmluZyBv
dGhlciBsZXhpY2FsIG1lYW5pbmcuDQoNClllcywgc29ycnkgYWJvdXQgdGhhdCwgSeKAmWxsIHJl
bmFtZSB0aGF0IGZpbGUgdG8gYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmggaW4gdGhlIG5leHQgdmVy
c2lvbg0KDQo+IA0KPiBKYW4NCg0K

