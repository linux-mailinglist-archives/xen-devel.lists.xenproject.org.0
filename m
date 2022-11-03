Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4261749D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 03:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436094.690153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqQOQ-0003a3-Ro; Thu, 03 Nov 2022 02:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436094.690153; Thu, 03 Nov 2022 02:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqQOQ-0003X1-Oj; Thu, 03 Nov 2022 02:55:46 +0000
Received: by outflank-mailman (input) for mailman id 436094;
 Thu, 03 Nov 2022 02:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfRY=3D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oqQOP-0003Wv-Et
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 02:55:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00fa87d4-5b23-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 03:55:42 +0100 (CET)
Received: from AM7PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:20b:130::20)
 by AS8PR08MB6664.eurprd08.prod.outlook.com (2603:10a6:20b:351::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 02:55:39 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::b7) by AM7PR03CA0010.outlook.office365.com
 (2603:10a6:20b:130::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 02:55:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 02:55:39 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Thu, 03 Nov 2022 02:55:38 +0000
Received: from 3c41889b9e21.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9524A1CE-82D2-4948-8BDB-1AC55EC908CA.1; 
 Thu, 03 Nov 2022 02:55:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c41889b9e21.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Nov 2022 02:55:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM9PR08MB5940.eurprd08.prod.outlook.com (2603:10a6:20b:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 02:55:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Thu, 3 Nov 2022
 02:55:31 +0000
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
X-Inumbo-ID: 00fa87d4-5b23-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=liz0AGNoPnZwhlLsyzqWLuhYQmSJJO5rL5rpHaATjeu+BlUM8mx0x1ZVcSFkaMdGMcmcGyJpfUBQ5qIfOtVod6Cv7DydzuXFuKYxXBON+DWL4Q9CYhLrLd4ymWCGvxseWbgBcv1bug9WIALBeLH3NZl7tkH1j0+oZO/BzXbMkB7l9CEXDqs+bij5TepGDEtlz26r4XRoTyZAuH2uqJoLA+J3XcqMeh02c8DEox8IPuPRv7OF/E2RExLbPjVW7NsbEBN+eIq5VAJqm/oEYA9i3yx6mNi2wnFoxGKJnEse7VwzmMAwUhJ0Yy8qxNTHZ1vXyVGZlRYR4Z9emT4NpGhlYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIT9LprgSRFBcCa9TxDmUx44WO9AYHASbD+ip3glvVI=;
 b=bnWKU2Ds7vPCaxwMWHIG8SK76UZvczL1MYE9iznWiXB2/Px8whLD3fZBmT1QZQ8nbMvWIUosU+dUhB3+QC0uDMv7QWE2xol9GBpZyeYKcaeunieoqtgUxIc2djfTHBZprENeZbGLCa14b3vVESNKFKEajyqY2DlEniZcFZAjsji/Bt5pUYOu/+OFSDbEBz8u2M55+0lZcjqpEoNB1qMl/SoKF+bIz7AYOpCFuroKpEDSk3zhHTCPHTu5jDMK3P8chXkLCr4+2/z+vMos2mI/0dabJK8OpGq5eXIUsFVmgRGqad9kZuz3vezKR07N9c254Slln6liVK3Novn4NAb55Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIT9LprgSRFBcCa9TxDmUx44WO9AYHASbD+ip3glvVI=;
 b=e1dsSzWATnUiF4CMHY5BPxROz//v2xYQGTi9d4Q4HeAKRIlK7+LvlSTYaqknHqwBlKtreVJERnQoQtmOOXT7kHGunynoLRivyFzVXXsApzYjealnjIbnyKZeFnLaN2KjCnfq+ZRIlpyG1A3nWRR3FK/UmS72M73ooxb+j5sJWwQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmpaIl3YaRJ2P9obeoClZn9j7hiUSK+xgJB5huoT3A3Lz4O4V4NCH8hmYVmuxpZ5hOJY2DdR7hZpedjjfasO3S7bPajb+NgOQtCs5jAB2KzDOvaV9dRcPq9OmM/bDSQWBGEWw35WeDt7W+8mqptL5Em93so1h+u5LrHxfUNcfw+WuF0R9YtZ15jUh0YtvPCzVFz9AFKZsV9VG8sZZlOb5PyGAkXl6lYtI18Mb/eOk2rv69JApZFAXoKbRGpvfZgDlKfNE094nP5OVUENlHAuHeAp7PTl/JN5kELEwIbYQ/QWq91ujTPitBYkc/Ugt9T1ibEQU0oH5wdfVzs04N2owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIT9LprgSRFBcCa9TxDmUx44WO9AYHASbD+ip3glvVI=;
 b=KURiaMxVsmWCgG3sQSLXETESlAPISGGPF8VzhfMWuT0XtlrlpyqL2Yn5G24aUICwWAu4bGalDxF1mFRlQrXMubKzn/sFjFOWTGc39G5D5rXF1pb/MfmXiDuo8Pu4qRlpq/BsswV1h+FBx09+PzLnTsjw7FhsOaEe1JDGCa2CUhkGdgzFGYP78K8+NpNtblE7aj7r9u5ApxaN43eKL/+B3SIkS/r/iQkpGAcD0onwaRr4YGU/DOCapZN//i/GTp/CFAw+lgYIC4CTVBK8xubk/Oaz+ZP8mwn/1hC9xz/VcrBR8PxzYvjIsdUPq8D8S2AUco75oQR5PMv/N3Wy0CyabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIT9LprgSRFBcCa9TxDmUx44WO9AYHASbD+ip3glvVI=;
 b=e1dsSzWATnUiF4CMHY5BPxROz//v2xYQGTi9d4Q4HeAKRIlK7+LvlSTYaqknHqwBlKtreVJERnQoQtmOOXT7kHGunynoLRivyFzVXXsApzYjealnjIbnyKZeFnLaN2KjCnfq+ZRIlpyG1A3nWRR3FK/UmS72M73ooxb+j5sJWwQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Thread-Topic: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory
 API
Thread-Index: AQHY1AgeJwq4WhKefkGyVS1JhkdRo64QKSwAgAG7SUCAAH/pgIAZrF0AgAClVGA=
Date: Thu, 3 Nov 2022 02:55:31 +0000
Message-ID:
 <AS8PR08MB7991EAAF194842E14F28F62092389@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
 <Y0s5Xvr5PBQq5pVB@mail-itl>
 <AS8PR08MB7991A2F3DE5A5B55ED3D09F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2214fd86-0cfa-58ef-39db-6f913a9de75e@suse.com>
 <2ee2c1f9-a6bf-7641-16fa-ce2ea90f377b@suse.com>
In-Reply-To: <2ee2c1f9-a6bf-7641-16fa-ce2ea90f377b@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9948C8FCC6AFF74591E9D832BBF4FFAC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM9PR08MB5940:EE_|AM7EUR03FT028:EE_|AS8PR08MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f8ad0b-0461-4d2d-1810-08dabd46e3b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OjVaNiGP3/EEoCsKxXWvxNA70/CM4njNBVL6FvGYt5zFIg+U6tmSuxUrYI8HO3klhA+AHgjbGG5kQJotWUkOCumaFT7xEs9Kr0swatAujrN+zaoWAdnm/8eYPT28X5q7ipzNSxpR+xzsf5DnvAZgsGf/gVw6+Jsp0RLA3uH+/PD8z5N9T39PcEYKrCo/ch5jHasfdtqN9Z4XIVIfBev3IFIQXbZI4SfTU1eEtCq/P3mVEwlprg6kw3HtL15QuVP6XY3+ZkVS1ciiiJY12n/PevCtqTdBbmon5ROOclZ79xfgIYPKFxBIuxyfUg48W+YebVnIGMzL3y43Eth+eMVrH6Q0jpwd9mFfZtdKSAjYdmNFEpQFkjK19yWy8833ojRAgZ/h2+xN6hioCCFaSoU58js0nlBVVfl7p4WwIl48L48SbCW8HkitlPHYozdA/t+tgo1jU9YdMw9yBJfcrlux2paTf5fMVBVd8BEJvWvq7RXamcfaXY3VuFb5gz3LGqhjzj3BmqceDZCxykGe6i5v/RqFcmyaIeiFPkw1MewoOFaDSCdl1C7Ot7C/s41ENy5Abjwm6NmPLbSbKGIy6j6atrdnyXyhTZg6IkRVlXz40s9bh6FJnyM4gMdlFHRLV9Ocaf+mgrQjy0NM1xCGnno+7S+GXD/QY12fm2akT594f9w6yqO4UcbgHPnsbsJNVvsBFBA9FHCGcuUIqc+2cjQZeHps05eb77xXAOh2Q/pTiItlAlT2hOxNpJKAxXtUUEoBq0P+Z41tO/PqUNYiJY1Vhw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199015)(38070700005)(2906002)(55016003)(186003)(33656002)(5660300002)(54906003)(83380400001)(6916009)(316002)(52536014)(8936002)(66574015)(71200400001)(86362001)(26005)(7696005)(6506007)(9686003)(66946007)(478600001)(38100700002)(8676002)(41300700001)(4326008)(76116006)(66446008)(122000001)(64756008)(66476007)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5940
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e997d4f0-3e85-4799-9122-08dabd46df5e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M6zXdjBvYeZDtTwple3BFX2X0hp7VVw2+xksTv2c6JXs3BAdrB9pJVscGY5RY6Y8BuGP5zXhiiPUe8Vyoen+1syamNWqV6TgWn70Lv99sQX1M5f9SNTswJ2/keR/T7n6qXz2hUfsEQenL5c5AjpBTEzis4Gl825zbbZUM8iiIdwg+6FLx1UVtCahY2vBxB25kgiuzN8sWdkTu1I7tOvKHb0yy/fqigfKfd7NKlJEvSkxV2alG1b0DlRLO9uldCfxmEBSrVGlUDFEIfsP+b49Kvy3ro9qmP9xyUm2ARqUitPXDsGMk6TAUZwOF8TXyYmomROyFgLHc18o16gEcp1K+0hyE7xJ/kjdDAs75LFI+sjN0iBSAqdQBn6hE7w8uTAcXG5xxXVVwJi6pGuFNqbQCJOdaPgovmjIbW4ajoO+0WBY0p1vfsuA3lrkRuzE1vd0V/diPzKA2iHRx1OCWvuhbXdP3PPCnx9K+NjupmYygC7BpaZdenuKZroIEVra0qHeuStc1Ym4IV7geiK7oNeGuBvRHsMereMtHgA88hYUNSXbX8/wvE+Q6tTlDWJnxRoUzt46K8H7qNgxDCQsti1KY54vTOHavcMN3G8sozCH5uBPm6HuoSLmyjVeCHsQ59RCsNWdGJdxxj5aHnqkH+UnJ1DmKPfCp8cGcoUPM1MLCg8gbJCr7rg6qRMIpI3r1VCr9fgPuqpbX2X5y/OIpdLjVsy0P3BAnsbd/X53PmJnrnnfyrTNHfd5HJrlntycuKn2dpprG4ufdwLybLix25wvfg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(41300700001)(33656002)(8676002)(4326008)(70206006)(70586007)(2906002)(316002)(5660300002)(82740400003)(36860700001)(8936002)(52536014)(6506007)(7696005)(356005)(9686003)(26005)(6862004)(336012)(83380400001)(40460700003)(186003)(478600001)(55016003)(40480700001)(81166007)(54906003)(86362001)(47076005)(82310400005)(66574015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 02:55:39.1206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f8ad0b-0461-4d2d-1810-08dabd46e3b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6664

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAxLzJdIElP
TU1VL1ZULWQ6IHdpcmUgY29tbW9uIGRldmljZSByZXNlcnZlZA0KPiBtZW1vcnkgQVBJDQo+IA0K
PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQ0KPiA+Pj4g
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+ID4+Pj4gUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPg0KPiA+Pj4NCj4gPj4+IEhlbnJ5LCBjYW4g
dGhpcyBiZSBpbmNsdWRlZCBpbiA0LjE3PyBUaGUgQU1EIGNvdW50ZXJwYXJ0IHdlbnQgaW4NCj4g
Pj4+IGVhcmxpZXIsIGJ1dCBkdWUgdG8gbGF0ZSByZXZpZXcgb24gSW50ZWwgcGFydCwgdGhpcyBv
bmUgZGlkbid0Lg0KPiA+Pg0KPiA+PiBUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4gSSBhZ3Jl
ZSB0aGlzIGlzIGEgdmFsaWQgcmVhc29uLCBidXQgdG8gYmUNCj4gPj4gc2FmZSBJIHdvdWxkIGxp
a2UgdG8gaGVhciBvcGluaW9ucyBmcm9tIHRoZSB4ODYgbWFpbnRhaW5lcnMgKGFkZGVkDQo+ID4+
IGluIENDKS4NCj4gPj4NCj4gPj4gQW5kcmV3L0phbi9Sb2dlcjogTWF5IEkgaGF2ZSB5b3VyIGZl
ZWRiYWNrIGFib3V0IHRoaXM/IFRoYW5rcyENCj4gPg0KPiA+IEhtbSwgbm90IHN1cmUgd2hhdCB0
byBzYXkgaGVyZS4gWWVzLCBpdCB3b3VsZCBiZSBuaWNlIGZvciB0aGluZ3MgdG8gZW5kDQo+ID4g
dXAgY29uc2lzdGVudCBhY3Jvc3MgdmVuZG9ycy4gQW5kIHllcywgdGhlIGNoYW5nZSBoZXJlIGlz
IGxhcmdlbHkNCj4gPiBtZWNoYW5pY2FsIChhZmFpY3MpIGFuZCB0byBjb2RlIG1vc3Qgb2Ygd2hp
Y2ggc2hvdWxkbid0IHR5cGljYWxseSBiZSBpbg0KPiA+IHVzZSBvbiBzeXN0ZW1zIGFueXdheSwg
YW5kIHNvIHNob3VsZCBub3QgcG9zZSBhbiB1bmR1ZSByaXNrLiBCdXQgc3RpbGwNCj4gPiBpdCBp
cyBxdWl0ZSBhIGJpdCBvZiBjb2RlIGNodXJuIC4uLg0KPiANCj4gV2FzIHRoaXMgbG9zdCwgZGlk
IHlvdSBkZWNpZGUgYWdhaW5zdCBhbGxvd2luZyB0aGlzIGluLCBvciB3ZXJlIHlvdSBob3BpbmcN
Cj4gZm9yIGZ1cnRoZXIgcmVzcG9uc2VzIGJ5IG90aGVycz8NCg0KU29ycnkgZm9yIHRoZSBjb25m
dXNpb24uIFllYWggSSB3YXMgaG9waW5nIHRvIHNlZSBpZiB3ZSBjYW4gaGF2ZSBmdXJ0aGVyDQpy
ZXNwb25zZXMgZnJvbSBvdGhlcnMsIGJ1dCBpdCBzZWVtcyBubyByZXNwb25zZXMgc28gZmFyLi4u
DQoNCkkgaGF2ZSB0aGUgZXhhY3Qgc2FtZSBvcGluaW9uIGFzIHlvdXJzIHNvIEkgYW0gYWxzbyBu
b3Qgc3VyZS4gQnV0IGlmIHlvdQ0KY2hhbmdlZCB5b3VyIG1pbmQgYW5kIHdvdWxkIGxpa2UgdG8g
Y29tbWl0IHRoZSBwYXRjaCBmb3IgY29tcGxldGVuZXNzDQpvZiB0aGUgb3JpZ2luYWwgc2VyaWVz
LCBwbGVhc2UgZmVlbCBmcmVlIHRvIGFkZCBteSByZWxlYXNlLWFjay4gSSB3b3VsZCBub3QNCmJs
b2NrIHRoaXMgcGF0Y2guDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IEphbg0K

