Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDEF4B743D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 18:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273509.468720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK24d-0004IE-Sx; Tue, 15 Feb 2022 17:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273509.468720; Tue, 15 Feb 2022 17:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK24d-0004FE-Pj; Tue, 15 Feb 2022 17:57:11 +0000
Received: by outflank-mailman (input) for mailman id 273509;
 Tue, 15 Feb 2022 17:57:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nK24c-0004F8-5B
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 17:57:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7d00::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b177001e-8e88-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 18:57:09 +0100 (CET)
Received: from AS9PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:20b:489::7)
 by PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 17:57:05 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::ae) by AS9PR05CA0034.outlook.office365.com
 (2603:10a6:20b:489::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15 via Frontend
 Transport; Tue, 15 Feb 2022 17:57:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 17:57:04 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Tue, 15 Feb 2022 17:57:04 +0000
Received: from fcf553dbd6df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0DDA7614-D8BD-4B79-943E-D3899A7B94ED.1; 
 Tue, 15 Feb 2022 17:56:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcf553dbd6df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Feb 2022 17:56:54 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by VI1PR08MB3616.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 17:56:51 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 17:56:51 +0000
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
X-Inumbo-ID: b177001e-8e88-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOQsaqlE5PeDQaANSbG7W5ZFK1FQeQi88BOq4vaUGwA=;
 b=XRgTNOZhExsOtZcgMbPQDw8nR5CXVxOBpuVUBo6Vchtpde7oxac2gxYE7n4MFD28i2gxqUkycjar3UQ8DgKQ6ri+eGDYXmwaap9GWdNhcYOvanZT/CYl7AIrqbR5wmXPaxuINIMOPmkLWA1zbmUUV+OGtZgdmK8RUn4CLzdnLlc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 42b1c2db601cdfdd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXMuLnKQ0tFABBCfy+H4doIqV6nvD1anuqRXpl3dghQNpIYDoTiVElpwqaEgUHfky9o0nPVr/UpGNSH1bH6K2f5m1VDjt4kMAdfu3eCF+F9C4KwUlt5IrEwMIbCpX5xd9I2ch1IbjBcd719FXrn/e8k4nPlyU1ngzxO0ovK5VuTSGByg570KOEyLQR+Y9CQL7A/rX43NDDMG2LrTT30LlhW+DiiS/w6yPSu47GnAvhLmU9FK7rjJkJae138Usiv5dFEtlP/7Elo0/4oL4PvBU6lKaTRIlwbUSDw9BFY2jTMvmMQLomojvSUlhUqu9AgJlRwlfnfSCze5KOhfM4Wkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOQsaqlE5PeDQaANSbG7W5ZFK1FQeQi88BOq4vaUGwA=;
 b=KQozMf3BisBcGUp2IJop7rkq4UK9prsYkHiapTXAAln+XxvoNENRA6GwGbYBxgf5Zh/MlcOs85CY5FnUXOFyhk8vf67nzQlz+/cPDP1+Y4fUdv8wwiUTbv1oQ5sU1CZMuEJCKRcJx6ezAcEOXqWeOZI9RFBSXlNzZUclbVgowlj5xP3Wim5ue0WLYgFlEVEsiLMTlfehYCIMbAgNXjHaW3cjufIUxuo6ixajTyTkOBeEJnKP+I5r4HlJ3j53E5ywEuuCIuCKHUwGHIbq4Qs8s1/IfVAKJeQxGtBvtNj5ABqaQrJ0hUxm+lqu2Z1Z5TJzYiKXsqWHNSScePQMe9MpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOQsaqlE5PeDQaANSbG7W5ZFK1FQeQi88BOq4vaUGwA=;
 b=XRgTNOZhExsOtZcgMbPQDw8nR5CXVxOBpuVUBo6Vchtpde7oxac2gxYE7n4MFD28i2gxqUkycjar3UQ8DgKQ6ri+eGDYXmwaap9GWdNhcYOvanZT/CYl7AIrqbR5wmXPaxuINIMOPmkLWA1zbmUUV+OGtZgdmK8RUn4CLzdnLlc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
Date: Tue, 15 Feb 2022 17:56:48 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4d98638e-d69c-4259-10a7-08d9f0ac9387
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3616:EE_|AM5EUR03FT048:EE_|PAXPR08MB6766:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB67664C0CA9EBD82506DF9AACE4349@PAXPR08MB6766.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rDIpDnql1iaCd2bBOgTVtSBptuty0gVfuoUwFAfScG7FbqZToQb5v6OfkL6k6c8C4BsgWHmYR9dha6fNmlDiGoZBSTVmZM6decAaElAOqoet2TKsgm/bDONODHIvXtlNbgHRR97sOnxk7vFBp+al4Vn/i7YuhLhdJFSIhlYF82EUG0dNEB1opjPuqmAVL0xk55+2/W7CElRReVmXQBUpzkPIdr4ylIZTkwd1JdT8NI6NmFuBQRXxjonuaOI2pqtcX+nh/+SVQltREbDEscb+rmXK80QZrqsURKRoTiQ7gVVdL8VnYBRrtwcnQrVGmobfzrGyBhm/X/oge9ko9aIszJdNyICFnR6NFfoi7HCrOSMT6X1gg/raEcTlWxuxriMkbuZx2g3jpJgnaVZVWZZQofZOpik1/O5Tp1OBIlGT5Iez9TTpRwo85xloszEuXP7ZoX5YseJ3g/BuLZNvtWX/o2m7yZZWhfFh8wYAwLB09ZAeHweyVSKNFXr+a2AdiIkfgUbKTrQuYpZcRLm0RgsmLfWB2odwhac6uoBP/cZ1Ko+yCISohCRqaqUew6b8svhfNo9oCzhcnIfCg6UQ2VddBDJaTRjGtiHHQvkhTWN+Ug9chdF/1WcZukLRg1ZI84E9m5g4eSMr4zB0ic9B7Shg+i6BYyk0nclwNrD+k8h0hQWmOwD9H52YaMGrM0c1vTPsQ8KdiNOiTxc7KQ798G5fcp/7+0lPKDLGRvaYUAk7go4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(26005)(66556008)(86362001)(83380400001)(66476007)(186003)(38100700002)(38350700002)(54906003)(6916009)(33656002)(6666004)(53546011)(6512007)(6506007)(52116002)(2906002)(2616005)(36756003)(8676002)(4326008)(8936002)(508600001)(6486002)(44832011)(5660300002)(316002)(7416002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3616
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20f4ecef-53b7-43cd-3c20-08d9f0ac8b11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SxMbLs/c0H7xdtRRQCcwNhDO3GF2MSRtOzDgJ8afiOP6qr82S4IBTLHWrrnM9qi23z8upvP3Mf+Bjrz3qa6dUvHuJlj+43SB2/0O15JByS+6zf++apQcbq+UNqXmO09+PAIhV33o3L1/y9vLcAIqonlleus3VPVr1su7v+v7iQ65PPmHDS8Kcala1k/M1VuSI964pdaK6O9EwduMyLS8L7Cf6LkHq7ONxguCvuLZKobqU9CG76nqKZxjOMW3166T81Xcv/CAV8uxPzXlkDbkRH9rp/lU/nMShtUesxDYDiUuc1sXP+VkNXeavePA0AioCkglRNOZy5Jmc7Z1aR99tiUNh76M1Xaa9TU/05HTZxOy9JBGNbZBa+TmFnsEkJ5/XxNF7GXiTQt93D6treeHdXTEwIsRmUKNpxp2aaEPive6Me4/ukMjh8DPGSDozQ+3oCAY1p5p4qD535IGqHBQ5gE6vv5PC1XE0d5i5qkyFMqpGrQWRiwb/JuKxCo/iXUqQZ+9yu6nhKtGojd1v4DDypreO3PX0mXlntDczqFsAxi8Wlb1ja3yGsDlpd1O8BJHZxs0FxGqKD2FCTV6zH84MC/jjwJ8MeGsVPdzyLyIbiUY/FBrhQ+ucVzjGyuNC1B7YQP8gMnCZbhUlAd1QJKG2QLwAHBQzquWgsHr1zfrvEYDGRElxydWjLh9S3VaT4Vo
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(6486002)(82310400004)(54906003)(6506007)(8936002)(53546011)(70586007)(316002)(86362001)(6666004)(70206006)(47076005)(4326008)(6862004)(8676002)(33656002)(83380400001)(107886003)(36860700001)(2616005)(6512007)(81166007)(26005)(356005)(186003)(336012)(40460700003)(5660300002)(2906002)(36756003)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:57:04.9245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d98638e-d69c-4259-10a7-08d9f0ac9387
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6766



> On 15 Feb 2022, at 10:48, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 15.02.22 11:15, Luca Fancellu wrote:
>> Introduce an architecture specific way to create different cpupools
>> at boot time, this is particularly useful on ARM big.LITTLE system
>> where there might be the need to have different cpupools for each type
>> of core, but also systems using NUMA can have different cpu pools for
>> each node.
>> The feature on arm relies on a specification of the cpupools from the
>> device tree to build pools and assign cpus to them.
>> Documentation is created to explain the feature.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> IIRC I suggested to have the core functionality in common code in order
> to allow using boot time cpupool creation e.g. via commandline for x86,
> too.

Yes, however I think the parser to handle everything by command line would
be huge due to input sanitisation and not easy enough as the DT, however
I see Hyperlaunch has plans to use DT on x86 so I guess it would be ok to m=
ake
this feature common once the DT is available also on x86.

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


