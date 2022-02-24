Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F1D4C23D0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 07:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277896.474752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN7CR-0000Yl-8H; Thu, 24 Feb 2022 06:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277896.474752; Thu, 24 Feb 2022 06:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nN7CR-0000VM-43; Thu, 24 Feb 2022 06:01:59 +0000
Received: by outflank-mailman (input) for mailman id 277896;
 Thu, 24 Feb 2022 06:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qVig=TH=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nN7CO-0000VG-C9
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 06:01:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe05::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4303583e-9537-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 07:01:52 +0100 (CET)
Received: from FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::21)
 by DB9PR08MB7220.eurprd08.prod.outlook.com (2603:10a6:10:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 06:01:50 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::db) by FR3P281CA0059.outlook.office365.com
 (2603:10a6:d10:4b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9 via Frontend
 Transport; Thu, 24 Feb 2022 06:01:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 06:01:49 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Thu, 24 Feb 2022 06:01:49 +0000
Received: from c510226caf09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E57D2EE4-F221-471F-9754-A9D52FBA74F6.1; 
 Thu, 24 Feb 2022 06:01:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c510226caf09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Feb 2022 06:01:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PR2PR08MB4844.eurprd08.prod.outlook.com (2603:10a6:101:1d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 06:01:41 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::fd0c:a29b:557a:64e1]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::fd0c:a29b:557a:64e1%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 06:01:40 +0000
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
X-Inumbo-ID: 4303583e-9537-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zy+sRm7f7bg6N49i7EYVBkY4uR4fCbeK+auPx9SF2k=;
 b=lt0j4+PDKieOA7IQPCvwExTDfXlvcNU6aigbGbztFWVI6/hnnLhxrNQtNrhgwzmmsKTuB9tMLaJcdxGNfW8l7f3HRLSAlqsUwX+5lYEGnR8oeZqIefRr6v95AmG2f/z5DEiKhKH//fWnJXgOrAj3ZCZDsGf8a2JbENYAUBQmJ8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcIS4jzK+WkYEJtKly0ytEBxKtxvjpvYfRp8xUYwI5iuAQFdUpuPUqdrlmiLWcQK12T6fI4s6sJ/rz0nHuM9OBqiUbI6i8ZT3KRwkrb+kvg7yhahUoRGrs9zIyKe/1D2QVE3koeACcGYKlBzXy8xi2tz8wMNTaia4FWXTSekaK2ya8mXL3wNcJd0ODFch1Vp3yVWlUGKKvFZmCcpOqfpV3pyVB1g54AoyV0MCtp+703+1uctNRwO9CWU+uGdFKUA6pEHWSdlx4FVynW0iXjk2auV8z0TQdpmATL7I3C3inn1spiZz7qzOUEE0GQdF8AsCYuoQZJyLmY8fNdMjBU5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zy+sRm7f7bg6N49i7EYVBkY4uR4fCbeK+auPx9SF2k=;
 b=XqEJsnTzZFatakDq/cklcmKbglLINUqWp3+29oRD/6xVsEooQZMMUSUxTt0+I7gfmogrGfFxf6gv7QpG5QE1hmf649cYNTDI+mJ+i0nCc039rCK2DY/CZ3b1ADsbSM8Y+VnHBla33dBlGfZ4hg/pAco1anpx6qwedbgYfAQOEOWc1Hg1Epf00E3Ut9GXaPx5gzvG7InZlQCmg0cyBZCDgg4oRU+tHq+zcazbsR6/9AzGPz/O9U3F285QY6a09bwYcEa2gOeBPBYlsjfm4dsYt6MZCSGrvmosn6cJyglgJqAvMEetG6HbL5iMc4ulAqNZC+6QnKZGnKNNwy9MG6NSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zy+sRm7f7bg6N49i7EYVBkY4uR4fCbeK+auPx9SF2k=;
 b=lt0j4+PDKieOA7IQPCvwExTDfXlvcNU6aigbGbztFWVI6/hnnLhxrNQtNrhgwzmmsKTuB9tMLaJcdxGNfW8l7f3HRLSAlqsUwX+5lYEGnR8oeZqIefRr6v95AmG2f/z5DEiKhKH//fWnJXgOrAj3ZCZDsGf8a2JbENYAUBQmJ8k=
From: Wei Chen <Wei.Chen@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index: AdgpQxtXwh7LkfydTgiYk9bhMgU+og==
Date: Thu, 24 Feb 2022 06:01:40 +0000
Message-ID:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BCEB5F1DC7DA0B43BCF65CB127519D1D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 365374da-553d-40b2-9f80-08d9f75b25b3
x-ms-traffictypediagnostic:
	PR2PR08MB4844:EE_|VE1EUR03FT020:EE_|DB9PR08MB7220:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7220F4288084469E21D4EF349E3D9@DB9PR08MB7220.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aCl9Fd7kIKAUJJy/MC4M1Y1ZiiXXczxmmQ61d5fNjpohRgHwJShRrhKuHrzwjkIzS3WpgkNR5BWQwb+JzUaaLpAkjbKfkNc6fIbn6ODkvTZdLU9YSY6dHjMXdsVgBquJniQ/BGJm88kl/1Bkup8gYgCAm/kX6Rof1CYew3o3qEpKann87ZzD0VQW8uT46DEwfQ1UVGMx7mfGL0/9j42Ea6AgWA9c95JYqHszXBBdaBFkqdItAuVwxgHPCBV+v/5BQ5jhcUpA1KFkuPmrnTPR/k/1MYxqeKUBM2qcOPpg6ilHpD6SvaIkecq3ooxhEJoxgMbuyhblfnvAt0MyQG9vR8Qwt2QN6vzALr11jEW1L4LftAi8oUkoiQgWn/jlBZg7SxLq/FkhVqBGh6veA1wVLlzZBVQ7JpHpxp8fbYYqiJyUr6Ex7EH9NiQN8dM9j6HTTSuuPtPbjHO6i5HDomljuxGJNrSKfCRSITDKW/SZR7TsFNZFfIK3hVosrBYWuMH3svP0wOknaUHst4UK6PW1+iIZVTvh+cOD13OEBQO+2oSz3G+4NkeZ1diYVI/cCI+qOxvH1Scxqa6FxsLpHTL0MU+FVZ5hF/xaWaStry6b14S3A5wKhXvzq8BA2UA7/2TJTLQeOJDOY9s6uQzMfQnb3wR+wHeXNWQSNd0sUCFo9Mza4lEkqoRRrzGCrQGJRGC0k+jMVlxcIFan5RAWZN25KuP3PDFkzz7IQEAp5wEaMmZfQmGBCdF4V/1Jl7qGznEY2EgzpJhrQBgz62JykjO/eR95f8TBG3ef5UbREH7cDBtB1fHPuA7vFMd9BhrdG4PsiEt140lvSUks4tiym35vAQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(26005)(9686003)(186003)(38070700005)(76116006)(66946007)(8676002)(33656002)(66446008)(66476007)(66556008)(64756008)(55016003)(71200400001)(38100700002)(122000001)(4326008)(7696005)(508600001)(6506007)(52536014)(8936002)(5660300002)(2906002)(83380400001)(110136005)(54906003)(86362001)(30864003)(559001)(579004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4844
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	799ad695-0f50-4291-7c6b-08d9f75b2075
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CQ3yQrfdHU2DUV7o4Tge2IsoMT9EkhBVlXz7G1s05xiL47X59xW4Whn0JdHln4Pu/SPbuZlNp0Y5jCxagG0PnjM+JHSZB1nGPHljt89HB2O15Km6EwHgc+RnUcoIly8vp+N7AE24sjAClKV7AUgXRQEnsu7G1LlERW4OaS8WJPt4/NZgzzLAf62FS5Y3ugbRv28mFEQd/vf/j0REBAQRhN1vytDTh9oP3PEd8f7oGsDxR+vq4h+fDbEfrcSqi3XspFwcBWwJxuZKrsA0ZiC620lYFQnMtfD2DJTNtQw3Bv2go8Eaxkin2BNSR3KvF6dMrafu1mW7XhC6xfPOsT9dqphotHIqEmESZP3wtqoCjCnto1rKoonKfhP3D9aqVSk11eebLYL20WYuQDa7qlz48AcsDgM/Gjfz16dZsP1ubClprG9BnVLAmLVN5zCcFjoI1R13RF9Xup8njTtbXkL5iC+yVFuJ+PIgtgVxsDgKpoVHHz97vOhvWXswn5Ekz1N7pxAvYmTjYHoH6fW959qCNK/1YGKSzXmPzju4AMMP/ohHH6k9zt89vjXLq/gf5z3CLKGIpVUO6pWHCrajyqrPyA7gCkiw+VzLYxBkVxUsNeKjWYoOcVvm6AGudAQkXHlDQvSDEObEDSUfudu5eg/JygNqgv7VY8HW4gw7Jm1toaKNRkbKNDLWFD+t5yD3yiBDoBN1nDw7fAION+fAQVTaepoOzRq448NQaS9pRB9KZcjlybT/8KSfKIXeCs/JgEclI5sSxfPVN/24Owa2nCA76glCZZvShbDt2T+K7pmQsI0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(33656002)(9686003)(47076005)(55016003)(83380400001)(6506007)(82310400004)(7696005)(508600001)(40460700003)(356005)(70586007)(81166007)(8936002)(54906003)(52536014)(2906002)(316002)(70206006)(8676002)(110136005)(30864003)(5660300002)(86362001)(336012)(186003)(4326008)(26005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 06:01:49.4843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 365374da-553d-40b2-9f80-08d9f75b25b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7220

# Proposal for Porting Xen to Armv8-R64

This proposal will introduce the PoC work of porting Xen to Armv8-R64,
which includes:
- The changes of current Xen capability, like Xen build system, memory
  management, domain management, vCPU context switch.
- The expanded Xen capability, like static-allocation and direct-map.

***Notes:***
1. ***This proposal only covers the work of porting Xen to Armv8-R64***
   ***single CPU. Xen SMP support on Armv8-R64 relates to Armv8-R***
   ***Trusted-Frimware (TF-R). This is an external dependency,***
   ***so we think the discussion of Xen SMP support on Armv8-R64***
   ***should be started when single-CPU support is complete.***
2. ***This proposal will not touch xen-tools. In current stage,***
   ***Xen on Armv8-R64 only support dom0less, all guests should***
   ***be booted from device tree.***

## 1. Essential Background

### 1.1. Armv8-R64 Profile
The Armv-R architecture profile was designed to support use cases that
have a high sensitivity to deterministic execution. (e.g. Fuel Injection,
Brake control, Drive trains, Motor control etc)

Arm announced Armv8-R in 2013, it is the latest generation Arm architecture
targeted at the Real-time profile. It introduces virtualization at the high=
est
security level while retaining the Protected Memory System Architecture (PM=
SA)
based on a Memory Protection Unit (MPU). In 2020, Arm announced Cortex-R82,
which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.

- The latest Armv8-R64 document can be found here:
  [Arm Architecture Reference Manual Supplement - Armv8, for Armv8-R AArch6=
4 architecture profile](https://developer.arm.com/documentation/ddi0600/lat=
est/).

- Armv-R Architecture progression:
  Armv7-R -> Armv8-R AArch32 -> Armv8 AArch64
  The following figure is a simple comparison of "R" processors based on
  different Armv-R Architectures.
  ![image](https://drive.google.com/uc?export=3Dview&id=3D1nE5RAXaX8zY2KPZ8=
imBpbvIr2eqBguEB)

- The Armv8-R architecture evolved additional features on top of Armv7-R:
    - An exception model that is compatible with the Armv8-A model
    - Virtualization with support for guest operating systems
        - PMSA virtualization using MPUs In EL2.
- The new features of Armv8-R64 architecture
    - Adds support for the 64-bit A64 instruction set, previously Armv8-R
      only supported A32.
    - Supports up to 48-bit physical addressing, previously up to 32-bit
      addressing was supported.
    - Optional Arm Neon technology and Advanced SIMD
    - Supports three Exception Levels (ELs)
        - Secure EL2 - The Highest Privilege, MPU only, for firmware, hyper=
visor
        - Secure EL1 - RichOS (MMU) or RTOS (MPU)
        - Secure EL0 - Application Workloads
    - Optionally supports Virtual Memory System Architecture at S-EL1/S-EL0=
.
      This means it's possible to run rich OS kernels - like Linux - either
      bare-metal or as a guest.
- Differences with the Armv8-A AArch64 architecture
    - Supports only a single Security state - Secure. There is not Non-Secu=
re
      execution state supported.
    - EL3 is not supported, EL2 is mandatory. This means secure EL2 is the
      highest EL.
    - Supports the A64 ISA instruction
        - With a small set of well-defined differences
    - Provides a PMSA (Protected Memory System Architecture) based
      virtualization model.
        - As opposed to Armv8-A AArch64's VMSA based Virtualization
        - Can support address bits up to 52 if FEAT_LPA is enabled,
          otherwise 48 bits.
        - Determines the access permissions and memory attributes of
          the target PA.
        - Can implement PMSAv8-64 at EL1 and EL2
            - Address translation flat-maps the VA to the PA for EL2 Stage =
1.
            - Address translation flat-maps the VA to the PA for EL1 Stage =
1.
            - Address translation flat-maps the IPA to the PA for EL1 Stage=
 2.
    - PMSA in EL1 & EL2 is configurable, VMSA in EL1 is configurable.

### 1.2. Xen Challenges with PMSA Virtualization
Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to run
with an MPU and host multiple guest OSes.

- No MMU at EL2:
    - No EL2 Stage 1 address translation
        - Xen provides fixed ARM64 virtual memory layout as basis of EL2
          stage 1 address translation, which is not applicable on MPU syste=
m,
          where there is no virtual addressing. As a result, any operation
          involving transition from PA to VA, like ioremap, needs modificat=
ion
          on MPU system.
    - Xen's run-time addresses are the same as the link time addresses.
        - Enable PIC (position-independent code) on a real-time target
          processor probably very rare.
    - Xen will need to use the EL2 MPU memory region descriptors to manage
      access permissions and attributes for accesses made by VMs at EL1/0.
        - Xen currently relies on MMU EL1 stage 2 table to manage these
          accesses.
- No MMU Stage 2 translation at EL1:
    - A guest doesn't have an independent guest physical address space
    - A guest can not reuse the current Intermediate Physical Address
      memory layout
    - A guest uses physical addresses to access memory and devices
    - The MPU at EL2 manages EL1 stage 2 access permissions and attributes
- There are a limited number of MPU protection regions at both EL2 and EL1:
    - Architecturally, the maximum number of protection regions is 256,
      typical implementations have 32.
    - By contrast, Xen does not need to consider the number of page table
      entries in theory when using MMU.
- The MPU protection regions at EL2 need to be shared between the hyperviso=
r
  and the guest stage 2.
    - Requires careful consideration - may impact feature 'fullness' of bot=
h
      the hypervisor and the guest
    - By contrast, when using MMU, Xen has standalone P2M table for guest
      stage 2 accesses.

## 2. Proposed changes of Xen
### **2.1. Changes of build system:**

- ***Introduce new Kconfig options for Armv8-R64***:
  Unlike Armv8-A, because lack of MMU support on Armv8-R64, we may not
  expect one Xen binary to run on all machines. Xen images are not common
  across Armv8-R64 platforms. Xen must be re-built for different Armv8-R64
  platforms. Because these platforms may have different memory layout and
  link address.
    - `ARM64_V8R`:
      This option enables Armv8-R profile for Arm64. Enabling this option
      results in selecting MPU. This Kconfig option is used to gate some
      Armv8-R64 specific code except MPU code, like some code for Armv8-R64
      only system ID registers access.

    - `ARM_MPU`
      This option enables MPU on ARMv8-R architecture. Enabling this option
      results in disabling MMU. This Kconfig option is used to gate some
      ARM_MPU specific code. Once when this Kconfig option has been enabled=
,
      the MMU relate code will not be built for Armv8-R64. The reason why
      not depends on runtime detection to select MMU or MPU is that, we don=
't
      think we can use one image for both Armv8-R64 and Armv8-A64. Another
      reason that we separate MPU and V8R in provision to allow to support =
MPU
      on 32bit Arm one day.

    - `XEN_START_ADDRESS`
      This option allows to set the custom address at which Xen will be
      linked. This address must be aligned to a page size. Xen's run-time
      addresses are the same as the link time addresses. Different platform=
s
      may have differnt memory layout. This Kconfig option provides users
      the ability to select proper link addresses for their boards.
      ***Notes: Fixed link address means the Xen binary could not be***
      ***relocated by EFI loader. So in current stage, Xen could not***
      ***be launched as an EFI application on Armv8-R64.***

    - `ARM_MPU_NORMAL_MEMORY_START` and `ARM_MPU_NORMAL_MEMORY_END`
      `ARM_MPU_DEVICE_MEMORY_START` and `ARM_MPU_DEVICE_MEMORY_END`
      These Kconfig options allow to set memory regions for Xen code, data
      and device memory. Before parsing memory information from device tree=
,
      Xen will use the values that stored in these options to setup boot-ti=
me
      MPU configuration. Why we need a boot-time MPU configuration?
      1. More deterministic: Arm MPU supports background regions,
         if we don't configure the MPU regions and don't enable MPU.
         We can enable MPU background regions. But that means all RAM
         is RWX. Random values in RAM or maliciously embedded data can
         be exploited. Using these Kconfig options allow users to have
         a deterministic RAM area to execute code.
      2. More compatible: On some Armv8-R64 platforms, if the MPU is
         disabled, the `dc zva` instruction will make the system halt.
         And this instruction will be embedded in some built-in functions,
         like `memory set`. If we use `-ddont_use_dc` to rebuild GCC,
         the built-in functions will not contain `dc zva`. However, it is
         obviously unlikely that we will be able to recompile all GCC
         for ARMv8-R64.
      3. One optional idea:
          We can map `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` or
          `XEN_START_ADDRESS` to `XEN_START_ADDRESS + image_end` for
          MPU normal memory. It's enough to support Xen run in boot time.

- ***Define new system registers for compilers***:
  Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
  specific system registers. As Armv8-R64 only have secure state, so
  at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And the
  first GCC version that supports Armv8.4 is GCC 8.1. In addition to
  these, PMSA of Armv8-R64 introduced lots of MPU related system registers:
  `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx` and
  `MPUIR_ELx`. But the first GCC version to support these system registers
  is GCC 11. So we have two ways to make compilers to work properly with
  these system registers.
  1. Bump GCC version to GCC 11.
     The pros of this method is that, we don't need to encode these
     system registers in macros by ourselves. But the cons are that,
     we have to update Makefiles to support GCC 11 for Armv8-R64.
     1.1. Check the GCC version 11 for Armv8-R64.
     1.2. Add march=3Darmv8r to CFLAGS for Armv8-R64.
     1.3. Solve the confliction of march=3Darmv8r and mcpu=3Dgeneric
    These changes will affect common Makefiles, not only Arm Makefiles.
    And GCC 11 is new, lots of toolchains and Distro haven't supported it.

  2. Encode new system registers in macros ***(preferred)***
        ```
        /* Virtualization Secure Translation Control Register */
        #define VSTCR_EL2  S3_4_C2_C6_2
        /* Virtualization System Control Register */
        #define VSCTLR_EL2 S3_4_C2_C0_0
        /* EL1 MPU Protection Region Base Address Register encode */
        #define PRBAR_EL1  S3_0_C6_C8_0
        ...
        /* EL2 MPU Protection Region Base Address Register encode */
        #define PRBAR_EL2  S3_4_C6_C8_0
        ...
        ```
     If we encode all above system registers, we don't need to bump GCC
     version. And the common CFLAGS Xen is using still can be applied to
     Armv8-R64. We don't need to modify Makefiles to add specific CFLAGS.

### **2.2. Changes of the initialization process**
In general, we still expect Armv8-R64 and Armv8-A64 to have a consistent
initialization process. In addition to some architecture differences, there
is no more than reusable code that we will distinguish through CONFIG_ARM_M=
PU
or CONFIG_ARM64_V8R. We want most of the initialization code to be reusable
between Armv8-R64 and Armv8-A64.

- We will reuse the original head.s and setup.c of Arm. But replace the
  MMU and page table operations in these files with configuration operation=
s
  for MPU and MPU regions.

- We provide a boot-time MPU configuration. This MPU configuration will
  support Xen to finish its initialization. And this boot-time MPU
  configuration will record the memory regions that will be parsed from
  device tree.

  In the end of Xen initialization, we will use a runtime MPU configuration
  to replace boot-time MPU configuration. The runtime MPU configuration wil=
l
  merge and reorder memory regions to save more MPU regions for guests.
  ![img](https://drive.google.com/uc?export=3Dview&id=3D1wTFyK2XfU3lTlH1PqR=
DoacQVTwUtWIGU)

- Defer system unpausing domain.
  When Xen initialization is about to end, Xen unpause guests created
  during initialization. But this will cause some issues. The unpause
  action occurs before free_init_memory, however the runtime MPU configurat=
ion
  is built after free_init_memory.

  So if the unpaused guests start executing the context switch at this
  point, then its MPU context will base on the boot-time MPU configuration.
  Probably it will be inconsistent with runtime MPU configuration, this
  will cause unexpected problems (This may not happen in a single core
  system, but on SMP systems, this problem is foreseeable, so we hope to
  solve it at the beginning).

### **2.3. Changes to reduce memory fragmentation**

In general, memory in Xen system can be classified to 4 classes:
`image sections`, `heap sections`, `guest RAM`, `boot modules (guest Kernel=
,
initrd and dtb)`

Currently, Xen doesn't have any restriction for users how to allocate
memory for different classes. That means users can place boot modules
anywhere, can reserve Xen heap memory anywhere and can allocate guest
memory anywhere.

In a VMSA system, this would not be too much of a problem, since the
MMU can manage memory at a granularity of 4KB after all. But in a
PMSA system, this will be a big problem. On Armv8-R64, the max MPU
protection regions number has been limited to 256. But in typical
processor implementations, few processors will design more than 32
MPU protection regions. Add in the fact that Xen shares MPU protection
regions with guest's EL1 Stage 2. It becomes even more important
to properly plan the use of MPU protection regions.

- An ideal of memory usage layout restriction:
![img](https://drive.google.com/uc?export=3Dview&id=3D1kirOL0Tx2aAypTtd3kXA=
td75XtrngcnW)
1. Reserve proper MPU regions for Xen image (code, rodata and data + bss).
2. Reserve one MPU region for boot modules.
   That means the placement of all boot modules, include guest kernel,
   initrd and dtb, will be limited to this MPU region protected area.
3. Reserve one or more MPU regions for Xen heap.
   On Armv8-R64, the guest memory is predefined in device tree, it will
   not be allocated from heap. Unlike Armv8-A64, we will not move all
   free memory to heap. We want Xen heap is dertermistic too, so Xen on
   Armv8-R64 also rely on Xen static heap feature. The memory for Xen
   heap will be defined in tree too. Considering that physical memory
   can also be discontinuous, one or more MPU protection regions needs
   to be reserved for Xen HEAP.
4. If we name above used MPU protection regions PART_A, and name left
   MPU protection regions PART_B:
   4.1. In hypervisor context, Xen will map left RAM and devices to PART_B.
        This will give Xen the ability to access whole memory.
   4.2. In guest context, Xen will create EL1 stage 2 mapping in PART_B.
        In this case, Xen just need to update PART_B in context switch,
        but keep PART_A as fixed.

***Notes: Static allocation will be mandatory on MPU based systems***

**A sample device tree of memory layout restriction**:
```
chosen {
    ...
    /*
     * Define a section to place boot modules,
     * all boot modules must be placed in this section.
     */
    mpu,boot-module-section =3D <0x10000000 0x10000000>;
    /*
     * Define a section to cover all guest RAM. All guest RAM must be locat=
ed
     * within this section. The pros is that, in best case, we can only hav=
e
     * one MPU protection region to map all guest RAM for Xen.
     */
    mpu,guest-memory-section =3D <0x20000000 0x30000000>;
    /*
     * Define a memory section that can cover all device memory that
     * will be used in Xen.
     */
    mpu,device-memory-section =3D <0x80000000 0x7ffff000>;
    /* Define a section for Xen heap */
    xen,static-mem =3D <0x50000000 0x20000000>;

    domU1 {
        ...
        #xen,static-mem-address-cells =3D <0x01>;
        #xen,static-mem-size-cells =3D <0x01>;
        /* Statically allocated guest memory, within mpu,guest-memory-secti=
on */
        xen,static-mem =3D <0x30000000 0x1f000000>;

        module@11000000 {
            compatible =3D "multiboot,kernel\0multiboot,module";
            /* Boot module address, within mpu,boot-module-section */
            reg =3D <0x11000000 0x3000000>;
            ...
        };

        module@10FF0000 {
                compatible =3D "multiboot,device-tree\0multiboot,module";
                /* Boot module address, within mpu,boot-module-section */
                reg =3D <0x10ff0000 0x10000>;
                ...
        };
    };
};
```

### **2.4. Changes of memory management**
Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we have to
decouple Xen from VMSA. And give Xen the ability to manage memory in PMSA.

1. ***Use buddy allocator to manage physical pages for PMSA***
   From the view of physical page, PMSA and VMSA don't have any difference.
   So we can reuse buddy allocator on Armv8-R64 to manage physical pages.
   The difference is that, in VMSA, Xen will map allocated pages to virtual
   addresses. But in PMSA, Xen just convert the pages to physical address.

2. ***Can not use virtual address for memory management***
   As Armv8-R64 only has PMSA in EL2, Xen loses the ability of using virtua=
l
   address to manage memory. This brings some problems, some virtual addres=
s
   based features could not work well on Armv8-R64, like `FIXMAP`, `vmap/vu=
map`,
   `ioremap` and `alternative`.

   But the functions or macros of these features are used in lots of common
   code. So it's not good to use `#ifdef CONFIG_ARM_MPU` to gate relate cod=
e
   everywhere. In this case, we propose to use stub helpers to make the cha=
nges
   transparently to common code.
   1. For `FIXMAP`, we will use `0` in `FIXMAP_ADDR` for all fixmap operati=
ons.
      This will return physical address directly of fixmapped item.
   2. For `vmap/vumap`, we will use some empty inline stub helpers:
        ```
        static inline void vm_init_type(...) {}
        static inline void *__vmap(...)
        {
            return NULL;
        }
        static inline void vunmap(const void *va) {}
        static inline void *vmalloc(size_t size)
        {
            return NULL;
        }
        static inline void *vmalloc_xen(size_t size)
        {
            return NULL;
        }
        static inline void vfree(void *va) {}
        ```

   3. For `ioremap`, it depends on `vmap`. As we have make `vmap` to always
      return `NULL`, they could not work well on Armv8-R64 without changes.
      `ioremap` will return input address directly.
        ```
        static inline void *ioremap_attr(...)
        {
            /* We don't have the ability to change input PA cache attribute=
s */
            if ( CACHE_ATTR_need_change )
                return NULL;
            return (void *)pa;
        }
        static inline void __iomem *ioremap_nocache(...)
        {
            return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
        }
        static inline void __iomem *ioremap_cache(...)
        {
            return ioremap_attr(start, len, PAGE_HYPERVISOR);
        }
        static inline void __iomem *ioremap_wc(...)
        {
            return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
        }
        void *ioremap(...)
        {
            return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
        }

        ```
    4. For `alternative`, it depends on `vmap` too. We will simply disable
       it on Armv8-R64 in current stage. How to implement `alternative`
       on Armv8-R64 is better to be discussed after basic functions of Xen
       on Armv8-R64 work well.
       But simply disable `alternative` will make `cpus_have_const_cap` alw=
ays
       return false.
        ```
        * System capability check for constant cap */
        #define cpus_have_const_cap(num) ({                \
               register_t __ret;                           \
                                                           \
               asm volatile (ALTERNATIVE("mov %0, #0",     \
                                         "mov %0, #1",     \
                                         num)              \
                             : "=3Dr" (__ret));              \
                                                           \
                unlikely(__ret);                           \
                })
        ```
        So, before we have an PMSA `alternative` implementation, we have to
        implement a separate `cpus_have_const_cap` for Armv8-R64:
        ```
        #define cpus_have_const_cap(num) cpus_have_cap(num)
        ```

### **2.5. Changes of guest management**
Armv8-R64 only supports PMSA in EL2, but it supports configurable
VMSA or PMSA in EL1. This means Xen will have a new type guest on
Armv8-R64 - MPU based guest.

1. **Add a new domain type - MPU_DOMAIN**
   When user want to create a guest that will be using MPU in EL1, user
   should add a `mpu` property in device tree `domU` node, like following
   example:
    ```
    domU2 {
        compatible =3D "xen,domain";
        direct-map;
        mpu; --> Indicates this domain will use PMSA in EL1.
        ...
    };
    ```
    Corresponding to `mpu` property in device tree, we also need to introdu=
ce
    a new flag `XEN_DOMCTL_CDF_INTERNAL_mpu` for domain to mark itself as a=
n
    MPU domain. This flag will be used in domain creation and domain doing
    vCPU context switch.
    1. Domain creation need this flag to decide enable PMSA or VMSA in EL1.
    2. vCPU context switch need this flag to decide save/restore MMU or MPU
       related registers.

2. **Add MPU registers to vCPU save EL1 MPU context**
   Current Xen only support MMU based guest, so it hasn't considered to
   save/restore MPU context. In this case, we need to add MPU registers
   to `arch_vcpu`:
    ```
    struct arch_vcpu
    {
    #ifdef CONFIG_ARM_MPU
        /* Virtualization Translation Control Register */
        register_t vtcr_el2;

        /* EL1 MPU regions' registers */
        pr_t mpu_regions[CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS];
    #endif
    }
    ```
    Armv8-R64 can support max to 256 MPU regions. But that's just theoretic=
al.
    So we don't want to define `pr_t mpu_regions[256]`, this is a memory wa=
ste
    in most of time. So we decided to let the user specify through a Kconfi=
g
    option. `CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS` default value can be `3=
2`,
    it's a typical implementation on Armv8-R64. Users will recompile Xen wh=
en
    their platform changes. So when the MPU changes, respecifying the MPU
    protection regions number will not cause additional problems.

3. **MPU based P2M table management**
   Armv8-R64 EL2 doesn't have EL1 stage 2 address translation. But through
   PMSA, it still has the ability to control the permissions and attributes
   of EL1 stage 2. In this case, we still hope to keep the interface
   consistent with MMU based P2M as far as possible.

   p2m->root will point to an allocated memory. In Armv8-A64, this memory
   is used to save the EL1 stage 2 translation table. But in Armv8-R64,
   this memory will be used to store EL2 MPU protection regions that are
   used by guest. During domain creation, Xen will prepare the data in
   this memory to make guest can access proper RAM and devices. When the
   guest's vCPU will be scheduled in, this data will be written to MPU
   protection region registers.

### **2.6. Changes of exception trap**
As Armv8-R64 has compatible exception mode with Armv8-A64, so we can reuse =
most
of Armv8-A64's exception trap & handler code. But except the trap based on =
EL1
stage 2 translation abort.

In Armv8-A64, we use `FSC_FLT_TRANS`
```
    case FSC_FLT_TRANS:
        ...
        if ( is_data )
        {
            enum io_state state =3D try_handle_mmio(regs, hsr, gpa);
            ...
        }
```
But for Armv8-R64, we have to use `FSC_FLT_PERM`
```
    case FSC_FLT_PERM:
        ...
        if ( is_data )
        {
            enum io_state state =3D try_handle_mmio(regs, hsr, gpa);
            ...
        }
```

### **2.5. Changes of device driver**
1. Because Armv8-R64 only has single secure state, this will affect some
devices that have two secure state, like GIC. But fortunately, most
vendors will not link a two secure state GIC to Armv8-R64 processors.
Current GIC driver can work well with single secure state GIC for Armv8-R64=
.
2. Xen should use secure hypervisor timer in Secure EL2. We will introduce
a CONFIG_ARM_SECURE_STATE to make Xen to use secure registers for timer.=20

### **2.7. Changes of virtual device**
Currently, we only support pass-through devices in guest. Because event
channel, xen-bus, xen-storage and other advanced Xen features haven't been
enabled in Armv8-R64.

--
Cheers,
Wei Chen


