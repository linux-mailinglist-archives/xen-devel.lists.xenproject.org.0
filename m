Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F07984094
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802487.1212733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st11X-0003Ks-98; Tue, 24 Sep 2024 08:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802487.1212733; Tue, 24 Sep 2024 08:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st11X-0003Iy-6J; Tue, 24 Sep 2024 08:35:55 +0000
Received: by outflank-mailman (input) for mailman id 802487;
 Tue, 24 Sep 2024 08:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Gt=QW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1st11W-0003Is-1U
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:35:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f403:2612::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 027e6dac-7a50-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 10:35:53 +0200 (CEST)
Received: from DB9PR02CA0023.eurprd02.prod.outlook.com (2603:10a6:10:1d9::28)
 by GVXPR08MB10544.eurprd08.prod.outlook.com (2603:10a6:150:153::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Tue, 24 Sep
 2024 08:35:44 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::f9) by DB9PR02CA0023.outlook.office365.com
 (2603:10a6:10:1d9::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 08:35:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 24 Sep 2024 08:35:42 +0000
Received: ("Tessian outbound 45432d802583:v465");
 Tue, 24 Sep 2024 08:35:42 +0000
Received: from Ld3564eda26de.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 934EEEB2-834D-4B32-B7CB-467EC7E6E4B5.1; 
 Tue, 24 Sep 2024 08:35:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld3564eda26de.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2024 08:35:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV2PR08MB9878.eurprd08.prod.outlook.com (2603:10a6:150:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 08:35:27 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 08:35:27 +0000
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
X-Inumbo-ID: 027e6dac-7a50-11ef-a0ba-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kESnu/i9HOLo+62QPcLUjb1Tlasaf8c68kzQb374YAoOfX8LdV991FHP4peVqyO8PllGv7mf/k+onYO9fWv7TJjHh6MlXFah3bWVuNNmvL9wTwolRRk4MoyL+33tZ/Iv1AY7oekW25atINJsf0Dl55yk0lK+NFUrLlDefoVO3OV/KSHAOTEPEG0H/Z//99kFMxFNWrt0iVabTZAi6f0dHCDh4qzeE8v3N8/MuQfSf62y7MUYni4IFJ8AT0WWOGMHSMcXmU2Z5xJuDNbc3T8bWyDJ4xYYKfjCkdsy5Gdvk3DKo4IMnNEePzjrdJ0G5DmeEbLC555id2Ge8nFzyaWzhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOO/of8YQRTfR/DdU+99ct/xo9PhrOi7EQey8Bg576Q=;
 b=N0jgnBIVvhN2PV2RH0U2Vl4NyGKRwjYIDZRgJMLCyKL4Jk47LzhYMmf/JzAln9yUqwGJDBSMd6SDro3KevmWZBYvEeDHTZTwy0blHqKVFPH5t9omS5CfAETgUrayknjvskDGux8x//gKjDjmOcKmFZD6Jhp7jKeUmEwQIfZJrQb7ZZQCuxsdwu4+G+8k0jZr7MmJJrFOYpllvy2qxxNSQhF5wfEQHVl6JGnnOpjB2mzxENz8NuJD2AYpo416oeW1KezTbQyqLoOmM2ZoGPw4d5OE5ytoAOSnHHLHrMR+xG51fR30Xe3rQN8kFgBANt/+jjyjhKE69AwEhQL/dDSJMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOO/of8YQRTfR/DdU+99ct/xo9PhrOi7EQey8Bg576Q=;
 b=Bcsl91AeoY0FoUAy85OStD6TwlNLoYC6/ypNpxIRocmICnf6kFXyfWtKowLIgryBpPGZ8vgYjW1awytNOs074XTQ01+TJtQG+UvrwIJY4+Edy+1+UcX5TNP34mz9SnlClx1gleLo+zFrfteK1Le5Gc+jYHUoQPSamOCCgXZhIng=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25c2558d40846ac1
X-TessianGatewayMetadata: iWyHrnIoBwKpu4WH2UDVr5q0h9T4N9vnjMcgv0twSqz4RWF0PhIyevUW0qFGwDQ9lPt6y/JfkSDSTESTA590REzQ3JELMb0LGahtFleMMbA9eN44iywzatlabd/wiTKNTSSe6zecl13xe5Ym49WRRW2rq1zNH5ntPMETwxkFAPg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkFNlxoedkB0HfHcp6uuR01gKXsrmM7SQFZotanvjDg3ju5F98tu2qC3sYvm0HqJLcKwX1+9nbQTE0gpzpG4+/HgLBJ21iT/zClRXpee0cfzhYYyGteFacxKG8XFjVzg8KO+5LhullGuNDCcexmBN/6yJ2pMxxPcasBPfwlVTvFfCZV+9LSYFZPBRKLy/fPbZq6PS7jlBuYBQt8ZD8T0ImowtS9WayWPOkn8gLqv5Aqq9EsXIK+1l0UWaySb7Mk3HHNdJVVAO7x/G9IUAIDusxMS2E1jXQOKktugd+vqG0huXUurSwicgtbr6I2EZl59s2UDowDRwdK3S2levJ8kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOO/of8YQRTfR/DdU+99ct/xo9PhrOi7EQey8Bg576Q=;
 b=AyJcqXxsD6T+2j06ZdEW0QuDUxjQxGX4l7o/X/A3SjbzRJH2BZS/YOiNMnmqtCmr1C+xhVb7d5IBEp365uFG/erVrBa8bUmkEYq0EHQdCBOZRpj6GVi6biVyqaQYGQh9R6PZUPNLcWcf2nhDg26Chqnjn5Rjl6VwqwcB/jpHEvgxGwRi+kQtzCBp6W5uqhwwmV0aBj4X4D7tsJwfhcm4QlI9FugIeNRJ5qKR5W/PkTAL06z6l5Fs0RGBTu1/zdBoBNFDnr4annxpEb3m+40vf1jvHf5F3zPGB5AEFtfIizs1U4BT7WNCeJb27mv758Q6AWf2vXY5TLksp9IEqzaaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOO/of8YQRTfR/DdU+99ct/xo9PhrOi7EQey8Bg576Q=;
 b=Bcsl91AeoY0FoUAy85OStD6TwlNLoYC6/ypNpxIRocmICnf6kFXyfWtKowLIgryBpPGZ8vgYjW1awytNOs074XTQ01+TJtQG+UvrwIJY4+Edy+1+UcX5TNP34mz9SnlClx1gleLo+zFrfteK1Le5Gc+jYHUoQPSamOCCgXZhIng=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Artem
 Mygaiev <artem_mygaiev@epam.com>, Hisao Munakata
	<hisao.munakata.vt@renesas.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v4] docs: fusa: Add Assumption of Use (AOU)
Thread-Topic: [PATCH v4] docs: fusa: Add Assumption of Use (AOU)
Thread-Index: AQHbDlvoRYqvnVDIUEKfvWyNdDDz9bJmnKWA
Date: Tue, 24 Sep 2024 08:35:27 +0000
Message-ID: <00A3FAFE-E890-4706-A311-F383833B528A@arm.com>
References: <20240924082923.1286023-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20240924082923.1286023-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV2PR08MB9878:EE_|DB1PEPF000509EC:EE_|GVXPR08MB10544:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2c517d-9e64-41f4-496e-08dcdc73e0c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?qteNVJXuRqNRzdrgT4d3J7vmYO5BEYzXwK/LCBulFK2UVJChTyW5k7P0BA4V?=
 =?us-ascii?Q?tzGxQjwf7tIAC1aIBYKLuP33S8Ug2lT4FViMerUNwp2VI88TzBlU2E4gmeeu?=
 =?us-ascii?Q?YoRF9C4fLkNWiSGpc8jv6ycDM8vC7Dt6bd9JnAYMrH/2Uw6+3yZDHvRveN7u?=
 =?us-ascii?Q?7qGfeD99fivWKmUY0fNZk9bsCF3FamKl584JznTJYu4XgcD4dL86MpotHYTU?=
 =?us-ascii?Q?+B8aNXV0462HfjFuz6GqDe5kOD0u6/5ZPU6NN+RB+6qEGHsFgFLsUWxwgwQ1?=
 =?us-ascii?Q?6D67/zi/pGTkgB22Rvn9uMw3VC4AM3VbpAFYtilvHt3yaiqjfqzSfTvD0Poa?=
 =?us-ascii?Q?rlxCQod1XlWJk9sQPbtpEuRB9tqmWHbP22j4Q0ZhrebIg65Bk6BsigpY/xgd?=
 =?us-ascii?Q?AU/q1N/wXYSN/727ALWq+EfcVOEV6P3KBFBditlUBAMTO/c6sfR7X/Duik/w?=
 =?us-ascii?Q?T2xsOqQdk5s3LZBJ0HyCRkC8acrmuXXFC9jguYOlquG/LxMNuATGnngi2IHk?=
 =?us-ascii?Q?Id9Rybt42zS5KUeafvhGoKpd02p61ksi56xA3ACERd8ldunSy8Ssx845knsG?=
 =?us-ascii?Q?8VsKPPs79y9t6J+aPAOxGhYtPwCmaNlzZbVoTcJU8s0M2vjBzaadblwb08wO?=
 =?us-ascii?Q?9hQQyba9cVyAv8gRUKxn5BMr9isaoe0Z2IX2RuvSVmMx+9fnKUpcGnx4U8AR?=
 =?us-ascii?Q?F5n88k/ALGvAgMRnjdXcYaeLNBZ4GWYEYRqvguhqghKurYE3t1umP3n0z+f5?=
 =?us-ascii?Q?LoXXb/g/5tzj/y5XQDHebe26ePUDaMslWkc75S0A3ZHLLRHnKJWSmip2S+Rr?=
 =?us-ascii?Q?FzF9vSJLdRkgemO/ZpiBncO99lZw69QF6PsRDJmUbX83+SGhIznVh2A/JMAr?=
 =?us-ascii?Q?iFMDnYQpgqVblckLuRt5cnmAlKrimmuf/Sbx1rb442EhkklkNQBdy/s/992s?=
 =?us-ascii?Q?g3TBjv2zeD/ktnECtHXccEpqeij6mmCTGUlM6SPp23dmmMWIglpiFg/LQ/6V?=
 =?us-ascii?Q?QOjK2Y+MA/WU2YGQboAfZm70LcR3a9tgquBC+LbgROW5h6mRc+cqEsgRpGuX?=
 =?us-ascii?Q?X8YE14CxyjwAxQ45Wy8wpA01f6yjkXNPQrbFaRIibV9bFUQZRZR8VFhmeW2B?=
 =?us-ascii?Q?5rLZDdosiMbGSrMiBunCaJIQYDngQS+FBWEJXslRFe0qhJZROa1+wZMnFGtX?=
 =?us-ascii?Q?wSTbZm0AW1rg1pDhhkU71SR4RPGLKRSXj9seA0pgj8y1OeQHuXMkkXtETU9J?=
 =?us-ascii?Q?NbAC0jmHSN7lIlt0OR1TiN5EzQzR/uylGwjs/G6CPmWoI0YNNmEHxzWuFhmh?=
 =?us-ascii?Q?H8/gVHStq9KKeBdryYieRUBnhZTLx8iWZb+tGdeSMmYOZgj6oijxtmtDAfQl?=
 =?us-ascii?Q?ZPyi0SqC4YFTszBZQ+rs1cn0c3+R8UkZX/kUYCg73QF6pTDuQA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6AEA8046343C2648AB2C68A650016E56@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9878
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a62ebdf-1bea-43a6-f0dd-08dcdc73d7ad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5KEiuplNhMhylYGfVrQJiTAmvl8adpi8Q+3aBObqxDU+7lGiYNUMOHTh6fy+?=
 =?us-ascii?Q?78VO/nM1/3Fy6gqiXTa8aNEyeTm0Zstq2u8VdBWJeKuIyoZMYgqjtr5MMgmO?=
 =?us-ascii?Q?+SDvKKWJjRPz0NjMj2AA2MWtHlppsllEPf1BQSCbr3FOYalQVqTNBQGNllO6?=
 =?us-ascii?Q?1kQXFHqT3RlpD0bo18cAe2QzSTeDe4Eznd6JVreCaEQbUCq/BR9TZslE41Ji?=
 =?us-ascii?Q?UV9W0ueyUytK0cpn5O82ezcYez0DLafKIWDz8OHbA0SALhILGQkpMGN0BeL1?=
 =?us-ascii?Q?Y2z/ZytP4HQeOn1KFBBfYufCTCD7NlhuyIAkCWdHcE89Xx5W8Cve5m4BThQt?=
 =?us-ascii?Q?UmPSbEvUp/mI1OPeO+aKhoj0oJ7SCLM9uuXuScP6o0+rAM/izMH2xvB4lSTm?=
 =?us-ascii?Q?dad/EvpMnno60Gv8sMHwb9tm18JB1FLSUwpF46LiS4ACNcx2Mub4BOh/IOOH?=
 =?us-ascii?Q?eJ1inoxHKhnglFP9sw5fsd/+CzmFiNCbk/Rxn6omeKLd2H7mNVE/g7dxis/V?=
 =?us-ascii?Q?5xBzzHvkFLUfdD00hqsn/1DMaRQPO2W/OcRCUwxIjiezdFJ4gP9yNH4D3hKn?=
 =?us-ascii?Q?e0+FreAex6QQp1KwtRcOk23Cb4wBDrOBpZGepLSwxMdi023ZTLZNeDixpnaz?=
 =?us-ascii?Q?DDStrIqtmjqK4S8bYwX0kDpvF25VQCO2aTMZTj3Paoe/Z+Biuu7c/giLZYAq?=
 =?us-ascii?Q?yK7DVPpjVa71oGva95DM3zwrgsHPoxeZ2MDdR6RrX5y8sMBecA9jp5CxPnSw?=
 =?us-ascii?Q?N3kpWyNmABR+ZLNW6fgNZBLv9NGN/8wPNhm6XmAxOG35ZBQ4FdA+vcc/GJeC?=
 =?us-ascii?Q?ajbQWTcRawSy86nh1wNuIVIRM5iKexZQzA3+KymsJ4ZycoWN+d7I6QwrBrMU?=
 =?us-ascii?Q?qpAl14yj5Z1hDXXWNzc7OhBPUVRzGE3vmc9WxjfL/v/mCvG2+rP4OcmYDDlD?=
 =?us-ascii?Q?lR4m35IJxb/UNXVIjKlg6SIfFBZtsH+8dVPbT5zAp1QrA+9vADonENKBz6m1?=
 =?us-ascii?Q?g6KuIMleBPJdeXf+Ngh2xNFpekEh4p8/La5n0ptGt3qAXL+EPM4xWhH2E0AL?=
 =?us-ascii?Q?ULl8UU0XEWI6ZSiVGnZfxVQ5sDSMFtjYXlMSSBy8z0ZlZmsBaoyboD1mfElm?=
 =?us-ascii?Q?KRactRkANwChAe40IbabTYYYXm5TJVlDhSzBgSEaExk/+siNkzak0fQggRCK?=
 =?us-ascii?Q?dXvddIF6+4yyJKyWKWJtvUSrDtRrRvDQ0xZtGPG4XOsylJYC0MCaHUFdKbRv?=
 =?us-ascii?Q?oNs9jzItaB8rN3sGT7eAjprsdJBUKQ46zU4VwpTltJy0VeJYvnxcT68rnuwr?=
 =?us-ascii?Q?jimO1a4pEz49uCrJI7q3J52gBtVUZ7BgHwxSgRMsmFLW6BOWDzsZcVe4w968?=
 =?us-ascii?Q?geFDJQVCHW89HE2e8CNXKgvoHhsC?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:35:42.9609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2c517d-9e64-41f4-496e-08dcdc73e0c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10544

Hi Ayan,

> On 24 Sep 2024, at 10:29, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> AoU are the assumptions that Xen relies on other components (eg platform
> platform, domains) to fulfill its requirements. In our case, platform mea=
ns
> a combination of hardware, firmware and bootloader.
>=20
> We have defined AoU in the intro.rst and added AoU for the generic
> timer.
>=20
> Also, fixed a requirement to denote that Xen shall **not** expose the
> system counter frequency via the "clock-frequency" device tree property.
> The reason being the device tree documentation strongly discourages the
> use of this peoperty. Further if the "clock-frequency" is exposed, then
> it overrides the value programmed in the CNTFRQ_EL0 register.
>=20
> So, the frequency shall be exposed via the CNTFRQ_EL0 register only and
> consequently there is an assumption on the platform to program the
> register correctly.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

With "functional" change to "operational" as suggested by Andrew:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from :-
>=20
> v1 - 1. Removed the part of requirement which states that Xen exposes the
> frequency of the system timer by reading the "clock-frequency" property.
>=20
> 2. Added a rationale for AoU.
>=20
> 3. Reworded the AoU.
>=20
> v2 - 1. Reworded the commit message. Added R-b.
>=20
> v3 - 1. Fixed the definition of AoU.
>=20
> 2. Simplified the description of "Expose system timer frequency via regis=
ter"
> AoU.
>=20
> .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
> docs/fusa/reqs/intro.rst                      | 10 ++++++++
> 2 files changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fu=
sa/reqs/design-reqs/arm64/generic-timer.rst
> index f2a0cd7fb8..9d2a5a8085 100644
> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> @@ -30,7 +30,7 @@ Read system counter frequency
>=20
> Description:
> Xen shall expose the frequency of the system counter to the domains in
> -CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" proper=
ty.
> +CNTFRQ_EL0 register.
>=20
> Rationale:
>=20
> @@ -116,6 +116,28 @@ Rationale:
>=20
> Comments:
>=20
> +Covers:
> + - `XenProd~emulated_timer~1`
> +
> +Assumption of Use on the Platform
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Expose system timer frequency via register
> +------------------------------------------
> +
> +`XenSwdgn~arm64_generic_timer_plat_program_cntfrq_el0~1`
> +
> +Description:
> +CNTFRQ_EL0 register shall be programmed with the value of the system tim=
er
> +frequency.
> +
> +Rationale:
> +Xen reads the CNTFRQ_EL0 register to get the value of system timer frequ=
ency.
> +
> +Comments:
> +While there is a provision to get this value by reading the "clock-frequ=
ency"
> +dt property [2], the use of this property is strongly discouraged.
> +
> Covers:
>  - `XenProd~emulated_timer~1`
>=20
> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
> index 245a219ff2..48f70edab5 100644
> --- a/docs/fusa/reqs/intro.rst
> +++ b/docs/fusa/reqs/intro.rst
> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
> OpenFastTrace parses through the requirements and generates a traceabilit=
y
> report.
>=20
> +Assumption of Use
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Xen is making several assumptions on the status of the platform or on so=
me
> +functions being present and functional. For example, Xen might assume th=
at
> +some registers are set.
> +Anybody who wants to use Xen must validate that the platform it is used =
on
> +(meaning the hardware and any software running before Xen like the firmw=
are)
> +fulfils all the AoU described by Xen.
> +
> The following is the skeleton for a requirement.
>=20
> Title of the requirement
> --=20
> 2.25.1
>=20


