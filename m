Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA448518256
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 12:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319417.539667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpj6-0007i5-I1; Tue, 03 May 2022 10:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319417.539667; Tue, 03 May 2022 10:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlpj6-0007ge-BT; Tue, 03 May 2022 10:25:52 +0000
Received: by outflank-mailman (input) for mailman id 319417;
 Tue, 03 May 2022 10:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlpj5-0007WO-4j
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 10:25:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 668149eb-cacb-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 12:25:49 +0200 (CEST)
Received: from DU2P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::22)
 by VI1PR0801MB1965.eurprd08.prod.outlook.com (2603:10a6:800:8d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 10:25:46 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::5) by DU2P250CA0017.outlook.office365.com
 (2603:10a6:10:231::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Tue, 3 May 2022 10:25:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 10:25:45 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Tue, 03 May 2022 10:25:45 +0000
Received: from bd2c4735d04e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 64221533-3624-495C-A3E6-30D2CAF54C7F.1; 
 Tue, 03 May 2022 10:25:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd2c4735d04e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 10:25:39 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM8PR08MB6497.eurprd08.prod.outlook.com (2603:10a6:20b:316::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 10:25:38 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 10:25:38 +0000
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
X-Inumbo-ID: 668149eb-cacb-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FMZGxOg94zomk4PAKXFa/46p6dkusn9ph7iiR1jmhz/pjQdAnT8hNLXnVbc15ZkqqaJVbmf6ccxrE69uuQNXiXzU9NNZXhpViPaMy0fnOs1Vyl5CIlu/I144X17ADk+rVe99gWdNfWRzleJGSTDql4erSdSQpqJmrTBuWnVvXVcJJ4hpafeY4XSPs/Fnmy2J2sR9REJ0txC3MlgtmGgD9A6hpKn4dmaqJaF5ihOA8O9lzKuPPTepWMostUTc7F+dVAoHC1vFwcuBLwqeZfGs1vrX94+O6WovUztqXOHVig/MYnCQTEjlBNuB/QIXAj7NIRRAuUCF/urKGNKG8bDcWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIJgZiW8qVdJdb7jYloaAp5TeQKFuG7Ix9pelLWAk0Q=;
 b=oM/m1BOP83uWwxFTMgbzhnZMA3+4jEG28Wdb2WTsATx8rbp9ebv1RBBISlgUZ5p3Rn/qivVyrZq+ZVmgvOkA/t25Uc0copglpNjeBdaXg90qgVqGugH5ZxR8Le1Csav9cRR/MQOPTL/N0I3mm3PP/EWj+9paYiuz5Q87u5Ap4zGCtjoNeNT7sHdCHjqCfErddT4UPPSWAS3moOJAZpeQNOpa9BvdUUaqPg7Tr1d1KSPQMXzRQQXPhiL3ETg/mnrINrEbbRL/oY63lwTVjz298ePw7birEHHHxzegvJ2HEDYZpAhIEoHG3JSVbMnSodY56nJfPGyolmhFj1Gl7fc0ww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIJgZiW8qVdJdb7jYloaAp5TeQKFuG7Ix9pelLWAk0Q=;
 b=Bv3xBetEI1metsW8UyrYZ4RAsM4bn/Ll72YPasGBs6K8bR8tRF1VsckM6TSJkNTGhU6CFg5to4+3GB68KSQNZeA99omZU1M2g3Q17EldzpjfAP5QF/Fv8NY5j6BBFUmBymPdEma8foTjCpw1tSuVShWnCN6RZDCQk4EAvr74RPg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4306fa1c9320a637
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vm9jt7Mj1y0y/54IrHyk5h6xp8FO14LWxYgqLSYbPoj7sNVY0zJKA9Xa/kz7ICZ/fW0wSWkVrcZH6hSDtbJx3+Hqoc6NQHRX5EsAPiWi8+OSFw2C37oEAl8MoHgLf5zytIvKRBaQGG3YL1gYRaiWw/03wE6rdgJqNskbuZzH01DnWXC7ZUlaW6VzYuc0RyQeIXMDCSrg73bzT4JqUwl+bRv36FZi4FrILke4XfF6FFxYVUHV39xV++U/72wh6tFZ7wGBa9C24/SuT3FJs/WVpKSlT6IKJov9hVWVWzN3ysbXEFjjQafBUIyGvNP8hfgPhyEvZNtsXxJY/pjmZQ7lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIJgZiW8qVdJdb7jYloaAp5TeQKFuG7Ix9pelLWAk0Q=;
 b=MBst2X7s35riN4UF5Op+vqTTsX9JdUJOpE89OM7SZ0b6olnHqGRBMHL/wyEvYXGAMA7J6vbVk4wX65g7rjpBtKjpINQKLlwc+yi4EhF9sGT6MHA0jcQduKmXAJW9gwQlhDisZRDH3FQzF9ddWpYa13bpZhtisJU4azJJ8bWRD8UHbD3H70bSGMaivpx9Btnn5Gp10BC85iEhRJBKndLT1O2+SaSVn+rtA6PSykDoyy0bTJy6SnTPG8h7wb0T1t+tJ0Y9cWxDU2+SOZhjnI+DsczX/6Jiaa2gCdPupEpOcO1DELBAHQyUC4RFUpydXJTYejGCeDsV+3ZWFL2qM15rcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIJgZiW8qVdJdb7jYloaAp5TeQKFuG7Ix9pelLWAk0Q=;
 b=Bv3xBetEI1metsW8UyrYZ4RAsM4bn/Ll72YPasGBs6K8bR8tRF1VsckM6TSJkNTGhU6CFg5to4+3GB68KSQNZeA99omZU1M2g3Q17EldzpjfAP5QF/Fv8NY5j6BBFUmBymPdEma8foTjCpw1tSuVShWnCN6RZDCQk4EAvr74RPg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 2/7] xen/arm: implement domU extended regions
Thread-Topic: [PATCH v5 2/7] xen/arm: implement domU extended regions
Thread-Index: AQHYXAvYExyIwYkP/U2uZo8uX8GZxK0M+CqA
Date: Tue, 3 May 2022 10:25:38 +0000
Message-ID: <7E2A9578-C5B6-4D2F-8BE2-368511DE75AE@arm.com>
References:
 <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-2-sstabellini@kernel.org>
In-Reply-To: <20220429205732.2030094-2-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 851f8829-ac45-4b5f-abb5-08da2cef48dc
x-ms-traffictypediagnostic:
	AM8PR08MB6497:EE_|DBAEUR03FT041:EE_|VI1PR0801MB1965:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB196500DD32989BC2DEAF7385E4C09@VI1PR0801MB1965.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yMF/H+SaVv81GrWWXRb/lQo9sQIIWlx/hWbgO66seZWr/aj9Gluvf9SnrX1TSYZYZY/G0dHYHcZ6fDb3R87NS4qVBrgBoHPEHtfVa34WqKDcT6691Y///bvEGGMev2xU8apnEPE4AzLnmjDMSdFCUSj2H61h8uHMc3aDef2pIcFG8vnCg99IvV0IlWzLuN0NqB4trt9wSKCUD851+4VC12ZnIY5vbjZzaM8aZ+bmDi+qk0D6Y2ELtghSZSvMKzr9PpRgkiKYLV9za5PZFj8A3fQd9l9jCHm+R+0oKJSfl7x7uot9GFKVJDWsYhxVLSh2bQWZ7Q88/Swt74St3UeS/GoZzGllWcy1E3dL5YWd2HWwip8a/jWmqFcc9dCQAHfJhIZpnjR4ARxRkIkhxBG+IBo35+ewnzrPiahduT1URA/CaFgBh3Ki88/Qih6qxpKjOLCzMyPhC6lDvF+CpQBxjDmDAVM9uVjQ093bv+lcU9zrEankbiLkkNDlmrEgS9cqgkQVGGQVB32dvBLytoLiu8MWVN8WBappq7c6hnRwzaKCUVStOdJyXBSFnNn9rAJa41e7k/rgcLzaF34C5KzxGuYp3RRTDrwua4/sG0Porcwg2LzafUqgnNJ0J07svEsll3SlHxm7rsH3L6xozYTZk2Tp9I0BaHuoxgP7jYryPxfZgU3yzIGe2Iu++8PoIT9mL782ka+uE7uMHExCrloey4pmFW5E/zQYS+PGcqKpvxz7jZTN9p+39tdItVnqPcSu
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66446008)(64756008)(66946007)(66556008)(33656002)(83380400001)(4326008)(76116006)(8676002)(6916009)(54906003)(2616005)(186003)(316002)(2906002)(6512007)(26005)(86362001)(53546011)(6506007)(71200400001)(36756003)(5660300002)(38100700002)(6486002)(122000001)(38070700005)(508600001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B05E912B0ECD024F9339D111D0212B70@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6497
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3dd7550-7f57-4b2e-01c7-08da2cef44a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ENh8u0+dJoh9Ve8lFO8QW/m0EPrLTrpxJw1Xx1LQehipoDRkLGyskGqDSGxBFfk3LDusOXrWy5u3riI6H47QMzojQsholrf+O2qUxEJiLwj05VZvDvEIoe6gwcgMqrtVNJnJC80CyZdkSWRSixkWIl0EX8zFOWTdmwNt9W/n2im2qS9wsFU+5xLVruc95+YPbKEQAx5gNlJInSU6C2BED80y/NE/zsTpw38SKwvhMTE2R7ajFgRBargmgiTZI26e589Jv4mPYFH1P4EXgoxfWtO370jqFeIXTS+Lwd2MYfX/Lc4zBs3KDKCe+kTCkWQUHLeWuFS/I2As8QrtRav0ZQGQiOs9PELfE87Ed91BWXTLgP/W29XBDaX+rEtcaeZUjdjw5KUl9gGI7WPcqx1tRBtuLddDGHJfRuWqQ/MYrjPr3yixoNvURwHZXNhNuU9d/jrZPtoMgZiK5liuuucaeBMrFmiLL6/BGTPQGKF2ypPauactSqtG0u9JENqKrqbhz2io0gheYUDEC9maImHot0zGT47Gz/1a3eww5PdmJrtlQQJ8fe+5ubrHHqHOmNUuAUAzKGwuOi6/j2HXVaCsXmTUQVyDi1+QamJp0kIWzEHv6FRjqG/WsY7IsueSJtHakhN3vhK2uE39EkwMAZgJstEcM2zqp4eOpjKkgMhGHtQzmsHrmHTKEs8fOxwIo7ix
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(26005)(33656002)(336012)(81166007)(36756003)(356005)(6486002)(53546011)(6512007)(6506007)(508600001)(186003)(2616005)(40460700003)(83380400001)(36860700001)(47076005)(54906003)(107886003)(70586007)(8676002)(70206006)(6862004)(4326008)(86362001)(2906002)(5660300002)(8936002)(316002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 10:25:45.7573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 851f8829-ac45-4b5f-abb5-08da2cef48dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1965

DQoNCj4gT24gMjkgQXByIDIwMjIsIGF0IDIxOjU3LCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4gDQo+IEltcGxlbWVudCBleHRlbmRl
ZCByZWdpb25zIGZvciBkb20wbGVzcyBkb21Vcy4gVGhlIGltcGxlbWVudGF0aW9uIGlzDQo+IGJh
c2VkIG9uIHRoZSBsaWJ4bCBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+DQo+IC0tLQ0K
PiBDaGFuZ2VzIGluIHY1Og0KPiAtIHByaW50IHRoZSBkb21haW4NCj4gLSBjb2Rpbmcgc3R5bGUN
Cj4gLSBzaW1wbGlmeSB0aGUgY29kZSBpbiBmaW5kX2RvbVVfaG9sZXMNCj4gLSByZXR1cm4gZXJy
b3IgaWYgbm8gcmVnaW9ucyBhbGxvY2F0ZWQgaW4gZmluZF9kb21VX2hvbGVzDQo+IC0gdXNlIFJP
VU5EVVANCj4gLSB1aW50NjRfdC9wYWRkcl90DQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tDQo+IDEg
ZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYw0KPiBpbmRleCA4YmUwMTY3OGRlLi4zNGQzZTVjZTMwIDEwMDY0NA0KPiAtLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jDQo+IEBAIC0xMzI0LDYgKzEzMjQsMzcgQEAgb3V0Og0KPiAgICAgcmV0dXJuIHJl
czsNCj4gfQ0KPiANCj4gK3N0YXRpYyBpbnQgX19pbml0IGZpbmRfZG9tVV9ob2xlcyhjb25zdCBz
dHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBtZW1pbmZvICpleHRfcmVnaW9ucykNCj4gK3sNCj4gKyAgICB1bnNpZ25l
ZCBpbnQgaTsNCj4gKyAgICBwYWRkcl90IGJhbmtlbmQ7DQo+ICsgICAgY29uc3QgcGFkZHJfdCBi
YW5rYmFzZVtdID0gR1VFU1RfUkFNX0JBTktfQkFTRVM7DQo+ICsgICAgY29uc3QgcGFkZHJfdCBi
YW5rc2l6ZVtdID0gR1VFU1RfUkFNX0JBTktfU0laRVM7DQo+ICsgICAgaW50IHJlcyA9IC1FTk9F
TlQ7DQo+ICsNCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEdVRVNUX1JBTV9CQU5LUzsgaSsrICkN
Cj4gKyAgICB7DQo+ICsgICAgICAgIHN0cnVjdCBtZW1iYW5rICpleHRfYmFuayA9ICYoZXh0X3Jl
Z2lvbnMtPmJhbmtbZXh0X3JlZ2lvbnMtPm5yX2JhbmtzXSk7DQo+ICsNCj4gKyAgICAgICAgZXh0
X2JhbmstPnN0YXJ0ID0gUk9VTkRVUChiYW5rYmFzZVtpXSArIGtpbmZvLT5tZW0uYmFua1tpXS5z
aXplLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNaXzJNKTsNCg0KTklU
OiB0aGVyZSBpcyBubyBuZWVkIGFueW1vcmUgdG8gYnJlYWsgdGhlIGxpbmUgYXMgU1pfMk0gd2ls
bCBmaXQgaW4gdGhlIGxpbmUgbGVuZ3RoDQoNCj4gKw0KPiArICAgICAgICBiYW5rZW5kID0gfjBV
TEwgPj4gKDY0IC0gcDJtX2lwYV9iaXRzKTsNCj4gKyAgICAgICAgYmFua2VuZCA9IG1pbihiYW5r
ZW5kLCBiYW5rYmFzZVtpXSArIGJhbmtzaXplW2ldIC0gMSk7DQo+ICsgICAgICAgIGlmICggYmFu
a2VuZCA+IGV4dF9iYW5rLT5zdGFydCApDQo+ICsgICAgICAgICAgICBleHRfYmFuay0+c2l6ZSA9
IGJhbmtlbmQgLSBleHRfYmFuay0+c3RhcnQgKyAxOw0KPiArDQo+ICsgICAgICAgIC8qIDY0TUIg
aXMgdGhlIG1pbmltdW0gc2l6ZSBvZiBhbiBleHRlbmRlZCByZWdpb24gKi8NCj4gKyAgICAgICAg
aWYgKCBleHRfYmFuay0+c2l6ZSA8IE1CKDY0KSApDQo+ICsgICAgICAgICAgICBjb250aW51ZTsN
Cj4gKyAgICAgICAgZXh0X3JlZ2lvbnMtPm5yX2JhbmtzKys7DQo+ICsgICAgICAgIHJlcyA9IDA7
DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0dXJuIHJlczsNCj4gK30NCj4gKw0KPiBzdGF0aWMg
aW50IF9faW5pdCBtYWtlX2h5cGVydmlzb3Jfbm9kZShzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qga2VybmVsX2lu
Zm8gKmtpbmZvLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
YWRkcmNlbGxzLCBpbnQgc2l6ZWNlbGxzKQ0KPiBAQCAtMTM2MCwxMiArMTM5MSwxMyBAQCBzdGF0
aWMgaW50IF9faW5pdCBtYWtlX2h5cGVydmlzb3Jfbm9kZShzdHJ1Y3QgZG9tYWluICpkLA0KPiAN
Cj4gICAgIGlmICggIW9wdF9leHRfcmVnaW9ucyApDQo+ICAgICB7DQo+IC0gICAgICAgIHByaW50
ayhYRU5MT0dfSU5GTyAiVGhlIGV4dGVuZGVkIHJlZ2lvbnMgc3VwcG9ydCBpcyBkaXNhYmxlZFxu
Iik7DQo+ICsgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiJXBkOiBleHRlbmRlZCByZWdpb25z
IHN1cHBvcnQgaXMgZGlzYWJsZWRcbiIsIGQpOw0KPiAgICAgICAgIG5yX2V4dF9yZWdpb25zID0g
MDsNCj4gICAgIH0NCj4gICAgIGVsc2UgaWYgKCBpc18zMmJpdF9kb21haW4oZCkgKQ0KPiAgICAg
ew0KPiAtICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIlRoZSBleHRlbmRlZCByZWdpb25z
IGFyZSBvbmx5IHN1cHBvcnRlZCBmb3IgNjQtYml0IGd1ZXN0IGN1cnJlbnRseVxuIik7DQo+ICsg
ICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiJXBkOiBleHRlbmRlZCByZWdpb25zIGFyZSBv
bmx5IHN1cHBvcnRlZCBmb3IgNjQtYml0IGd1ZXN0IGN1cnJlbnRseVxuIiwNCj4gKyAgICAgICAg
ICAgICAgIGQpOw0KDQpOSVQ6IFNvbWV0aGluZyBsaWtlIHRoYXQgd29u4oCZdCBleGNlZWQgODAg
Y2hhcnM6DQogICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KICAgICAgICAgICAgICAgICAg
IiVwZDogZXh0ZW5kZWQgcmVnaW9ucyBub3Qgc3VwcG9ydGVkIGZvciAzMi1iaXQgZ3Vlc3RzXG4i
LCBkKTsNCg0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0u
Y29tPg==

