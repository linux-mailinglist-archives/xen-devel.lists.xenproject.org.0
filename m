Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE496257B1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 11:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442406.696543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otR10-0006U2-9X; Fri, 11 Nov 2022 10:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442406.696543; Fri, 11 Nov 2022 10:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otR10-0006Rm-4y; Fri, 11 Nov 2022 10:12:02 +0000
Received: by outflank-mailman (input) for mailman id 442406;
 Fri, 11 Nov 2022 10:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoG2=3L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1otR0y-0006Rg-Gr
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 10:12:00 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 471c8ea0-61a9-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 11:11:59 +0100 (CET)
Received: from DB9PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:10:1da::13)
 by DB4PR08MB8173.eurprd08.prod.outlook.com (2603:10a6:10:383::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Fri, 11 Nov
 2022 10:11:49 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::3) by DB9PR05CA0008.outlook.office365.com
 (2603:10a6:10:1da::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Fri, 11 Nov 2022 10:11:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 10:11:48 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Fri, 11 Nov 2022 10:11:48 +0000
Received: from 6638fae2ef66.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BD403B0-A39F-47FA-8146-B9C8E88953A4.1; 
 Fri, 11 Nov 2022 10:11:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6638fae2ef66.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 10:11:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB8386.eurprd08.prod.outlook.com (2603:10a6:10:3d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 10:11:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Fri, 11 Nov 2022
 10:11:40 +0000
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
X-Inumbo-ID: 471c8ea0-61a9-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Bh0mxMs/bOoF/UIaI/o4EwQDoNUpRcVG6JBdahEsrlqr3wTshpT6l4duFS3DckZgi0wDOZStmtdZLjijAQW3zRdTVHgYECn5TwAKxYZhl5VQr0rvsw3KuLR6135w6ltHJbSKb4lKpHsohrpenQD6+0euvgLpaxBtsZX0VWSbbODGO4lT6wkYCeY7Y0tDK3+0mL0G774b8Psf1AI6jfpH3FyPfkcUG/pBw16DyMfIbAQWSeeYxL95s7gRCinPjeWysjZo6Gw+LtxuDa/71tk73V84ne+0SztlicwPcYjCJXPoCwdiZBcEbydSDHPdHM0QtJ2c2cW8S/Ia6f/UZDWjhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htO6k5tkRGlYJygU8RCCLu2Lydw8uEvKCH62asuzYpM=;
 b=b85f4QFdov3mXXimbAUUgmUFbraE24/68hfISONHL5KNkLK760CDZgZtAF6nTKNGpZ0uot/fuir6MwCzX7Y+S4CTgoyNnppRbbKeUTUT0qPAvpKhWiF8FXcn8tt3ZPvcUoNEt9zQnT+PV/NE13Uzo9YCqHsG/RiXryzyUCAUb98gLhep1pzrcDuvIKHmARis9uXoUrqV4UbvI/PgtpnvoeysYDX9yK1NyvThdKL81gDIyHoqW9wpWvyVCtd7Tbq+pMtKk9oHRvGPsqkNBqSHuynrJb1YfUt6uwUviGknspQe0wuz7SHHw+zWFTZ01VO/T4xCW/vgp7OcVCqYcX3jmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htO6k5tkRGlYJygU8RCCLu2Lydw8uEvKCH62asuzYpM=;
 b=writGn/oLJWj++88QuLRzn4cquokHAqmtC2hXAYFcs3lLFFLSHD335hqPtZB9Ikls9t3paHR0v9bCLdc7Nnr08KDZHKMW2rHoDho7Tx3b0l12aBYu0uKiSTvkuKcDKqJlGuXPVIYUAZdBo8TK1X3QJWggN2KLNs0eW80dWAv2eo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrkeOGYzDFJ82QcMrQ2e+KqyBs62/ysE8jSQUx643nSduTW0SIC0tvdFHbWkeh4fwYr0lajnIOFA7dxFtLzwflDuMDW4u5OtWWCvR196gST8Y4RlztwCM+Z18625Yr2kjW4Okq/4TS46f0dfQY1PvOtEz15ZlKsHE9uu0eKjKawsu7mlq1H9PgFCym9hJ4hQn8SX97jUIu6RBsqyByQQ79hIo5ANl/P6tMCq1nLV0O9LOek4SjHw+ttwIUROO2Rcjyi9fAszlVxSPmJAyzPUMa4Nr/aoFMJMLs23Lw9EOSoS5z6w9O/zuI38OSosVrkVKFKPgdXDyus92bLdnC3fWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htO6k5tkRGlYJygU8RCCLu2Lydw8uEvKCH62asuzYpM=;
 b=iuPUEQSNFOp795LXvR37BB2ZgrvZLMcKMTFQxNrdH2Vzuyg/11JUsnZTD1Ymd/APrSxK+m5GUBAUIlDymVDI/JVYm08F7Ta0sYJmqJhCwPgH+V1mD2OYaOYs9GczTDU25COwJwNlLIVhKTKPa1+92ALmNBbtBvaMEmteR8XUEFNl59hYIaUUyKeZIMQIoGEEZiYi8nqVj1Tw4xJqX0ixrot0+KS+d5HhEfD+mu5aswAG+Eal1eionnNMM5ykSLdRvQCc2KhkrnwGdwQUMMGg32CKIUs2ae7313xK1WaSSIvX0T3XwsMjdKfUtiwe1kzMs6Z4WN9gnfHVSMFpzT57WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htO6k5tkRGlYJygU8RCCLu2Lydw8uEvKCH62asuzYpM=;
 b=writGn/oLJWj++88QuLRzn4cquokHAqmtC2hXAYFcs3lLFFLSHD335hqPtZB9Ikls9t3paHR0v9bCLdc7Nnr08KDZHKMW2rHoDho7Tx3b0l12aBYu0uKiSTvkuKcDKqJlGuXPVIYUAZdBo8TK1X3QJWggN2KLNs0eW80dWAv2eo=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Xen Security Team <security@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: RE: [PATCH 4/4] xen/arm: Correct the p2m pool size calculations
Thread-Topic: [PATCH 4/4] xen/arm: Correct the p2m pool size calculations
Thread-Index: AQHY6SStZDoQezt9v0CQXVr6uHbE2645mSbA
Date: Fri, 11 Nov 2022 10:11:39 +0000
Message-ID:
 <AS8PR08MB7991D6139BEF9ABE43F1B3C492009@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-5-andrew.cooper3@citrix.com>
In-Reply-To: <20221026102018.4144-5-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C7F6F5BFF6475346A872C647395091CE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB8386:EE_|DBAEUR03FT038:EE_|DB4PR08MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a048a3-70cd-4ca7-98cd-08dac3cd254a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8sehzj2l716Vo8Ty8NaMLpqQfxT4sxIhx3s7GBZq1IOjekR/8C4X+UmQMnmsOYVQB/NcDXJ/viB7WNI5PnLBMHta48BYe70atyGB97FJfTz9Q0pZLbMvgX8GnvLEa1qFiem4MuoZUVjgYumeSAGbKF5THM6UDO3sWop/KlBCOjr92a07N+yvfNvq5AEM6PCpg1E3hQiiaiTeNP8UFQvFp82fMNj1MT98ycb+LypsGCt8pMO54qXslTINQAXiV11cxB1t500cX3G4Ec+yldfqKzOARuiXmwS6/0DHnhc68sQGl1Qt7L3w0tGG5jwo1unuHmLWlRU32Ix1i23/C/eVKFAIh3Ho5RZ3YwhBE3xF+6o0N5BTvSdZcNQDmPqKggG7pAYZaHTj7MZkT0Z3un4XzgBRbioZFe7oNQxkF7EsRKJAdfS7KDijPe3GdaZ1ezfnvIq739MPn6Z2zphwY7a30kP2Tv5S9WduAh/9LPuH2XbujBZsQ6nUmfkoJP+TwNEZAIh5pyQ4ESO/rrW7JSt6kpzUt/uWnZHK53iJWJXepaO4SlqXd3sqJXRJVFZtwK2E/80Eqq6q4F3hAJMHnVo+Qe0nwQxGZ8wFWdKPPiy4aC0L5MH1PLGBI8v3FY+Ly6U+/hqyc85V33whshu9E/A7PSfLWWnJoMiObG8Np6FU2rWBf2fLYy68WXACYgi11mN3ekWCB1VMuMsIQDHfjxnWOJTjzzUUthnKu2RlQhvgFdshdRulzXc52UINL9fyVhPCgCdEeqJdWRCv4ozld+kZgg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(110136005)(54906003)(316002)(71200400001)(6636002)(2906002)(52536014)(4744005)(5660300002)(7416002)(86362001)(66476007)(64756008)(4326008)(76116006)(41300700001)(8936002)(8676002)(66556008)(66946007)(66446008)(83380400001)(122000001)(38070700005)(38100700002)(6506007)(55016003)(7696005)(33656002)(26005)(186003)(9686003)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8386
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f145550-0eb1-449e-b0e9-08dac3cd2000
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zEApmmjQlFBuoGpaafyH34EVqMjCdD9Tl3d3vGnisuII07G+v/2nOcBiScT9oz6qXFSd0LufPjg9HBYdZ0leD+hFjMS8IZZ1SGPAix+GYVAbbaOx3nSPgypqsURcjfyMDBbRzztiqHFuOa1Nqwb2+mZ8+YE+u+Xqmhi2IAnnuPyPbwj6p9GeBl+FLTXVLgyj7PoNg6A5pmbgQQTgkS+zfCvuwpxPJGG6CJOVbUwCosPSMCDRFxTHdhIaRwA/LUP2VXbPmQWP3BT9FR/AdDUbfh48csz/2g5e8byLnT/Ee4VOE1nSHXb5bldSzk1D2O+0XX0YmzlBbBTbtf08XM3hUKBrwiUk/C/u73Ughb6KjXVaDyLAvXuRIYyzwrwkQS6MJkkNu0Q+q/frzGM1TzpzDcdumi9xIQKviCFmqEPqrzDLf9wGjoPdaiEDXVKHLAhvfXAZHAbqUmzA53Wf88JIJ0AkzCaYrszxwM8D+oolsMGRrhKqEvTW8Z2at0zR/V8Gs5+I5pdzwCbBMyABas80Y6st13klm0Y90ocjBNmXUDFQbdcAiuSoOi7LUXazgWwIeUtU0Ys9uLUhhM60qmUbjrFKvKTTuHokjD75/6QidCaW+bcGBuRamZ3Y/960OiDKe21q13OG2xgtdpCH3hXbChJJRNBkF1qFhPENlhs8JlM32HVDuMnHipe01ZX3sguEJSboOGlKHoBn8dxQl2vVylTErcNJTGG72iJQnYnAJvHNi5CW9lzFP9ob5GlzHIFO/bE5hC6tOTLT46Cy0VXZEQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(41300700001)(33656002)(86362001)(8676002)(7696005)(6506007)(82740400003)(2906002)(8936002)(356005)(40460700003)(55016003)(4326008)(36860700001)(5660300002)(82310400005)(52536014)(47076005)(336012)(81166007)(4744005)(107886003)(26005)(316002)(40480700001)(186003)(478600001)(110136005)(6636002)(9686003)(70206006)(54906003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:11:48.7548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a048a3-70cd-4ca7-98cd-08dac3cd254a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8173

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQ
QVRDSCA0LzRdIHhlbi9hcm06IENvcnJlY3QgdGhlIHAybSBwb29sIHNpemUgY2FsY3VsYXRpb25z
DQo+IA0KPiBBbGxvY2F0aW5nIG9yIGZyZWVpbmcgcDJtIHBhZ2VzIGRvZXNuJ3QgYWx0ZXIgdGhl
IHNpemUgb2YgdGhlIG1lbXBvb2w7IG9ubHkNCj4gdGhlIHNwbGl0IGJldHdlZW4gZnJlZSBhbmQg
dXNlZCBwYWdlcy4NCj4gDQo+IFJpZ2h0IG5vdywgdGhlIGh5cGVyY2FsbHMgb3BlcmF0ZSBvbiB0
aGUgZnJlZSBzdWJzZXQgb2YgdGhlIHBvb2wsIG1lYW5pbmcNCj4gdGhhdA0KPiBYRU5fRE9NQ1RM
X2dldF9wMm1fbWVtcG9vbF9zaXplIHZhcmllcyB3aXRoIHRpbWUgYXMgdGhlIGd1ZXN0IHNodWZm
bGVzDQo+IGl0cw0KPiBwaHlzbWFwLCBhbmQgWEVOX0RPTUNUTF9zZXRfcDJtX21lbXBvb2xfc2l6
ZSBpZ25vcmVzIHRoZSB1c2VkDQo+IHN1YnNldCBvZiB0aGUNCj4gcG9vbCBhbmQgbGV0cyB0aGUg
Z3Vlc3QgZ3JvdyB1bmJvdW5kZWQuDQo+IA0KPiBUaGlzIGZpeGVzIHRlc3QtcDJtLXBvb2wgb24g
QVJNIHNvIHRoYXQgdGhlIGJlaGF2aW91ciBtYXRjaGVzIHg4Ni4NCj4gDQo+IFRoaXMgaXMgcGFy
dCBvZiBYU0EtNDA5IC8gQ1ZFLTIwMjItMzM3NDcuDQo+IA0KPiBGaXhlczogY2JlYTVhMTE0OWNh
ICgieGVuL2FybTogQWxsb2NhdGUgYW5kIGZyZWUgUDJNIHBhZ2VzIGZyb20gdGhlIFAyTQ0KPiBw
b29sIikNCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0u
Y29tPg0KDQpIaSBBcm0gbWFpbnRhaW5lcnMsIG1heSBJIGFzayBmb3IgYSByZXZpZXdlZC1ieS9h
Y2sgZnJvbSB5b3UgZm9yIHRoZQ0KY29ycmVjdG5lc3Mgb2YgdGhlIGNvZGUgaW4gdGhlIHJlbGVh
c2U/IFRoYW5rIHlvdSB2ZXJ5IG11Y2ghDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

