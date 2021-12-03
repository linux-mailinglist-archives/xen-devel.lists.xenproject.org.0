Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A03467A5F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 16:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237777.412390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtAb5-00076X-Bg; Fri, 03 Dec 2021 15:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237777.412390; Fri, 03 Dec 2021 15:35:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtAb5-000742-8J; Fri, 03 Dec 2021 15:35:39 +0000
Received: by outflank-mailman (input) for mailman id 237777;
 Fri, 03 Dec 2021 15:35:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOtX=QU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mtAb3-00073w-IU
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 15:35:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a902ad18-544e-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 16:35:36 +0100 (CET)
Received: from AM6P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::43)
 by AM6PR08MB4820.eurprd08.prod.outlook.com (2603:10a6:20b:d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 15:35:27 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::da) by AM6P195CA0030.outlook.office365.com
 (2603:10a6:209:81::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 15:35:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 15:35:26 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Fri, 03 Dec 2021 15:35:26 +0000
Received: from d63e3eb33bf2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 82E5A3A3-9A92-4685-803C-55000D582D91.1; 
 Fri, 03 Dec 2021 15:35:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d63e3eb33bf2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Dec 2021 15:35:09 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5627.eurprd08.prod.outlook.com (2603:10a6:102:83::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Fri, 3 Dec
 2021 15:35:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.034; Fri, 3 Dec 2021
 15:35:07 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 15:35:06 +0000
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
X-Inumbo-ID: a902ad18-544e-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxziB9C61EFjJ3SsjaOKt6jCBqwDCfxuryjlIe1PoXk=;
 b=D4e4XqB8DWVXjYol43XfVw8myyyA/h1Visw/qz3HnUjrlIrzEGsno2bhKR0rpYWKz8SVlfp05nMCWp2/kr7UmzwmGmyPEmpRohVAhW15ijALd3Ctx23dLpu2sujiLsmsL0lI3tV0AjrFbmxXcRYo0wHgkbH1Kd6L8+l5BtBO488=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a783a2545ab541fa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lgvp0zg7veizxsIfFdhsPFDzhvHfAGC29ykYnjCIkl/c4RoCCODilZRawpsmCcjExq0TxX886zrwzyTslCC7uR4R/RVBxTqtGkgQYcWh30BTLf/eIDAVDWkplFjINeZdeM6ZjblQtWAtU7Su3bmHQiFUz0DPZ+YPXTM4T4Op3t7zxMtGG4uWlRh4o2qgB4YkieMMgCu2+bHzLbPwEUN+kbA+7FTaN72ehDffAMJgJMrdHt9qABjwyY0AfhlaTUVESdA7oxho7XJSv9GV1drVHykYcQF6h2lcAzJY5BOZ7Ulqqk67iISMYYQpTb0wGnSzkh9ksC4bIovysVX5lPHr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxziB9C61EFjJ3SsjaOKt6jCBqwDCfxuryjlIe1PoXk=;
 b=ksLbRSj6RLMQsRDlP2JDgDnH60+ayLEhfBhxfoScOOHOKERAf2+ewE6Vgsz3CByCKiyBcKKXs2ptnhBBd+sO/j5F43xMA+Og0sPhBv9I08iZSe2+lrlzzMM01TKnMMN7x49BpIzXaBhQ4QIeClQOVeheftgWoXuJZLL8YEe9m/Sz+SZ5qO2/w5F7VoCFuCinxB0/+Szo9r3QBFmIh024oM1xtQbf44XVAH51k7tjQKwEdf8jTjH42DdiwcysfQnLG6DEPblfAwwcBEdNKlhNFiUDPF46ui28akKJf1lSZ7gD+UOJpwcKXd28dWFzgieYbWIxhKC6FTnIfvsijy9f+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxziB9C61EFjJ3SsjaOKt6jCBqwDCfxuryjlIe1PoXk=;
 b=D4e4XqB8DWVXjYol43XfVw8myyyA/h1Visw/qz3HnUjrlIrzEGsno2bhKR0rpYWKz8SVlfp05nMCWp2/kr7UmzwmGmyPEmpRohVAhW15ijALd3Ctx23dLpu2sujiLsmsL0lI3tV0AjrFbmxXcRYo0wHgkbH1Kd6L8+l5BtBO488=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 0/7] (mainly) xz imports from Linux
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
Date: Fri, 3 Dec 2021 15:35:04 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E1B0C587-5B7A-4BD8-A585-F9E1CC707B28@arm.com>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15de16ee-f357-4d54-71dd-08d9b672877b
X-MS-TrafficTypeDiagnostic: PR3PR08MB5627:|AM6PR08MB4820:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4820CAF446C1671E73ACAB24E46A9@AM6PR08MB4820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NDDjx57wkh9t03csElMfC2uF3xtzxUPtC/7GBvyD6MowWQyKXVbpw39zPvDe6M7mv86lubnY7YnILJONAP3iOQrAaHprEUBZGQbadui3Z2l0RZTw583/TG/x5eGjBv3KxhSURQJHbkknaoPmlDyRr0EaSxQnR4F99CHPEzS8Few8dI7dOIHmNeJkadtouVQ5MaprEIjBysgnV8oGanNCA0OJ/1KargaxlhuQIQJjowOtnoXAojjigQgPf0OsGY7HQz+daJOXjvbBmhYA6bD76fp/qvLffPgbgwb0aYuG8Mxsok1gtH6Iwwuo9neereiztncZM/UmGDZf6cNFrL+ElfwkGBbU+AeOn0ly4UM5vYl2gtBTfB0P1ZPCIeBYFsqkD6/GhF53jmZSABRLYMPLelFDew2ByNpK5RcLtDtA9y0GbwnQR0ca1UQ3dnLqFwPRjLOXp/tEfU4z12xf41JNaPjNlCKyncD+dSMidRlwpsm3bP2afny33NZASQscVtD20ATdk051TCRTNgWq2MgsBQmsftj58wfjI3XnliMcXUtr2cbfZBS+nj2lv+YvM1uLLIPexSC5/q/5PfWttqtMVZ0CPa/16DthyxO3sq8qLhoNW+0fzzhNR+ZDP4Z1Tn3DgZQXM3oFhoKU/O/xwthEMrEIEncHoxnU8/j5JqYCYJ9BLXxjjMZh24NPT26Li05GE2eveaLCRUpyMpA/VYjy4WtL1/LM3jkLJ3xB5YV+RAg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(6916009)(53546011)(66476007)(66556008)(54906003)(66946007)(86362001)(26005)(508600001)(38100700002)(8676002)(316002)(6512007)(2906002)(8936002)(6486002)(52116002)(4744005)(4326008)(33656002)(83380400001)(5660300002)(956004)(2616005)(44832011)(36756003)(186003)(38350700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5627
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fcd5e57d-6d34-42d8-d69a-08d9b6727bb7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H/Mxdew0UklNNSgYKalUiOyI1YWfBVAJrry72TxnuNG4aor1rrqRBCnYCGFW7vLP6ZxXE78FZEgAGqcwynHWusyilBZgvOlbodOYGk8EpP1E0vkJ+uXLyflmk0F7A/ZppilDGh6JT+K582qbWsHUHMK/xmhIGVtWj7MftasHUuvpg4/+pKJuvxWKBs6O206ry37Rs7YvxR6j0e8syKNjQ9jXMuOWHR+L9R+wzX/Iudnw5vhVAI03pdYVgh0myUXLHMBlPkD8XPLBJGnoLhAe1zlk5qTOjlB8wa7UTe6L7h0OnAXRS0S7ia0LOcUO6EWihIKSiv19a81X/JTXddryOdXEssFEsbfLIw/Rt+dLH21TTblWHv9IShkv4HfO3qVRyeep7EO6UxySHYVuwlkIjgY9fqQq3S+IKgxDwrgmpaqbDcrsZ1UaN0QPJrD/MGdL6qBiRagT/6H0zxGkyodcOGhSPtgKNcOBHzjLlrdq7h8Tw36SU26hpMv5EFTgz5faGJeevrUSlEAJfHd4QhOmiG4WZGvhEXDhmYQb9XUrtTjmW/SnjxLSPijoGkHPfArGxHWjdfoBvXv7fWqJQb68x9Peu8hHbrO0Xcxs4Bm0sArncpQveMOjQ6NyA5mBtSKPFUU0xOauB0OsAvV+3yVdXzKKWWw4c2b7LcauqErYOCFfWqYJyMGvm97U1Chd8bxGUKQzmqhntA5x19iuUsjkIQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(508600001)(81166007)(36860700001)(6862004)(83380400001)(86362001)(5660300002)(70586007)(356005)(36756003)(8936002)(6486002)(316002)(8676002)(82310400004)(53546011)(4326008)(47076005)(6512007)(4744005)(33656002)(186003)(70206006)(2616005)(26005)(44832011)(336012)(956004)(54906003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 15:35:26.4239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15de16ee-f357-4d54-71dd-08d9b672877b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4820

Hi Jan,

> On 19 Nov 2021, at 10:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> While going through their 5.15.3 log I did notice two changes, which made
> me go check what else we might be missing. The series here is the result.
> Linux has also updated zstd, but that includes a pretty large change whic=
h
> I'm not ready to deal with right now. Them moving closer to the upstream
> zstd sources is certainly a good thing, so I suppose sooner or later we
> will want to follow them in doing so.
>=20
> 1: xz: add fall-through comments to a switch statement
> 2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
> 3: decompressors: fix spelling mistakes
> 4: xz: avoid overlapping memcpy() with invalid input with in-place decomp=
ression
> 5: xz: fix spelling in comments
> 6: xz: move s->lzma.len =3D 0 initialization to lzma_reset()
> 7: xz: validate the value before assigning it to an enum variable
>=20

For the whole serie

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Jan


