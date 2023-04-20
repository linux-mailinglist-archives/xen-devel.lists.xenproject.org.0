Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250CC6E95A1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 15:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524281.815100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppUBV-0004vj-5R; Thu, 20 Apr 2023 13:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524281.815100; Thu, 20 Apr 2023 13:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppUBV-0004tA-2a; Thu, 20 Apr 2023 13:18:49 +0000
Received: by outflank-mailman (input) for mailman id 524281;
 Thu, 20 Apr 2023 13:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VJI=AL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ppUBT-0004t2-Ec
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 13:18:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0d85e33-df7d-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 15:18:45 +0200 (CEST)
Received: from AS9PR0301CA0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::19) by DU0PR08MB9726.eurprd08.prod.outlook.com
 (2603:10a6:10:446::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 13:18:30 +0000
Received: from AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::99) by AS9PR0301CA0028.outlook.office365.com
 (2603:10a6:20b:468::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.50 via Frontend
 Transport; Thu, 20 Apr 2023 13:18:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT012.mail.protection.outlook.com (100.127.141.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.24 via Frontend Transport; Thu, 20 Apr 2023 13:18:29 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Thu, 20 Apr 2023 13:18:29 +0000
Received: from 737b45c5fc05.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3EABE22-45E1-4B2D-AE34-DD0A1128C1D7.1; 
 Thu, 20 Apr 2023 13:18:22 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 737b45c5fc05.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Apr 2023 13:18:22 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6421.eurprd08.prod.outlook.com (2603:10a6:20b:31c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 13:18:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 13:18:15 +0000
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
X-Inumbo-ID: e0d85e33-df7d-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgrPcMEDLrjOdJcGYE7PZJ+BF+DJE0ViV1nrw9r52W0=;
 b=1qlzX/wYdcSl3AIlhNN2gxxpBpkaslDAfoML8MwJ1mVodTAaeEa6nCQHxPUyW9MTbdz3NgzFFiApIqTgRQg9fZuWOhnOxopSlpiMdi7v7YxpnbHPQ0MW7/IDiwpL8T1pt7yhV+7UAn/L8cFSAIriiJ9A7D4HlEu+akkjIO9hIH8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e4e3eae62fb9eee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OlaXA+Jo+oFW9A6dWzgbI3fG8lQpuix7MoQ8Zz+nyM7+aiEzpZWsqCxMa6nb5g+rIqo4SXFdjFbHNBw/0sJ+WReKoRPXsW5qKKSHlPeqbeqyB+2N5hflhSLuSPvUKzNMZVKdHnPCD4+Hzqo5qltI9FL9esIz+u9Mqfo7a05zIXBzrW6rC6FsD1XANLX4za8zkA4NQvUzCsQGrdhmj2MmZq0dJOPrMwFAkHK+JZ6nOWLFbuOIsT4WwSUHO9o2Oq5YeFSjQcMtyrc9FB5Mzh0JqqN+lolLL24WIg9msZ2IvTkzeOJnkAFSVyDEaSEFdvHPyyvMw31je59rSeZ3Recdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgrPcMEDLrjOdJcGYE7PZJ+BF+DJE0ViV1nrw9r52W0=;
 b=iHzer0ULXP45MS3CKs4P9MuB7AkQF/Ha1UpqEhK9dCaE8BvMbym7IWuTfRxZTJkgI5IHvVhjOJq2VtGBWbyKioTvVPgncBcABBSUX2os9PKzThwNUdRBPBSXbQjoK/Yy+fuYsATyQs14V+H/QEXtDYoSNlSG+2MAYImWLjQzmHastAHxXD5iW/x3RZSfVpT4oSUKSgdRuIcZ7gkB1MYap//9PfEoNlk/L6W5W21kTsQNcvTyMIbKjXaD4jfYfgcicop+6gMCQZgkVYdJP1lubvvbO+3bFZOddgYmXt037OOm1llGPCAOKOxF20aKwxlNyqO/GF8wBrrVTy5zY64aug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgrPcMEDLrjOdJcGYE7PZJ+BF+DJE0ViV1nrw9r52W0=;
 b=1qlzX/wYdcSl3AIlhNN2gxxpBpkaslDAfoML8MwJ1mVodTAaeEa6nCQHxPUyW9MTbdz3NgzFFiApIqTgRQg9fZuWOhnOxopSlpiMdi7v7YxpnbHPQ0MW7/IDiwpL8T1pt7yhV+7UAn/L8cFSAIriiJ9A7D4HlEu+akkjIO9hIH8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZbSQ+XccnxtxNG0WbEgpX88e2za8xDZ2AgAE1hQCAAAGYAIAABb6AgAGkXICAAD5kgIAAA+SAgAAHCICAAAKogA==
Date: Thu, 20 Apr 2023 13:18:15 +0000
Message-ID: <D0E8B461-DDE7-49DB-AD34-5F1632DCA614@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
 <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
 <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
 <8DA3FECA-DEBD-479E-9E5A-57676B98ADA4@arm.com>
 <DE00F3DB-C6D9-4D90-97A8-FD964FD03099@arm.com>
 <bb6b5288-f123-8d25-3cc3-ef36164ea04c@xen.org>
 <BE516382-0E45-4D6E-8012-1D75C1F13680@arm.com>
 <00fc2213-d315-f4e8-d4bc-bc78028dd9b2@xen.org>
In-Reply-To: <00fc2213-d315-f4e8-d4bc-bc78028dd9b2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6421:EE_|AM7EUR03FT012:EE_|DU0PR08MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d5ca27-99fc-42b8-6c18-08db41a1bbd1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4V9zbajyj6i1ZsFTZa9EK15gZA9IjeaxvuiPSwzuN2f1wN1hfcaYhRqZAdVv8bB8HjRm9YMUwz/b1JaTgWdqGnH27fXUKgPBIXQ4Armfmn7inP7UpT4Yhf2JkD5be8o7D8VOPHCTs3w+B3FCCO0IGg3oQGKWXvdqkwwVJ7fTmZemSxExbd4r/YcRMiiYBPnOvdSlSs2lzyjBkD2dgwiHITBb6KpoBi1E3Lw1M9tG9PbF7Eo8aXQ/K+m3pWRzhh/LpUt0bqc81p3Tr0kzGOcyELIr4sGGxir8H3hiVOw5MNJSnDQqCQI8FXDdBrBPlZf4Be4LQBYE/BsuD/mKrYBeKp7tvvUCZDjqw7FHjMSrdB5mm+YSxVz+PY5TEZFY5fus3UVdOZ9sdnJWOvmYcPtTIz8nRL20XBgx/LQpPJVUGlCS05ZlxT6Vm6WTEyDZsUar5EgYxOiCMxZQXJzH4hSy/luYjLLwLwim58Ry5ghAwzhm+RNzgaRhQZAOtfLcGjcZwW65JFp+5cFMmn7LFpmI/DwsulxZgvIy8DCAq14fxsJ98yeHGuYuZP7K4wk4ZyihgZn3xf8gJeJC+hGfB7dbMO0ZmvHEtAsN1wcHnKt4Pev8GQrqR9N7GByR0At3AVO4nQHu+61mFyVPLfZW9Jme4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(38070700005)(2906002)(8936002)(38100700002)(8676002)(5660300002)(36756003)(33656002)(86362001)(6506007)(6486002)(71200400001)(26005)(6512007)(54906003)(478600001)(2616005)(83380400001)(53546011)(186003)(316002)(4326008)(66556008)(6916009)(66446008)(64756008)(91956017)(76116006)(66476007)(66946007)(122000001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2C1A13C304962469CBD459A37FDBEE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6421
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c43fdde4-f41d-4670-0daa-08db41a1b33a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K9D3k+rWyZ6/llcxogHIjnh882mYNQC5dMooFMu60GsmJjdty3UgiNoLrt1wV7GBsRQKW7724A48NZKiThIkal9eEOrnCDvUma5r9YZmPPMd9mCwhFoM5b5AK1TaBdx3SVpRm/o+apsrXWzf5JtRkHj/+FJaThT1p9v1wrJdACLOOYvUaXcJ7svaB3LaAWxVd35LEtJCmvH9UtUXqDIcWypJRg0kO2sbVgw9OOPXE3SMJqDjBzgX0KAQfUr/mgvfDRHzFWTP/2H7fdsvwUKa3pwiXJRv6vk06g6ZtUj00B78AOMYUG5WyOPoVOc+uuegWhqkFrXLpvpqBit3gmfCZp2TJn1ZEZc5vOhDVq383FiAj93PsjEVqzXz2K5I+K01zbVhaqbJcXgJYGt9oRt3v4F20Cyp5/ZoTUTjCHwvMrztX4iurm9k/A/RSE+m03KFPSHZPbLsgZ74AdP6JG6n1h6OXuyAODIx0GrQTy6M3gnru1VtLPuCyt21fJaJcLVtr98jMbBB2t3Xuarx7WEtJUUueVCn/I5TLXC1y0bK93irxJ9lLw23C7NxlTB/H6S97KBNypZs6EQD3LIl9EB3M59lTkpip9ZCcd/qAfY6CnPKxG3w6lDPnYVfaYkxYaVpFu/v8poDUswSuUoBVegMq2zUbdmiG//zgIGvMiQmoA5Uty3zsJaC3kdyPFuzoTYQaPNkoR/71cDed8rye9qe6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(8936002)(40460700003)(6862004)(8676002)(5660300002)(82310400005)(36756003)(33656002)(86362001)(6506007)(40480700001)(6486002)(107886003)(26005)(6512007)(54906003)(478600001)(2616005)(36860700001)(83380400001)(47076005)(336012)(53546011)(186003)(316002)(82740400003)(4326008)(70206006)(70586007)(356005)(41300700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 13:18:29.9036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d5ca27-99fc-42b8-6c18-08db41a1bbd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9726

DQoNCj4gT24gMjAgQXByIDIwMjMsIGF0IDE0OjA4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMC8wNC8yMDIzIDEzOjQzLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDIwIEFwciAyMDIzLCBhdCAxMzoyOSwgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgTHVjYSwNCj4+PiAN
Cj4+PiBPbiAyMC8wNC8yMDIzIDA5OjQ2LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4+Pj4+
ICtpbnQgX19pbml0IHN2ZV9zYW5pdGl6ZV92bF9wYXJhbShpbnQgdmFsLCB1bnNpZ25lZCBpbnQg
Km91dCkNCj4+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4+ICsgICAgLyoNCj4+Pj4+Pj4+PiArICAgICAq
IE5lZ2F0aXZlIFNWRSBwYXJhbWV0ZXIgdmFsdWUgbWVhbnMgdG8gdXNlIHRoZSBtYXhpbXVtIHN1
cHBvcnRlZA0KPj4+Pj4+Pj4+ICsgICAgICogdmVjdG9yIGxlbmd0aCwgb3RoZXJ3aXNlIGlmIGEg
cG9zaXRpdmUgdmFsdWUgaXMgcHJvdmlkZWQsIGNoZWNrIGlmIHRoZQ0KPj4+Pj4+Pj4+ICsgICAg
ICogdmVjdG9yIGxlbmd0aCBpcyBhIG11bHRpcGxlIG9mIDEyOCBhbmQgbm90IGJpZ2dlciB0aGFu
IHRoZSBtYXhpbXVtIHZhbHVlDQo+Pj4+Pj4+Pj4gKyAgICAgKiAyMDQ4DQo+Pj4+Pj4+Pj4gKyAg
ICAgKi8NCj4+Pj4+Pj4+PiArICAgIGlmICggdmFsIDwgMCApDQo+Pj4+Pj4+Pj4gKyAgICAgICAg
Km91dCA9IGdldF9zeXNfdmxfbGVuKCk7DQo+Pj4+Pj4+Pj4gKyAgICBlbHNlIGlmICggKCh2YWwg
JSBTVkVfVkxfTVVMVElQTEVfVkFMKSA9PSAwKSAmJiAodmFsIDw9IFNWRV9WTF9NQVhfQklUUykg
KQ0KPj4+Pj4+Pj4+ICsgICAgICAgICpvdXQgPSB2YWw7DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFNo
b3VsZG4ndCB5b3UgYWxzbyBjaGVjayBpZiBpdCBpcyBub3QgZ3JlYXRlciB0aGFuIHRoZSBtYXhp
bXVtIHZlY3RvciBsZW5ndGggPw0KPj4+Pj4+PiANCj4+Pj4+Pj4gSSBkb27igJl0IHVuZGVyc3Rh
bmQsIEkgYW0gY2hlY2tpbmcgdGhhdCB0aGUgdmFsdWUgaXMgYmVsb3cgb3IgZXF1YWwgdG8gU1ZF
X1ZMX01BWF9CSVRTLA0KPj4+Pj4+PiBJZiB5b3UgbWVhbiBpZiBpdCBzaG91bGQgYmUgY2hlY2tl
ZCBhbHNvIGFnYWluc3QgdGhlIG1heGltdW0gc3VwcG9ydGVkIGxlbmd0aCBieSB0aGUgcGxhdGZv
cm0sDQo+Pj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IHBsYWNlLCB0aGUgY2hl
Y2sgaXMgYWxyZWFkeSBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoKSwgaW50cm9kdWNl
ZA0KPj4+Pj4+PiBpbiBwYXRjaCAjMg0KPj4+Pj4+IA0KPj4+Pj4+IElmIHRoaXMgaXMgbm90IHRo
ZSByaWdodCBwbGFjZSB0byBjaGVjayBpdCB0aGVuIHdoeSBjaGVja2luZyB0aGUgcmVzdCBoZXJl
ID8NCj4+Pj4+PiANCj4+Pj4+PiBGcm9tIGEgdXNlciBvciBhIGRldmVsb3BlciBwb2ludCBvZiB2
aWV3IEkgd291bGQgZXhwZWN0IHRoZSB2YWxpZGl0eSBvZiB0aGUgaW5wdXQgdG8gYmUgY2hlY2tl
ZCBvbmx5DQo+Pj4+Pj4gaW4gb25lIHBsYWNlLg0KPj4+Pj4+IElmIGhlcmUgaXMgbm90IHRoZSBw
bGFjZSBmb3IgdGhhdCBpdCBpcyBvayBidXQgdGhlbiBpIHdvdWxkIGNoZWNrIGV2ZXJ5dGhpbmcg
aW4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnDQo+Pj4+Pj4gKG11bHRpcGxlLCBtaW4gYW5k
IHN1cHBvcnRlZCkgaW5zdGVhZCBvZiBkb2luZyBpdCBwYXJ0bHkgaW4gMiBwbGFjZXMuDQo+Pj4+
PiANCj4+Pj4+IE9rLCBnaXZlbiB0aGUgd2F5IHdlIGVuY29kZWQgdGhlIHZhbHVlIGluIHhlbl9k
b21jdGxfY3JlYXRlZG9tYWluIHN0cnVjdHVyZSwgd2UgaGF2ZSB0aGF0IHRoZSB2YWx1ZSB0YWtl
cw0KPj4+Pj4gdmVyeSBsaXR0bGUgc3BhY2UsIGJ1dCBhIHNtYWxsIGlzc3VlIGlzIHRoYXQgd2hl
biB3ZSBlbmNvZGUgaXQsIHdlIGFyZSBkaXZpZGluZyBpdCBieSAxMjgsIHdoaWNoIGlzIGZpbmUg
Zm9yIHVzZXIgcGFyYW1zDQo+Pj4+PiB0aGF0IGFyZSBtdWx0aXBsZSBvZiAxMjgsIGJ1dCBpdOKA
mXMgbGVzcyBmaW5lIGlmIHRoZSB1c2VyIHBhc3NlcyDigJwxMjnigJ0uDQo+Pj4+PiANCj4+Pj4+
IFRvIG92ZXJjb21lIHRoaXMgaXNzdWUgd2UgYXJlIGNoZWNraW5nIHRoZSB2YWx1ZSB3aGVuIGl0
IGlzIG5vdCBhbHJlYWR5IGVuY29kZWQuIE5vdywgdGhpbmtpbmcgYWJvdXQgaXQsIHRoZSBjaGVj
aw0KPj4+Pj4gIiYmICh2YWwgPD0gU1ZFX1ZMX01BWF9CSVRTKeKAnSBpcyBub3QgcmVhbGx5IG5l
ZWRlZCwgYmVjYXVzZSBldmVuIGlmIHRoZSB2YWx1ZSBpcyBhYm92ZSwgdGhlbiBpbiBhcmNoX3Nh
bml0aXNlX2RvbWFpbl9jb25maWcNCj4+Pj4+IHdlIHdpbGwgaGl0IHRoZSB0b3AgbGltaXQgb2Yg
dGhlIHBsYXRmb3JtIG1heGltdW0gVkwuDQo+Pj4+PiANCj4+Pj4+IGludCBhcmNoX3Nhbml0aXNl
X2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+
Pj4+PiB7DQo+Pj4+PiAgICB1bnNpZ25lZCBpbnQgbWF4X3ZjcHVzOw0KPj4+Pj4gICAgdW5zaWdu
ZWQgaW50IGZsYWdzX3JlcXVpcmVkID0gKFhFTl9ET01DVExfQ0RGX2h2bSB8IFhFTl9ET01DVExf
Q0RGX2hhcCk7DQo+Pj4+PiAgICB1bnNpZ25lZCBpbnQgZmxhZ3Nfb3B0aW9uYWwgPSAoWEVOX0RP
TUNUTF9DREZfaW9tbXUgfCBYRU5fRE9NQ1RMX0NERl92cG11KTsNCj4+Pj4+ICAgIHVuc2lnbmVk
IGludCBzdmVfdmxfYml0cyA9IHN2ZV9kZWNvZGVfdmwoY29uZmlnLT5hcmNoLnN2ZV92bCk7DQo+
Pj4+PiANCj4+Pj4+ICAgIGlmICggKGNvbmZpZy0+ZmxhZ3MgJiB+ZmxhZ3Nfb3B0aW9uYWwpICE9
IGZsYWdzX3JlcXVpcmVkICkNCj4+Pj4+ICAgIHsNCj4+Pj4+ICAgICAgICBkcHJpbnRrKFhFTkxP
R19JTkZPLCAiVW5zdXBwb3J0ZWQgY29uZmlndXJhdGlvbiAlI3hcbiIsDQo+Pj4+PiAgICAgICAg
ICAgICAgICBjb25maWctPmZsYWdzKTsNCj4+Pj4+ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+
Pj4+ICAgIH0NCj4+Pj4+IA0KPj4+Pj4gICAgLyogQ2hlY2sgZmVhdHVyZSBmbGFncyAqLw0KPj4+
Pj4gICAgaWYgKCBzdmVfdmxfYml0cyA+IDAgKQ0KPj4+Pj4gICAgew0KPj4+Pj4gICAgICAgIHVu
c2lnbmVkIGludCB6Y3JfbWF4X2JpdHMgPSBnZXRfc3lzX3ZsX2xlbigpOw0KPj4+Pj4gDQo+Pj4+
PiAgICAgICAgaWYgKCAhemNyX21heF9iaXRzICkNCj4+Pj4+ICAgICAgICB7DQo+Pj4+PiAgICAg
ICAgICAgIGRwcmludGsoWEVOTE9HX0lORk8sICJTVkUgaXMgdW5zdXBwb3J0ZWQgb24gdGhpcyBt
YWNoaW5lLlxuIik7DQo+Pj4+PiAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+Pj4gICAg
ICAgIH0NCj4+Pj4+IA0KPj4+Pj4gICAgICAgIGlmICggc3ZlX3ZsX2JpdHMgPiB6Y3JfbWF4X2Jp
dHMgKQ0KPj4+Pj4gICAgICAgIHsNCj4+Pj4+ICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5G
TywNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAiUmVxdWVzdGVkIFNWRSB2ZWN0b3IgbGVuZ3Ro
ICgldSkgPiBzdXBwb3J0ZWQgbGVuZ3RoICgldSlcbiIsDQo+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgc3ZlX3ZsX2JpdHMsIHpjcl9tYXhfYml0cyk7DQo+Pj4+PiAgICAgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPj4+Pj4gICAgICAgIH0NCj4+Pj4+ICAgIH0NCj4+Pj4+ICAgWy4uLl0NCj4+Pj4+
IA0KPj4+Pj4gTm93LCBJIHVuZGVyc3RhbmQgeW91ciBwb2ludCwgd2UgY291bGQgY2hlY2sgZXZl
cnl0aGluZyBpbiBzdmVfc2FuaXRpemVfdmxfcGFyYW0oKSwgYnV0IGl0IHdvdWxkIGxlYXZlIGEg
cHJvYmxlbQ0KPj4+Pj4gZm9yIGRvbWFpbnMgY3JlYXRlZCBieSBoeXBlcmNhbGxzIGlmIEkgYW0g
bm90IHdyb25nLg0KPj4+Pj4gDQo+Pj4+PiBXaGF0IGRvIHlvdSB0aGluaz8NCj4+Pj4gSSB0aG91
Z2h0IGFib3V0IHRoYXQgYW5kIGFub3RoZXIgcG9zc2liaWxpdHkgaXMgdG8gc3RvcmUg4oCcc3Zl
X3Zs4oCdIGFzIHVpbnQxNl90IGluc2lkZSBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnLCBh
bmQNCj4+Pj4gY2hlY2sgaXQgaW5zaWRlIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZygpIGZv
ciBpdCB0byBiZSBtb2QgMTI4IGFuZCBsZXNzIHRoYW4gdGhlIG1heCBzdXBwb3J0ZWQgVkwsIHRo
aXMgd2lsbA0KPj4+PiBhbGxvdyB0byBoYXZlIGFsbCB0aGUgY2hlY2tzIGluIG9uZSBwbGFjZSwg
dGFraW5nIGEgYml0IG1vcmUgc3BhY2UsIGFueXdheSB3ZSB3b3VsZCB0YWtlIHRoZSBzcGFjZSBm
cm9tIHRoZSBpbXBsaWNpdA0KPj4+PiBwYWRkaW5nIGFzIHRoaXMgaXMgdGhlIGN1cnJlbnQgc3Rh
dHVzOg0KPj4gSGkgSnVsaWVuLA0KPj4+IA0KPj4+IFNvcnJ5LCBJIGFtIGhhdmluZyB0cm91Ymxl
IHRvIGZvbGxvdyB0aGUgZGlzY3Vzc2lvbi4gSWYgeW91IGFyZSBjaGVja2luZyB0aGUgdmFsdWUg
aW4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKCksIHRoZW4gd2h5IGRvIHlvdSBuZWVkIHRv
IHRha2UgbW9yZSBzcGFjZSBpbiBhcmNoX2RvbWFpbj8NCj4+IFllcyBJIGFtIGNoZWNraW5nIHRo
ZSB2YWx1ZSBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcsIHRoZSB2YWx1ZSBjaGVja2Vk
IGlzIGZyb20gYXJjaF9kb21haW4gYW5kIGl0IGlzIHRoZSB2ZWN0b3IgbGVuZ3RoIGRpdmlkZWQg
YnkgMTI4LCBzbyBhbiBlbmNvZGVkIHZhbHVlLg0KPiANCj4gSSB0aGluayB0aGlzIGlzIHdoZXJl
IHRoZSBkaXNjb25uZWN0IGlzIGNvbWluZyBmcm9tLiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25m
aWcoKSBkb2Vzbid0IHVzZSBzdHJ1Y3QgYXJjaF9kb21haW4gYmVjYXVzZSB0aGUgZG9tYWluIGl0
c2VsZiBpcyBub3QgeWV0IGFsbG9jYXRlZC4gSW5zdGVhZCwgaXQgaXMgdXNpbmcgeGVuX2FyY2hf
ZG9tYWluY29uZmlnLg0KPiANCj4gSSBjYXJlIGxlc3MgYWJvdXQgdGhlIGluY3JlYXNlIG9mIHhl
bl9hcmNoX2RvbWFpbmNvbmZpZyBiZWNhdXNlIHRoaXMgaXMgYSBvbmUgb2ZmIHN0cnVjdHVyZS4N
Cg0KSeKAmW0gc29ycnksIHllcywgSSBtZWFudCBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21h
aW4sIHNvcnJ5IEkgZ290IGNvbmZ1c2VkIGNvcHlpbmcgZnJvbSB0aGlzIHRocmVhZA0KDQo+IA0K
Pj4gQmVydHJhbmQgd2FzIHB1enpsZWQgYnkgdGhlIGZhY3QgdGhhdCBJIGFsc28gcHV0IGEgY2hl
Y2sgaW4gc3ZlX3Nhbml0aXplX3ZsX3BhcmFtIHRvIHNlZSBpZiB0aGUgdmVjdG9yIGxlbmd0aCBw
YXNzZWQgYnkgdGhlIHVzZXIgaXMgbW9kIDEyOCwgaGlzIHBvaW50IGlzIHRoYXQgd2Ugc2hvdWxk
IGNoZWNrIGEgdmFsdWUgb25seSBpbiBvbmUgcGxhY2UgYW5kIG5vdCBpbiB0d28sIGFuZCBpdCBp
cyBhIHZhbGlkIHBvaW50IGJ1dCBpbiB0aGlzIGNhc2Ugd2UgY2Fu4oCZdCBwdXQgYWxsIHRoZSBj
aGVjayBpbnRvIGFyY2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZyBiZWNhdXNlIHdlIGRvbuKAmXQg
aGF2ZSB0aGUg4oCcZnVsbOKAnSB2YWx1ZSBmcm9tIGFyY2hfZG9tYWluLCBhbmQgd2UgY2Fu4oCZ
dCBwdXQgYWxsIHRoZSBjaGVja3MgaW4gc3ZlX3Nhbml0aXplX3ZsX3BhcmFtIGJlY2F1c2UgaXQg
d2lsbCBsZWF2ZSBvdXQgZnJvbSB0aGUgY2hlY2sgZG9tYWlucyBjcmVhdGVkIGJ5IGh5cGVyIGNh
bGxzLg0KPj4gU28gdG8gaGF2ZSBvbmx5IG9uZSBwb2ludCB3aGVyZSB0aGUgY2hlY2tzIGFyZSBk
b25lIChtb2QgMTI4IGFuZCA8PSBIVyBzdXBwb3J0ZWQgVkwpLCB3ZSBtaWdodCBuZWVkIHRvIGhh
dmUgYSBmdWxsIHJlc29sdXRpb24gVkwgdmFsdWUgaW4gc3RydWN0IHhlbl9hcmNoX2RvbWFpbmNv
bmZpZyAoMTYgYml0KS4NCj4+IEJ1dCBpZiB3ZSB3YW50IHRvIHNhdmUgc3BhY2UgZm9yIHRoZSBm
dXR1cmUsIHdlIGNvdWxkIGxlYXZlIHRoZSBjb2RlIGFzIGl0IGlzIGFuZCByZWx5IG9uIHRoZSBm
YWN0IHRoYXQgdGhlIHRvb2xzIChvciBYZW4pIHdoZW4gY3JlYXRpbmcgdGhlIGRvbWFpbiBjb25m
aWd1cmF0aW9uLCB3aWxsIGNoZWNrIHRoYXQgdGhlIFNWRSBWTCBwYXJhbWV0ZXIgaXMgbW9kIDEy
OC4NCj4+IEluIHRoaXMgbGFzdCBjYXNlIHdoYXQgaXMgaW4gc3RydWN0IHhlbl9hcmNoX2RvbWFp
bmNvbmZpZyBpcyBpbXBsaWNpdGx5IG1vZCAxMjggYW5kIG9ubHkgdGhlIHVwcGVyIGJvdW5kYXJ5
IG9mIHRoZSBtYXggc3VwcG9ydGVkIFZMIHdpbGwgYmUgY2hlY2tlZCBieSBYZW4gaW5zaWRlIGFy
Y2hfc2FuaXRpc2VfZG9tYWluX2NvbmZpZy4NCj4gDQo+IEJlZm9yZSBhbnN3ZXJpbmcgdG8gdGhl
IGFwcHJvYWNoLCBjYW4geW91IGV4cGxhaW4gd2h5IHlvdSBhc2sgdGhlIHVzZXIgdG8gcGFzcyBh
IHZhbHVlIHRoYXQgaXMgYSBtdWx0aXBsZSBvZiAxMjggcmF0aGVyIHRoYW4gdGhlIGFscmVhZHkg
ImRpdmlkZWQiIHZhbHVlPyBJcyBpdCBtb3JlIG5hdHVyYWwgZm9yIHRoZSB1c2VyPw0KDQpZZXMg
SSB0aG91Z2h0IGlzIHdhcyBtb3JlIG5hdHVyYWwgZm9yIHRoZSB1c2VyIHRvIHRoaW5rIGFib3V0
IG51bWJlciBvZiBiaXRzIChmb3IgZXhhbXBsZSA1MTIpIGluc3RlYWQgb2YgYW4gZW5jb2RlZCB2
YWx1ZSAoNCBpbiB0aGlzIGNhc2UpLg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVs
aWVuIEdyYWxsDQoNCg0K

