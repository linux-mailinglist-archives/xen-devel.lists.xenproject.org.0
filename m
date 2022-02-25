Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03A4C42B9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 11:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278989.476490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNY9l-00022m-LF; Fri, 25 Feb 2022 10:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278989.476490; Fri, 25 Feb 2022 10:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNY9l-0001zv-Hn; Fri, 25 Feb 2022 10:49:01 +0000
Received: by outflank-mailman (input) for mailman id 278989;
 Fri, 25 Feb 2022 10:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i2jl=TI=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nNY9j-0001zW-IN
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 10:49:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86aab264-9628-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 11:48:54 +0100 (CET)
Received: from AM6P194CA0081.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::22)
 by AM0PR08MB2962.eurprd08.prod.outlook.com (2603:10a6:208:5b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 10:48:50 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::a) by AM6P194CA0081.outlook.office365.com
 (2603:10a6:209:8f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Fri, 25 Feb 2022 10:48:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 10:48:49 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 25 Feb 2022 10:48:44 +0000
Received: from b8990489366e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 369B4312-6644-4205-8442-74CC613892E0.1; 
 Fri, 25 Feb 2022 10:48:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8990489366e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Feb 2022 10:48:34 +0000
Received: from AS1PR08MB7426.eurprd08.prod.outlook.com (2603:10a6:20b:4c5::16)
 by AM5PR0802MB2531.eurprd08.prod.outlook.com (2603:10a6:203:a0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 10:48:32 +0000
Received: from AS1PR08MB7426.eurprd08.prod.outlook.com
 ([fe80::58e6:449c:825c:a0c2]) by AS1PR08MB7426.eurprd08.prod.outlook.com
 ([fe80::58e6:449c:825c:a0c2%4]) with mapi id 15.20.5017.024; Fri, 25 Feb 2022
 10:48:31 +0000
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
X-Inumbo-ID: 86aab264-9628-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nh6JR06Bqda3CnKAnNz0ViVr5NJPj3yCERFwbw1ukE=;
 b=5Z3anoGz963umb0svcdnL2liJEBoajUmKXz1FtPQLIwcThFkLoQLm8Ukm8eTa1bm66iXwvkKy3aWR8281rqg5Bnz3ZjfX70itnniCiSzWpEHQOxMXjKHU4WvoqRKx9QVMTM95jX+PImnlv6Gl/Hrd9cGj2CnTJ9UWdIUpc8pOOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ded7751f44731ea6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMteEZl0qJcvXnu7yktKMOvnU9ut4FCZgryFTbB6OG82xXonjNsGkJxlHb65JS//wJe4sGh9Hitj8guZ/c82ODeVOv8eDrnaDp0AkfkIONqBsHFSwFQ4b87n4K3gkyrr2vDA2hmJ+LXWNsoVXvCJ+rZW9UVhAyZs2AKdZC3IkYhr7cvx+8U8iaOMbsOqVIs0Va8ayLc9k7vT27L3Hra3pA4OdJrwWEc+/1NoPOo8uPPTC/1pDKDWyqNAxzN1iREHWMrQg7DLPHa3R6ixuMRWabpztWMSyXa/EpqMR25hJRGquhfE/8HLmFG2xGvEap2HrrCbQWoovjUMUqimaWeKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nh6JR06Bqda3CnKAnNz0ViVr5NJPj3yCERFwbw1ukE=;
 b=JmthvdErcoGvEuvRNrA0DSwe81FcJoluMZHS7aLqNYtE7Dzg9Er4/zGNske2y66v5I0LBpHgkZcikANdTVD5OIJ+4kIU4ABGwFpxXe/oS4Y6mU1wSmM2ZtYrGKvlKwHgIzRT2qn5c6itUjsbHjLV6PRRFU4hlEa7IeyA9I8pmz9csimxtQlF2CSSOShsMDihOyKWzIT554MUpXR2EjyaTDcba9ENKSkznMdP54fdp/xOkKAjAwnOu9Wt1+pTVTUv74d8lw+/TM03OzfKs5bfPF0cHZRPUq2tWN0yXFC8VDBd69stOa61wipKDcLOJSUOd9TsjsavJh+E9xAT+dItFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nh6JR06Bqda3CnKAnNz0ViVr5NJPj3yCERFwbw1ukE=;
 b=5Z3anoGz963umb0svcdnL2liJEBoajUmKXz1FtPQLIwcThFkLoQLm8Ukm8eTa1bm66iXwvkKy3aWR8281rqg5Bnz3ZjfX70itnniCiSzWpEHQOxMXjKHU4WvoqRKx9QVMTM95jX+PImnlv6Gl/Hrd9cGj2CnTJ9UWdIUpc8pOOk=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Henry Wang
	<Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index: AdgpQxtXwh7LkfydTgiYk9bhMgU+ogAn0mUAABEK2UA=
Date: Fri, 25 Feb 2022 10:48:30 +0000
Message-ID:
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 82679e38-e893-4318-190a-08d9f84c682f
x-ms-traffictypediagnostic:
	AM5PR0802MB2531:EE_|AM5EUR03FT037:EE_|AM0PR08MB2962:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB2962E73C7F303FDB641E136E9E3E9@AM0PR08MB2962.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9RmRITmpjdXV8SLVqmxZ2pKFAhh1tS/WgAvPlMmvYDHO9EiZCjhxs5iaxTj1yqepPxeSD2iR3BQtFGNUPU4XHa60z4a5qKRb1HNWmPkUlxYsMRTlTVx7gheaxSj2GE+mdcs8XQrXqyfi24k9ELRxevR2qsXMEJNqW57xbMibJuunktDmmrPyj3/6Z851KllYP0f+vvlM7x7GnrTEw4x4vYvP05fLTzXYDxBAdsYv3wVRbO45jfzfV7izcZyNPuNY3iy77toeR4ZLCrJHqzAeXM1ZLDy3W6Ra3IIWYPYaxHcqpEmawOF9wY2v7e4HHCvEMKiq44O7zRm9t0s7rE2uQgcafgBAh3cEfCUrZVS7ssQBOkZngosmA2s5eckuRTBQ/DlBdl49lp2KF87UzoCt60ULmfxtRvlsWX2eFhsY2GTbNS5V/tk2A7q9udxu7kW3PAZdayL95UA/d9/Jiyb6uesJQcUmQEVosadD9M72jwWVqpDKkZZmkIQ8n7QnvRzjwzjZ+05Tkiu0/bxwXFdfM5SSl6dxJOE+vS5L49cYcb3nGeiF8BhG8J1ddnrvsvNcSx7p4+hnVOzORP0pbXyhh/kIuJ3uyFBhZaWIkR6NR2gENS+W5hU+xjb2UnEeCVHnpuKD+XlTLC9wu7uxw7yywlbRc+Jsev28noaQgljNs8UAgCrPdC4N82wfcd1V51oCPnxTCGOg9Whom9p/sCn1ppz0Hflm7ByRiKO6IOiwhdjUbLufWMFFiu+XVNykD7tF6GP0BGSb8oD1XmDk2q0xgLqo8b5r+g9yFGwEj1+uOrIufLItWTcEgzIizHagV6O1p6Bp9vnyvqWCv7GCA/PNPg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR08MB7426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(8676002)(66476007)(38100700002)(66556008)(66446008)(4326008)(38070700005)(33656002)(2906002)(71200400001)(6916009)(91956017)(122000001)(76116006)(64756008)(53546011)(166002)(7696005)(6506007)(508600001)(316002)(9686003)(186003)(30864003)(5660300002)(55016003)(83380400001)(8936002)(52536014)(54906003)(86362001)(559001)(579004);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS1PR08MB74269923288B75097392BDD99E3E9AS1PR08MB7426eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2531
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc2a3e16-95d3-46b7-bd4c-08d9f84c5d2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t4ZtLXqiwztVjCiUJ5bJT2ZiGO+msbKK/3AM3APpdPPBSVCE087z7hmDoOKlDeK4QPb+sF8uijvdzgygJCudSnFJ7aJ4/J4H33ocrbI3KsWKfD5KDfJjCPKGaDIbm26YMFJOp1JG8nazuckW1nRzfojvAIrC2K13XpWOyDLsx4ctH+e64HV4MAftHA3REHXzY3F9Q8kPOUbq36vPlF2URRtXCn/9188v/GW6ZsMzjrq/I7jwdizzNqb4K7u3P339q/b5XZ021xUVQ3lLCJ9/vTmmJsB7WwKC5BEWOycaYYY/aWTQ6errRATCetWdBQYZlQnJ4Y7GbaJVDbEC1hgug8Qi6vH045BcxRT0owYdU9cwwHunDw9TrSOd2Aa/x1TgbnV8z2nwTFx7UPBOHuQKuOjnxU0Gaq/ovV/DmY1i7+a03s9aTuRWI+CiRU+duJNji0Ce/EoNNh2nQK/U0suARwfICo/XIbKGrl2u0u/+5p0aytqcliWouFI/bMzQqVLQ1nYVeluXyEDbz2BdoIvEP4I3NUvX4t87oZwAMw5dlV28UskBmg+Xs9wKWOW6ssWwNRvelqIVzPyLvWlwYZOT3nfhdVjygzWOfj6jxoYX9Inht+ChmLPJ15Ae6m2yL5GcAwHDtGBSvyJ6kQ7V+HngbJ2MS/DtRTuVcviPCfjMXojBEfr3v9KcV8yEAmISwPv4dKctoUuZuMEMQ5A62jMNK6A83pljZ5PgXXY0Vyli8OGFwiMcXuVQ7JzDWQafOWscpj2DtaY5h65ZItQ0+7c7ELaSuvzj17vHSq6XazcPN7g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(47076005)(40460700003)(53546011)(33656002)(6506007)(55016003)(508600001)(36860700001)(2906002)(9686003)(70586007)(5660300002)(70206006)(8936002)(54906003)(86362001)(8676002)(82310400004)(336012)(356005)(30864003)(166002)(81166007)(52536014)(316002)(4326008)(6862004)(26005)(186003)(83380400001)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 10:48:49.0631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82679e38-e893-4318-190a-08d9f84c682f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2962

--_000_AS1PR08MB74269923288B75097392BDD99E3E9AS1PR08MB7426eurp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: 2022=1B$BG/=1B(B2=1B$B7n=1B(B25=1B$BF|=1B(B 8:56
> To: Wei Chen <Wei.Chen@arm.com>
> Cc: xen-devel@lists.xenproject.org; julien@xen.org; Stefano Stabellini
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Penny Zheng <Penny.Zheng@arm.com>; Henry Wang <Henry.Wang@arm.com>; nd
> <nd@arm.com>
> Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
>
> Hi Wei,
>
> This is extremely exciting, thanks for the very nice summary!
>
>
> On Thu, 24 Feb 2022, Wei Chen wrote:
> > # Proposal for Porting Xen to Armv8-R64
> >
> > This proposal will introduce the PoC work of porting Xen to Armv8-R64,
> > which includes:
> > - The changes of current Xen capability, like Xen build system, memory
> >   management, domain management, vCPU context switch.
> > - The expanded Xen capability, like static-allocation and direct-map.
> >
> > ***Notes:***
> > 1. ***This proposal only covers the work of porting Xen to Armv8-R64***
> >    ***single CPU. Xen SMP support on Armv8-R64 relates to Armv8-R***
> >    ***Trusted-Frimware (TF-R). This is an external dependency,***
> >    ***so we think the discussion of Xen SMP support on Armv8-R64***
> >    ***should be started when single-CPU support is complete.***
> > 2. ***This proposal will not touch xen-tools. In current stage,***
> >    ***Xen on Armv8-R64 only support dom0less, all guests should***
> >    ***be booted from device tree.***
> >
> > ## 1. Essential Background
> >
> > ### 1.1. Armv8-R64 Profile
> > The Armv-R architecture profile was designed to support use cases that
> > have a high sensitivity to deterministic execution. (e.g. Fuel Injectio=
n,
> > Brake control, Drive trains, Motor control etc)
> >
> > Arm announced Armv8-R in 2013, it is the latest generation Arm
> architecture
> > targeted at the Real-time profile. It introduces virtualization at the
> highest
> > security level while retaining the Protected Memory System Architecture
> (PMSA)
> > based on a Memory Protection Unit (MPU). In 2020, Arm announced Cortex-
> R82,
> > which is the first Arm 64-bit Cortex-R processor based on Armv8-R64.
> >
> > - The latest Armv8-R64 document can be found here:
> >   [Arm Architecture Reference Manual Supplement - Armv8, for Armv8-R
> AArch64 architecture
> profile](https://developer.arm.com/documentation/ddi0600/latest/).
> >
> > - Armv-R Architecture progression:
> >   Armv7-R -> Armv8-R AArch32 -> Armv8 AArch64
> >   The following figure is a simple comparison of "R" processors based o=
n
> >   different Armv-R Architectures.
> >   ![image](https://drive.google.com/uc?export=3Dview&id=3D1nE5RAXaX8zY2=
KPZ8i
> mBpbvIr2eqBguEB)
> >
> > - The Armv8-R architecture evolved additional features on top of Armv7-=
R:
> >     - An exception model that is compatible with the Armv8-A model
> >     - Virtualization with support for guest operating systems
> >         - PMSA virtualization using MPUs In EL2.
> > - The new features of Armv8-R64 architecture
> >     - Adds support for the 64-bit A64 instruction set, previously Armv8=
-
> R
> >       only supported A32.
> >     - Supports up to 48-bit physical addressing, previously up to 32-bi=
t
> >       addressing was supported.
> >     - Optional Arm Neon technology and Advanced SIMD
> >     - Supports three Exception Levels (ELs)
> >         - Secure EL2 - The Highest Privilege, MPU only, for firmware,
> hypervisor
> >         - Secure EL1 - RichOS (MMU) or RTOS (MPU)
> >         - Secure EL0 - Application Workloads
> >     - Optionally supports Virtual Memory System Architecture at S-EL1/S=
-
> EL0.
> >       This means it's possible to run rich OS kernels - like Linux -
> either
> >       bare-metal or as a guest.
> > - Differences with the Armv8-A AArch64 architecture
> >     - Supports only a single Security state - Secure. There is not Non-
> Secure
> >       execution state supported.
> >     - EL3 is not supported, EL2 is mandatory. This means secure EL2 is
> the
> >       highest EL.
> >     - Supports the A64 ISA instruction
> >         - With a small set of well-defined differences
> >     - Provides a PMSA (Protected Memory System Architecture) based
> >       virtualization model.
> >         - As opposed to Armv8-A AArch64's VMSA based Virtualization
> >         - Can support address bits up to 52 if FEAT_LPA is enabled,
> >           otherwise 48 bits.
> >         - Determines the access permissions and memory attributes of
> >           the target PA.
> >         - Can implement PMSAv8-64 at EL1 and EL2
> >             - Address translation flat-maps the VA to the PA for EL2
> Stage 1.
> >             - Address translation flat-maps the VA to the PA for EL1
> Stage 1.
> >             - Address translation flat-maps the IPA to the PA for EL1
> Stage 2.
> >     - PMSA in EL1 & EL2 is configurable, VMSA in EL1 is configurable.
> >
> > ### 1.2. Xen Challenges with PMSA Virtualization
> > Xen is PMSA unaware Type-1 Hypervisor, it will need modifications to ru=
n
> > with an MPU and host multiple guest OSes.
> >
> > - No MMU at EL2:
> >     - No EL2 Stage 1 address translation
> >         - Xen provides fixed ARM64 virtual memory layout as basis of EL=
2
> >           stage 1 address translation, which is not applicable on MPU
> system,
> >           where there is no virtual addressing. As a result, any
> operation
> >           involving transition from PA to VA, like ioremap, needs
> modification
> >           on MPU system.
> >     - Xen's run-time addresses are the same as the link time addresses.
> >         - Enable PIC (position-independent code) on a real-time target
> >           processor probably very rare.
> >     - Xen will need to use the EL2 MPU memory region descriptors to
> manage
> >       access permissions and attributes for accesses made by VMs at
> EL1/0.
> >         - Xen currently relies on MMU EL1 stage 2 table to manage these
> >           accesses.
> > - No MMU Stage 2 translation at EL1:
> >     - A guest doesn't have an independent guest physical address space
> >     - A guest can not reuse the current Intermediate Physical Address
> >       memory layout
> >     - A guest uses physical addresses to access memory and devices
> >     - The MPU at EL2 manages EL1 stage 2 access permissions and
> attributes
> > - There are a limited number of MPU protection regions at both EL2 and
> EL1:
> >     - Architecturally, the maximum number of protection regions is 256,
> >       typical implementations have 32.
> >     - By contrast, Xen does not need to consider the number of page
> table
> >       entries in theory when using MMU.
> > - The MPU protection regions at EL2 need to be shared between the
> hypervisor
> >   and the guest stage 2.
> >     - Requires careful consideration - may impact feature 'fullness' of
> both
> >       the hypervisor and the guest
> >     - By contrast, when using MMU, Xen has standalone P2M table for
> guest
> >       stage 2 accesses.
> >
> > ## 2. Proposed changes of Xen
> > ### **2.1. Changes of build system:**
> >
> > - ***Introduce new Kconfig options for Armv8-R64***:
> >   Unlike Armv8-A, because lack of MMU support on Armv8-R64, we may not
> >   expect one Xen binary to run on all machines. Xen images are not
> common
> >   across Armv8-R64 platforms. Xen must be re-built for different Armv8-
> R64
> >   platforms. Because these platforms may have different memory layout
> and
> >   link address.
> >     - `ARM64_V8R`:
> >       This option enables Armv8-R profile for Arm64. Enabling this
> option
> >       results in selecting MPU. This Kconfig option is used to gate som=
e
> >       Armv8-R64 specific code except MPU code, like some code for Armv8=
-
> R64
> >       only system ID registers access.
> >
> >     - `ARM_MPU`
> >       This option enables MPU on ARMv8-R architecture. Enabling this
> option
> >       results in disabling MMU. This Kconfig option is used to gate som=
e
> >       ARM_MPU specific code. Once when this Kconfig option has been
> enabled,
> >       the MMU relate code will not be built for Armv8-R64. The reason
> why
> >       not depends on runtime detection to select MMU or MPU is that, we
> don't
> >       think we can use one image for both Armv8-R64 and Armv8-A64.
> Another
> >       reason that we separate MPU and V8R in provision to allow to
> support MPU
> >       on 32bit Arm one day.
> >
> >     - `XEN_START_ADDRESS`
> >       This option allows to set the custom address at which Xen will be
> >       linked. This address must be aligned to a page size. Xen's run-
> time
> >       addresses are the same as the link time addresses. Different
> platforms
> >       may have differnt memory layout. This Kconfig option provides
> users
> >       the ability to select proper link addresses for their boards.
> >       ***Notes: Fixed link address means the Xen binary could not be***
> >       ***relocated by EFI loader. So in current stage, Xen could not***
> >       ***be launched as an EFI application on Armv8-R64.***
> >
> >     - `ARM_MPU_NORMAL_MEMORY_START` and `ARM_MPU_NORMAL_MEMORY_END`
> >       `ARM_MPU_DEVICE_MEMORY_START` and `ARM_MPU_DEVICE_MEMORY_END`
> >       These Kconfig options allow to set memory regions for Xen code,
> data
> >       and device memory. Before parsing memory information from device
> tree,
> >       Xen will use the values that stored in these options to setup
> boot-time
> >       MPU configuration. Why we need a boot-time MPU configuration?
> >       1. More deterministic: Arm MPU supports background regions,
> >          if we don't configure the MPU regions and don't enable MPU.
> >          We can enable MPU background regions. But that means all RAM
> >          is RWX. Random values in RAM or maliciously embedded data can
> >          be exploited. Using these Kconfig options allow users to have
> >          a deterministic RAM area to execute code.
> >       2. More compatible: On some Armv8-R64 platforms, if the MPU is
> >          disabled, the `dc zva` instruction will make the system halt.
> >          And this instruction will be embedded in some built-in
> functions,
> >          like `memory set`. If we use `-ddont_use_dc` to rebuild GCC,
> >          the built-in functions will not contain `dc zva`. However, it
> is
> >          obviously unlikely that we will be able to recompile all GCC
> >          for ARMv8-R64.
> >       3. One optional idea:
> >           We can map `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` o=
r
> >           `XEN_START_ADDRESS` to `XEN_START_ADDRESS + image_end` for
> >           MPU normal memory. It's enough to support Xen run in boot tim=
e.
>
> I can imagine that we need to have a different Xen build for each
> ARMv8-R platform. Do you envision that XEN_START_ADDRESS and
> ARM_MPU_*_MEMORY_START/END are preconfigured based on the platform
> choice at build time? I don't think we want a user to provide all of
> those addresses by hand, right?

Yes, this is in our TODO list. We want to reuse current arm/platforms and
Kconfig menu for Armv8-R.

>
> The next question is whether we could automatically generate
> XEN_START_ADDRESS and ARM_MPU_*_MEMORY_START/END based on the platform
> device tree at build time (at build time, not runtime). That would
> make things a lot easier and it is also aligned with the way Zephyr and
> other RTOSes and baremetal apps work.

It's a considerable option. But here we may encounter some problems need
to be solved first:
1. Does CONFIG_DTB must be selected by default on Armv8-R? Without firmware
   or bootloader (like u-boot), we have to build DTB into Xen binary. This
   can guarantee build-time DTB is the same as runtime DTB. But eventually,
   we will have firmware and bootloader before Xen launch (as Arm EBBR's
   requirement). In this case, we may not build DTB into Xen image. And
   we can't guarantee build-time DTB is the same as runtime DTB.
2. If build-time DTB is the same as runtime DTB, how can we determine
   the XEN_START_ADDRESS in DTB describe memory range? Should we always
   limit Xen to boot from lowest address? Or will we introduce some new
   DT property to specify the Xen start address? I think this DT property
   also can solve above question#1.

>
> The device tree can be given as input to the build system, and the
> Makefiles would take care of generating XEN_START_ADDRESS and
> ARM_MPU_*_MEMORY_START/END based on /memory and other interesting nodes.
>

If we can solve above questions, yes, device tree is a good idea for
XEN_START_ADDRESS. For ARM_MPU_NORMAL_MEMORY_*, we can get them from
memory nodes, but for ARM_MPU_DEVICE_MEMORY_*, they are not easy for
us to scan all devices' nodes. And it's very tricky, if the memory
regions are interleaved. So in our current RFC code, we select to use
the optional idea:
We map `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` for MPU normal memo=
ry.
But we use mpu,device-memory-section in DT for MPU device memory.

>
> > - ***Define new system registers for compilers***:
> >   Armv8-R64 is based on Armv8.4. That means we will use some Armv8.4
> >   specific system registers. As Armv8-R64 only have secure state, so
> >   at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used for Xen. And the
> >   first GCC version that supports Armv8.4 is GCC 8.1. In addition to
> >   these, PMSA of Armv8-R64 introduced lots of MPU related system
> registers:
> >   `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`, `PRENR_ELx` and
> >   `MPUIR_ELx`. But the first GCC version to support these system
> registers
> >   is GCC 11. So we have two ways to make compilers to work properly wit=
h
> >   these system registers.
> >   1. Bump GCC version to GCC 11.
> >      The pros of this method is that, we don't need to encode these
> >      system registers in macros by ourselves. But the cons are that,
> >      we have to update Makefiles to support GCC 11 for Armv8-R64.
> >      1.1. Check the GCC version 11 for Armv8-R64.
> >      1.2. Add march=3Darmv8r to CFLAGS for Armv8-R64.
> >      1.3. Solve the confliction of march=3Darmv8r and mcpu=3Dgeneric
> >     These changes will affect common Makefiles, not only Arm Makefiles.
> >     And GCC 11 is new, lots of toolchains and Distro haven't supported
> it.
> >
> >   2. Encode new system registers in macros ***(preferred)***
> >         ```
> >         /* Virtualization Secure Translation Control Register */
> >         #define VSTCR_EL2  S3_4_C2_C6_2
> >         /* Virtualization System Control Register */
> >         #define VSCTLR_EL2 S3_4_C2_C0_0
> >         /* EL1 MPU Protection Region Base Address Register encode */
> >         #define PRBAR_EL1  S3_0_C6_C8_0
> >         ...
> >         /* EL2 MPU Protection Region Base Address Register encode */
> >         #define PRBAR_EL2  S3_4_C6_C8_0
> >         ...
> >         ```
> >      If we encode all above system registers, we don't need to bump GCC
> >      version. And the common CFLAGS Xen is using still can be applied t=
o
> >      Armv8-R64. We don't need to modify Makefiles to add specific CFLAG=
S.
>
> I think that's fine and we did something similar with the original ARMv7-=
A
> port if I remember correctly.
>
>
> > ### **2.2. Changes of the initialization process**
> > In general, we still expect Armv8-R64 and Armv8-A64 to have a consisten=
t
> > initialization process. In addition to some architecture differences,
> there
> > is no more than reusable code that we will distinguish through
> CONFIG_ARM_MPU
> > or CONFIG_ARM64_V8R. We want most of the initialization code to be
> reusable
> > between Armv8-R64 and Armv8-A64.
>
> +1
>
>
> > - We will reuse the original head.s and setup.c of Arm. But replace the
> >   MMU and page table operations in these files with configuration
> operations
> >   for MPU and MPU regions.
> >
> > - We provide a boot-time MPU configuration. This MPU configuration will
> >   support Xen to finish its initialization. And this boot-time MPU
> >   configuration will record the memory regions that will be parsed from
> >   device tree.
> >
> >   In the end of Xen initialization, we will use a runtime MPU
> configuration
> >   to replace boot-time MPU configuration. The runtime MPU configuration
> will
> >   merge and reorder memory regions to save more MPU regions for guests.
> >   ![img](https://drive.google.com/uc?export=3Dview&id=3D1wTFyK2XfU3lTlH=
1PqRD
> oacQVTwUtWIGU)
> >
> > - Defer system unpausing domain.
> >   When Xen initialization is about to end, Xen unpause guests created
> >   during initialization. But this will cause some issues. The unpause
> >   action occurs before free_init_memory, however the runtime MPU
> configuration
> >   is built after free_init_memory.
> >
> >   So if the unpaused guests start executing the context switch at this
> >   point, then its MPU context will base on the boot-time MPU
> configuration.
> >   Probably it will be inconsistent with runtime MPU configuration, this
> >   will cause unexpected problems (This may not happen in a single core
> >   system, but on SMP systems, this problem is foreseeable, so we hope t=
o
> >   solve it at the beginning).
> >
> > ### **2.3. Changes to reduce memory fragmentation**
> >
> > In general, memory in Xen system can be classified to 4 classes:
> > `image sections`, `heap sections`, `guest RAM`, `boot modules (guest
> Kernel,
> > initrd and dtb)`
> >
> > Currently, Xen doesn't have any restriction for users how to allocate
> > memory for different classes. That means users can place boot modules
> > anywhere, can reserve Xen heap memory anywhere and can allocate guest
> > memory anywhere.
> >
> > In a VMSA system, this would not be too much of a problem, since the
> > MMU can manage memory at a granularity of 4KB after all. But in a
> > PMSA system, this will be a big problem. On Armv8-R64, the max MPU
> > protection regions number has been limited to 256. But in typical
> > processor implementations, few processors will design more than 32
> > MPU protection regions. Add in the fact that Xen shares MPU protection
> > regions with guest's EL1 Stage 2. It becomes even more important
> > to properly plan the use of MPU protection regions.
> >
> > - An ideal of memory usage layout restriction:
> > ![img](https://drive.google.com/uc?export=3Dview&id=3D1kirOL0Tx2aAypTtd=
3kXAt
> d75XtrngcnW)
> > 1. Reserve proper MPU regions for Xen image (code, rodata and data +
> bss).
> > 2. Reserve one MPU region for boot modules.
> >    That means the placement of all boot modules, include guest kernel,
> >    initrd and dtb, will be limited to this MPU region protected area.
> > 3. Reserve one or more MPU regions for Xen heap.
> >    On Armv8-R64, the guest memory is predefined in device tree, it will
> >    not be allocated from heap. Unlike Armv8-A64, we will not move all
> >    free memory to heap. We want Xen heap is dertermistic too, so Xen on
> >    Armv8-R64 also rely on Xen static heap feature. The memory for Xen
> >    heap will be defined in tree too. Considering that physical memory
> >    can also be discontinuous, one or more MPU protection regions needs
> >    to be reserved for Xen HEAP.
> > 4. If we name above used MPU protection regions PART_A, and name left
> >    MPU protection regions PART_B:
> >    4.1. In hypervisor context, Xen will map left RAM and devices to
> PART_B.
> >         This will give Xen the ability to access whole memory.
> >    4.2. In guest context, Xen will create EL1 stage 2 mapping in PART_B=
.
> >         In this case, Xen just need to update PART_B in context switch,
> >         but keep PART_A as fixed.
>
> I think that the memory layout and restrictions that you wrote above
> make sense. I have some comments on the way they are represented in
> device tree, but that's different.
>
>
> > ***Notes: Static allocation will be mandatory on MPU based systems***
> >
> > **A sample device tree of memory layout restriction**:
> > ```
> > chosen {
> >     ...
> >     /*
> >      * Define a section to place boot modules,
> >      * all boot modules must be placed in this section.
> >      */
> >     mpu,boot-module-section =3D <0x10000000 0x10000000>;
> >     /*
> >      * Define a section to cover all guest RAM. All guest RAM must be
> located
> >      * within this section. The pros is that, in best case, we can only
> have
> >      * one MPU protection region to map all guest RAM for Xen.
> >      */
> >     mpu,guest-memory-section =3D <0x20000000 0x30000000>;
> >     /*
> >      * Define a memory section that can cover all device memory that
> >      * will be used in Xen.
> >      */
> >     mpu,device-memory-section =3D <0x80000000 0x7ffff000>;
> >     /* Define a section for Xen heap */
> >     xen,static-mem =3D <0x50000000 0x20000000>;
>
> As mentioned above, I understand the need for these sections, but why do
> we need to describe them in device tree at all? Could Xen select them by
> itself during boot?

I think without some inputs, Xen could not do this or will do it in some
assumption. For example, assume the first the boot-module-section determine=
d
by lowest address and highest address of all modules. And the same for
guest-memory-section, calculated from all guest allocated memory regions.


>
> If not, and considering that we have to generate
> ARM_MPU_*_MEMORY_START/END anyway at build time, would it make sense to
> also generate mpu,guest-memory-section, xen,static-mem, etc. at build
> time rather than passing it via device tree to Xen at runtime?
>

Did you mean we still add these information in device tree, but for build
time only. In runtime we don't parse them?

> What's the value of doing ARM_MPU_*_MEMORY_START/END at build time and
> everything else at runtime?

ARM_MPU_*_MEMORY_START/END is defined by platform. But other things are
users customized. They can change their usage without rebuild the image.

>
> It looks like we are forced to have the sections definitions at build
> time because we need them before we can parse device tree. In that case,
> we might as well define all the sections at build time.
>
> But I think it would be even better if Xen could automatically choose
> xen,static-mem, mpu,guest-memory-section, etc. on its own based on the
> regular device tree information (/memory, /amba, etc.), without any need
> for explicitly describing each range with these new properties.
>

for mpu,guest-memory-section, with the limitations: no other usage between
different guest' memory nodes, this is OK. But for xen,static-mem (heap),
we just want everything on a MPU system is dertermistic. But, of course Xen
can select left memory for heap without static-mem.

>
> >     domU1 {
> >         ...
> >         #xen,static-mem-address-cells =3D <0x01>;
> >         #xen,static-mem-size-cells =3D <0x01>;
> >         /* Statically allocated guest memory, within mpu,guest-memory-
> section */
> >         xen,static-mem =3D <0x30000000 0x1f000000>;
> >
> >         module@11000000 {
> >             compatible =3D "multiboot,kernel\0multiboot,module";
> >             /* Boot module address, within mpu,boot-module-section */
> >             reg =3D <0x11000000 0x3000000>;
> >             ...
> >         };
> >
> >         module@10FF0000 {
> >                 compatible =3D "multiboot,device-tree\0multiboot,module=
";
> >                 /* Boot module address, within mpu,boot-module-section
> */
> >                 reg =3D <0x10ff0000 0x10000>;
> >                 ...
> >         };
> >     };
> > };
> > ```
> >
> > ### **2.4. Changes of memory management**
> > Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we have to
> > decouple Xen from VMSA. And give Xen the ability to manage memory in
> PMSA.
> >
> > 1. ***Use buddy allocator to manage physical pages for PMSA***
> >    From the view of physical page, PMSA and VMSA don't have any
> difference.
> >    So we can reuse buddy allocator on Armv8-R64 to manage physical page=
s.
> >    The difference is that, in VMSA, Xen will map allocated pages to
> virtual
> >    addresses. But in PMSA, Xen just convert the pages to physical
> address.
> >
> > 2. ***Can not use virtual address for memory management***
> >    As Armv8-R64 only has PMSA in EL2, Xen loses the ability of using
> virtual
> >    address to manage memory. This brings some problems, some virtual
> address
> >    based features could not work well on Armv8-R64, like `FIXMAP`,
> `vmap/vumap`,
> >    `ioremap` and `alternative`.
> >
> >    But the functions or macros of these features are used in lots of
> common
> >    code. So it's not good to use `#ifdef CONFIG_ARM_MPU` to gate relate
> code
> >    everywhere. In this case, we propose to use stub helpers to make the
> changes
> >    transparently to common code.
> >    1. For `FIXMAP`, we will use `0` in `FIXMAP_ADDR` for all fixmap
> operations.
> >       This will return physical address directly of fixmapped item.
> >    2. For `vmap/vumap`, we will use some empty inline stub helpers:
> >         ```
> >         static inline void vm_init_type(...) {}
> >         static inline void *__vmap(...)
> >         {
> >             return NULL;
> >         }
> >         static inline void vunmap(const void *va) {}
> >         static inline void *vmalloc(size_t size)
> >         {
> >             return NULL;
> >         }
> >         static inline void *vmalloc_xen(size_t size)
> >         {
> >             return NULL;
> >         }
> >         static inline void vfree(void *va) {}
> >         ```
> >
> >    3. For `ioremap`, it depends on `vmap`. As we have make `vmap` to
> always
> >       return `NULL`, they could not work well on Armv8-R64 without
> changes.
> >       `ioremap` will return input address directly.
> >         ```
> >         static inline void *ioremap_attr(...)
> >         {
> >             /* We don't have the ability to change input PA cache
> attributes */
> >             if ( CACHE_ATTR_need_change )
> >                 return NULL;
> >             return (void *)pa;
> >         }
> >         static inline void __iomem *ioremap_nocache(...)
> >         {
> >             return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
> >         }
> >         static inline void __iomem *ioremap_cache(...)
> >         {
> >             return ioremap_attr(start, len, PAGE_HYPERVISOR);
> >         }
> >         static inline void __iomem *ioremap_wc(...)
> >         {
> >             return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
> >         }
> >         void *ioremap(...)
> >         {
> >             return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
> >         }
> >
> >         ```
> >     4. For `alternative`, it depends on `vmap` too. We will simply
> disable
> >        it on Armv8-R64 in current stage. How to implement `alternative`
> >        on Armv8-R64 is better to be discussed after basic functions of
> Xen
> >        on Armv8-R64 work well.
> >        But simply disable `alternative` will make `cpus_have_const_cap`
> always
> >        return false.
> >         ```
> >         * System capability check for constant cap */
> >         #define cpus_have_const_cap(num) ({                \
> >                register_t __ret;                           \
> >                                                            \
> >                asm volatile (ALTERNATIVE("mov %0, #0",     \
> >                                          "mov %0, #1",     \
> >                                          num)              \
> >                              : "=3Dr" (__ret));              \
> >                                                            \
> >                 unlikely(__ret);                           \
> >                 })
> >         ```
> >         So, before we have an PMSA `alternative` implementation, we hav=
e
> to
> >         implement a separate `cpus_have_const_cap` for Armv8-R64:
> >         ```
> >         #define cpus_have_const_cap(num) cpus_have_cap(num)
> >         ```
>
> I think it is OK to disable alternative
>
>
> > ### **2.5. Changes of guest management**
> > Armv8-R64 only supports PMSA in EL2, but it supports configurable
> > VMSA or PMSA in EL1. This means Xen will have a new type guest on
> > Armv8-R64 - MPU based guest.
> >
> > 1. **Add a new domain type - MPU_DOMAIN**
> >    When user want to create a guest that will be using MPU in EL1, user
> >    should add a `mpu` property in device tree `domU` node, like
> following
> >    example:
> >     ```
> >     domU2 {
> >         compatible =3D "xen,domain";
> >         direct-map;
> >         mpu; --> Indicates this domain will use PMSA in EL1.
> >         ...
> >     };
> >     ```
> >     Corresponding to `mpu` property in device tree, we also need to
> introduce
> >     a new flag `XEN_DOMCTL_CDF_INTERNAL_mpu` for domain to mark itself
> as an
> >     MPU domain. This flag will be used in domain creation and domain
> doing
> >     vCPU context switch.
> >     1. Domain creation need this flag to decide enable PMSA or VMSA in
> EL1.
> >     2. vCPU context switch need this flag to decide save/restore MMU or
> MPU
> >        related registers.
> >
> > 2. **Add MPU registers to vCPU save EL1 MPU context**
> >    Current Xen only support MMU based guest, so it hasn't considered to
> >    save/restore MPU context. In this case, we need to add MPU registers
> >    to `arch_vcpu`:
> >     ```
> >     struct arch_vcpu
> >     {
> >     #ifdef CONFIG_ARM_MPU
> >         /* Virtualization Translation Control Register */
> >         register_t vtcr_el2;
> >
> >         /* EL1 MPU regions' registers */
> >         pr_t mpu_regions[CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS];
> >     #endif
> >     }
> >     ```
> >     Armv8-R64 can support max to 256 MPU regions. But that's just
> theoretical.
> >     So we don't want to define `pr_t mpu_regions[256]`, this is a memor=
y
> waste
> >     in most of time. So we decided to let the user specify through a
> Kconfig
> >     option. `CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS` default value can b=
e
> `32`,
> >     it's a typical implementation on Armv8-R64. Users will recompile Xe=
n
> when
> >     their platform changes. So when the MPU changes, respecifying the
> MPU
> >     protection regions number will not cause additional problems.
>
> I wonder if we could probe the number of MPU regions at runtime and
> dynamically allocate the memory needed to store them in arch_vcpu.
>

We have considered to used a pr_t mpu_regions[0] in arch_vcpu. But it seems
we will encounter some static allocated arch_vcpu problems and sizeof issue=
.

>
> >
> > 3. **MPU based P2M table management**
> >    Armv8-R64 EL2 doesn't have EL1 stage 2 address translation. But
> through
> >    PMSA, it still has the ability to control the permissions and
> attributes
> >    of EL1 stage 2. In this case, we still hope to keep the interface
> >    consistent with MMU based P2M as far as possible.
> >
> >    p2m->root will point to an allocated memory. In Armv8-A64, this
> memory
> >    is used to save the EL1 stage 2 translation table. But in Armv8-R64,
> >    this memory will be used to store EL2 MPU protection regions that ar=
e
> >    used by guest. During domain creation, Xen will prepare the data in
> >    this memory to make guest can access proper RAM and devices. When th=
e
> >    guest's vCPU will be scheduled in, this data will be written to MPU
> >    protection region registers.
> >
> > ### **2.6. Changes of exception trap**
> > As Armv8-R64 has compatible exception mode with Armv8-A64, so we can
> reuse most
> > of Armv8-A64's exception trap & handler code. But except the trap based
> on EL1
> > stage 2 translation abort.
> >
> > In Armv8-A64, we use `FSC_FLT_TRANS`
> > ```
> >     case FSC_FLT_TRANS:
> >         ...
> >         if ( is_data )
> >         {
> >             enum io_state state =3D try_handle_mmio(regs, hsr, gpa);
> >             ...
> >         }
> > ```
> > But for Armv8-R64, we have to use `FSC_FLT_PERM`
> > ```
> >     case FSC_FLT_PERM:
> >         ...
> >         if ( is_data )
> >         {
> >             enum io_state state =3D try_handle_mmio(regs, hsr, gpa);
> >             ...
> >         }
> > ```
> >
> > ### **2.5. Changes of device driver**
> > 1. Because Armv8-R64 only has single secure state, this will affect som=
e
> > devices that have two secure state, like GIC. But fortunately, most
> > vendors will not link a two secure state GIC to Armv8-R64 processors.
> > Current GIC driver can work well with single secure state GIC for Armv8=
-
> R64.
> > 2. Xen should use secure hypervisor timer in Secure EL2. We will
> introduce
> > a CONFIG_ARM_SECURE_STATE to make Xen to use secure registers for timer=
.
> >
> > ### **2.7. Changes of virtual device**
> > Currently, we only support pass-through devices in guest. Because event
> > channel, xen-bus, xen-storage and other advanced Xen features haven't
> been
> > enabled in Armv8-R64.
>
> That's fine -- it is a great start! Looking forward to it!

--_000_AS1PR08MB74269923288B75097392BDD99E3E9AS1PR08MB7426eurp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
</head>
<body>
<div></div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hi Stefano,<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Stefano Stabellini &lt;sstabellini@kernel.org&gt;<br>
&gt; Sent: 2022=1B$BG/=1B(B2=1B$B7n=1B(B25=1B$BF|=1B(B 8:56<br>
&gt; To: Wei Chen &lt;Wei.Chen@arm.com&gt;<br>
&gt; Cc: xen-devel@lists.xenproject.org; julien@xen.org; Stefano Stabellini=
<br>
&gt; &lt;sstabellini@kernel.org&gt;; Bertrand Marquis &lt;Bertrand.Marquis@=
arm.com&gt;;<br>
&gt; Penny Zheng &lt;Penny.Zheng@arm.com&gt;; Henry Wang &lt;Henry.Wang@arm=
.com&gt;; nd<br>
&gt; &lt;nd@arm.com&gt;<br>
&gt; Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA<br>
&gt; <br>
&gt; Hi Wei,<br>
&gt; <br>
&gt; This is extremely exciting, thanks for the very nice summary!<br>
&gt; <br>
&gt; <br>
&gt; On Thu, 24 Feb 2022, Wei Chen wrote:<br>
&gt; &gt; # Proposal for Porting Xen to Armv8-R64<br>
&gt; &gt;<br>
&gt; &gt; This proposal will introduce the PoC work of porting Xen to Armv8=
-R64,<br>
&gt; &gt; which includes:<br>
&gt; &gt; - The changes of current Xen capability, like Xen build system, m=
emory<br>
&gt; &gt;&nbsp;&nbsp; management, domain management, vCPU context switch.<b=
r>
&gt; &gt; - The expanded Xen capability, like static-allocation and direct-=
map.<br>
&gt; &gt;<br>
&gt; &gt; ***Notes:***<br>
&gt; &gt; 1. ***This proposal only covers the work of porting Xen to Armv8-=
R64***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ***single CPU. Xen SMP support on Armv8-R64 rel=
ates to Armv8-R***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ***Trusted-Frimware (TF-R). This is an external=
 dependency,***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ***so we think the discussion of Xen SMP suppor=
t on Armv8-R64***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ***should be started when single-CPU support is=
 complete.***<br>
&gt; &gt; 2. ***This proposal will not touch xen-tools. In current stage,**=
*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ***Xen on Armv8-R64 only support dom0less, all =
guests should***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; ***be booted from device tree.***<br>
&gt; &gt;<br>
&gt; &gt; ## 1. Essential Background<br>
&gt; &gt;<br>
&gt; &gt; ### 1.1. Armv8-R64 Profile<br>
&gt; &gt; The Armv-R architecture profile was designed to support use cases=
 that<br>
&gt; &gt; have a high sensitivity to deterministic execution. (e.g. Fuel In=
jection,<br>
&gt; &gt; Brake control, Drive trains, Motor control etc)<br>
&gt; &gt;<br>
&gt; &gt; Arm announced Armv8-R in 2013, it is the latest generation Arm<br=
>
&gt; architecture<br>
&gt; &gt; targeted at the Real-time profile. It introduces virtualization a=
t the<br>
&gt; highest<br>
&gt; &gt; security level while retaining the Protected Memory System Archit=
ecture<br>
&gt; (PMSA)<br>
&gt; &gt; based on a Memory Protection Unit (MPU). In 2020, Arm announced C=
ortex-<br>
&gt; R82,<br>
&gt; &gt; which is the first Arm 64-bit Cortex-R processor based on Armv8-R=
64.<br>
&gt; &gt;<br>
&gt; &gt; - The latest Armv8-R64 document can be found here:<br>
&gt; &gt;&nbsp;&nbsp; [Arm Architecture Reference Manual Supplement - Armv8=
, for Armv8-R<br>
&gt; AArch64 architecture<br>
&gt; profile](<a href=3D"https://developer.arm.com/documentation/ddi0600/la=
test/">https://developer.arm.com/documentation/ddi0600/latest/</a>).<br>
&gt; &gt;<br>
&gt; &gt; - Armv-R Architecture progression:<br>
&gt; &gt;&nbsp;&nbsp; Armv7-R -&gt; Armv8-R AArch32 -&gt; Armv8 AArch64<br>
&gt; &gt;&nbsp;&nbsp; The following figure is a simple comparison of &quot;=
R&quot; processors based on<br>
&gt; &gt;&nbsp;&nbsp; different Armv-R Architectures.<br>
&gt; &gt;&nbsp;&nbsp; ![image](https://drive.google.com/uc?export=3Dview&am=
p;id=3D1nE5RAXaX8zY2KPZ8i<br>
&gt; mBpbvIr2eqBguEB)<br>
&gt; &gt;<br>
&gt; &gt; - The Armv8-R architecture evolved additional features on top of =
Armv7-R:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - An exception model that is compatible w=
ith the Armv8-A model<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Virtualization with support for guest o=
perating systems<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - PMSA virtualiza=
tion using MPUs In EL2.<br>
&gt; &gt; - The new features of Armv8-R64 architecture<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Adds support for the 64-bit A64 instruc=
tion set, previously Armv8-<br>
&gt; R<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; only supported A32.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Supports up to 48-bit physical addressi=
ng, previously up to 32-bit<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addressing was supported.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Optional Arm Neon technology and Advanc=
ed SIMD<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Supports three Exception Levels (ELs)<b=
r>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Secure EL2 - Th=
e Highest Privilege, MPU only, for firmware,<br>
&gt; hypervisor<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Secure EL1 - Ri=
chOS (MMU) or RTOS (MPU)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Secure EL0 - Ap=
plication Workloads<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Optionally supports Virtual Memory Syst=
em Architecture at S-EL1/S-<br>
&gt; EL0.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This means it's possible to r=
un rich OS kernels - like Linux -<br>
&gt; either<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bare-metal or as a guest.<br>
&gt; &gt; - Differences with the Armv8-A AArch64 architecture<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Supports only a single Security state -=
 Secure. There is not Non-<br>
&gt; Secure<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execution state supported.<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - EL3 is not supported, EL2 is mandatory.=
 This means secure EL2 is<br>
&gt; the<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; highest EL.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Supports the A64 ISA instruction<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - With a small se=
t of well-defined differences<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Provides a PMSA (Protected Memory Syste=
m Architecture) based<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; virtualization model.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - As opposed to A=
rmv8-A AArch64's VMSA based Virtualization<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Can support add=
ress bits up to 52 if FEAT_LPA is enabled,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; other=
wise 48 bits.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Determines the =
access permissions and memory attributes of<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the t=
arget PA.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Can implement P=
MSAv8-64 at EL1 and EL2<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; - Address translation flat-maps the VA to the PA for EL2<br>
&gt; Stage 1.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; - Address translation flat-maps the VA to the PA for EL1<br>
&gt; Stage 1.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; - Address translation flat-maps the IPA to the PA for EL1<br>
&gt; Stage 2.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - PMSA in EL1 &amp; EL2 is configurable, =
VMSA in EL1 is configurable.<br>
&gt; &gt;<br>
&gt; &gt; ### 1.2. Xen Challenges with PMSA Virtualization<br>
&gt; &gt; Xen is PMSA unaware Type-1 Hypervisor, it will need modifications=
 to run<br>
&gt; &gt; with an MPU and host multiple guest OSes.<br>
&gt; &gt;<br>
&gt; &gt; - No MMU at EL2:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - No EL2 Stage 1 address translation<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Xen provides fi=
xed ARM64 virtual memory layout as basis of EL2<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stage=
 1 address translation, which is not applicable on MPU<br>
&gt; system,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; where=
 there is no virtual addressing. As a result, any<br>
&gt; operation<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invol=
ving transition from PA to VA, like ioremap, needs<br>
&gt; modification<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on MP=
U system.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Xen's run-time addresses are the same a=
s the link time addresses.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Enable PIC (pos=
ition-independent code) on a real-time target<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proce=
ssor probably very rare.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Xen will need to use the EL2 MPU memory=
 region descriptors to<br>
&gt; manage<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access permissions and attrib=
utes for accesses made by VMs at<br>
&gt; EL1/0.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Xen currently r=
elies on MMU EL1 stage 2 table to manage these<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acces=
ses.<br>
&gt; &gt; - No MMU Stage 2 translation at EL1:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - A guest doesn't have an independent gue=
st physical address space<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - A guest can not reuse the current Inter=
mediate Physical Address<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory layout<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - A guest uses physical addresses to acce=
ss memory and devices<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - The MPU at EL2 manages EL1 stage 2 acce=
ss permissions and<br>
&gt; attributes<br>
&gt; &gt; - There are a limited number of MPU protection regions at both EL=
2 and<br>
&gt; EL1:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Architecturally, the maximum number of =
protection regions is 256,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; typical implementations have =
32.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - By contrast, Xen does not need to consi=
der the number of page<br>
&gt; table<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; entries in theory when using =
MMU.<br>
&gt; &gt; - The MPU protection regions at EL2 need to be shared between the=
<br>
&gt; hypervisor<br>
&gt; &gt;&nbsp;&nbsp; and the guest stage 2.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - Requires careful consideration - may im=
pact feature 'fullness' of<br>
&gt; both<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the hypervisor and the guest<=
br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - By contrast, when using MMU, Xen has st=
andalone P2M table for<br>
&gt; guest<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stage 2 accesses.<br>
&gt; &gt;<br>
&gt; &gt; ## 2. Proposed changes of Xen<br>
&gt; &gt; ### **2.1. Changes of build system:**<br>
&gt; &gt;<br>
&gt; &gt; - ***Introduce new Kconfig options for Armv8-R64***:<br>
&gt; &gt;&nbsp;&nbsp; Unlike Armv8-A, because lack of MMU support on Armv8-=
R64, we may not<br>
&gt; &gt;&nbsp;&nbsp; expect one Xen binary to run on all machines. Xen ima=
ges are not<br>
&gt; common<br>
&gt; &gt;&nbsp;&nbsp; across Armv8-R64 platforms. Xen must be re-built for =
different Armv8-<br>
&gt; R64<br>
&gt; &gt;&nbsp;&nbsp; platforms. Because these platforms may have different=
 memory layout<br>
&gt; and<br>
&gt; &gt;&nbsp;&nbsp; link address.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - `ARM64_V8R`:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This option enables Armv8-R p=
rofile for Arm64. Enabling this<br>
&gt; option<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; results in selecting MPU. Thi=
s Kconfig option is used to gate some<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Armv8-R64 specific code excep=
t MPU code, like some code for Armv8-<br>
&gt; R64<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; only system ID registers acce=
ss.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - `ARM_MPU`<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This option enables MPU on AR=
Mv8-R architecture. Enabling this<br>
&gt; option<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; results in disabling MMU. Thi=
s Kconfig option is used to gate some<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARM_MPU specific code. Once w=
hen this Kconfig option has been<br>
&gt; enabled,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the MMU relate code will not =
be built for Armv8-R64. The reason<br>
&gt; why<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; not depends on runtime detect=
ion to select MMU or MPU is that, we<br>
&gt; don't<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; think we can use one image fo=
r both Armv8-R64 and Armv8-A64.<br>
&gt; Another<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reason that we separate MPU a=
nd V8R in provision to allow to<br>
&gt; support MPU<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on 32bit Arm one day.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - `XEN_START_ADDRESS`<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This option allows to set the=
 custom address at which Xen will be<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linked. This address must be =
aligned to a page size. Xen's run-<br>
&gt; time<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addresses are the same as the=
 link time addresses. Different<br>
&gt; platforms<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; may have differnt memory layo=
ut. This Kconfig option provides<br>
&gt; users<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the ability to select proper =
link addresses for their boards.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ***Notes: Fixed link address =
means the Xen binary could not be***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ***relocated by EFI loader. S=
o in current stage, Xen could not***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ***be launched as an EFI appl=
ication on Armv8-R64.***<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; - `ARM_MPU_NORMAL_MEMORY_START` and `ARM_=
MPU_NORMAL_MEMORY_END`<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `ARM_MPU_DEVICE_MEMORY_START`=
 and `ARM_MPU_DEVICE_MEMORY_END`<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; These Kconfig options allow t=
o set memory regions for Xen code,<br>
&gt; data<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and device memory. Before par=
sing memory information from device<br>
&gt; tree,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Xen will use the values that =
stored in these options to setup<br>
&gt; boot-time<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MPU configuration. Why we nee=
d a boot-time MPU configuration?<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. More deterministic: Arm MP=
U supports background regions,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if we don't=
 configure the MPU regions and don't enable MPU.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We can enab=
le MPU background regions. But that means all RAM<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is RWX. Ran=
dom values in RAM or maliciously embedded data can<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; be exploite=
d. Using these Kconfig options allow users to have<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a determini=
stic RAM area to execute code.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. More compatible: On some A=
rmv8-R64 platforms, if the MPU is<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; disabled, t=
he `dc zva` instruction will make the system halt.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; And this in=
struction will be embedded in some built-in<br>
&gt; functions,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; like `memor=
y set`. If we use `-ddont_use_dc` to rebuild GCC,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the built-i=
n functions will not contain `dc zva`. However, it<br>
&gt; is<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obviously u=
nlikely that we will be able to recompile all GCC<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for ARMv8-R=
64.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. One optional idea:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We ca=
n map `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` or<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `XEN_=
START_ADDRESS` to `XEN_START_ADDRESS + image_end` for<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MPU n=
ormal memory. It's enough to support Xen run in boot time.<br>
&gt; <br>
&gt; I can imagine that we need to have a different Xen build for each<br>
&gt; ARMv8-R platform. Do you envision that XEN_START_ADDRESS and<br>
&gt; ARM_MPU_*_MEMORY_START/END are preconfigured based on the platform<br>
&gt; choice at build time? I don't think we want a user to provide all of<b=
r>
&gt; those addresses by hand, right?<br>
<br>
Yes, this is in our TODO list. We want to reuse current arm/platforms and<b=
r>
Kconfig menu for Armv8-R.<br>
<br>
&gt; <br>
&gt; The next question is whether we could automatically generate<br>
&gt; XEN_START_ADDRESS and ARM_MPU_*_MEMORY_START/END based on the platform=
<br>
&gt; device tree at build time (at build time, not runtime). That would<br>
&gt; make things a lot easier and it is also aligned with the way Zephyr an=
d<br>
&gt; other RTOSes and baremetal apps work.<br>
<br>
It's a considerable option. But here we may encounter some problems need<br=
>
to be solved first:<br>
1. Does CONFIG_DTB must be selected by default on Armv8-R? Without firmware=
<br>
&nbsp;&nbsp; or bootloader (like u-boot), we have to build DTB into Xen bin=
ary. This<br>
&nbsp;&nbsp; can guarantee build-time DTB is the same as runtime DTB. But e=
ventually,<br>
&nbsp;&nbsp; we will have firmware and bootloader before Xen launch (as Arm=
 EBBR's<br>
&nbsp;&nbsp; requirement). In this case, we may not build DTB into Xen imag=
e. And<br>
&nbsp;&nbsp; we can't guarantee build-time DTB is the same as runtime DTB.<=
br>
2. If build-time DTB is the same as runtime DTB, how can we determine<br>
&nbsp;&nbsp; the XEN_START_ADDRESS in DTB describe memory range? Should we =
always<br>
&nbsp;&nbsp; limit Xen to boot from lowest address? Or will we introduce so=
me new<br>
&nbsp;&nbsp; DT property to specify the Xen start address? I think this DT =
property<br>
&nbsp;&nbsp; also can solve above question#1.<br>
<br>
&gt; <br>
&gt; The device tree can be given as input to the build system, and the<br>
&gt; Makefiles would take care of generating XEN_START_ADDRESS and<br>
&gt; ARM_MPU_*_MEMORY_START/END based on /memory and other interesting node=
s.<br>
&gt; <br>
<br>
If we can solve above questions, yes, device tree is a good idea for<br>
XEN_START_ADDRESS. For ARM_MPU_NORMAL_MEMORY_*, we can get them from<br>
memory nodes, but for ARM_MPU_DEVICE_MEMORY_*, they are not easy for<br>
us to scan all devices' nodes. And it's very tricky, if the memory<br>
regions are interleaved. So in our current RFC code, we select to use<br>
the optional idea:<br>
We map `XEN_START_ADDRESS` to `XEN_START_ADDRESS + 2MB` for MPU normal memo=
ry.<br>
But we use mpu,device-memory-section in DT for MPU device memory.<br>
<br>
&gt; <br>
&gt; &gt; - ***Define new system registers for compilers***:<br>
&gt; &gt;&nbsp;&nbsp; Armv8-R64 is based on Armv8.4. That means we will use=
 some Armv8.4<br>
&gt; &gt;&nbsp;&nbsp; specific system registers. As Armv8-R64 only have sec=
ure state, so<br>
&gt; &gt;&nbsp;&nbsp; at least, `VSTCR_EL2` and `VSCTLR_EL2` will be used f=
or Xen. And the<br>
&gt; &gt;&nbsp;&nbsp; first GCC version that supports Armv8.4 is GCC 8.1. I=
n addition to<br>
&gt; &gt;&nbsp;&nbsp; these, PMSA of Armv8-R64 introduced lots of MPU relat=
ed system<br>
&gt; registers:<br>
&gt; &gt;&nbsp;&nbsp; `PRBAR_ELx`, `PRBARx_ELx`, `PRLAR_ELx`, `PRLARx_ELx`,=
 `PRENR_ELx` and<br>
&gt; &gt;&nbsp;&nbsp; `MPUIR_ELx`. But the first GCC version to support the=
se system<br>
&gt; registers<br>
&gt; &gt;&nbsp;&nbsp; is GCC 11. So we have two ways to make compilers to w=
ork properly with<br>
&gt; &gt;&nbsp;&nbsp; these system registers.<br>
&gt; &gt;&nbsp;&nbsp; 1. Bump GCC version to GCC 11.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The pros of this method is that, we=
 don't need to encode these<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; system registers in macros by ourse=
lves. But the cons are that,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; we have to update Makefiles to supp=
ort GCC 11 for Armv8-R64.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.1. Check the GCC version 11 for A=
rmv8-R64.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.2. Add march=3Darmv8r to CFLAGS f=
or Armv8-R64.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3. Solve the confliction of march=
=3Darmv8r and mcpu=3Dgeneric<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; These changes will affect common Makefile=
s, not only Arm Makefiles.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; And GCC 11 is new, lots of toolchains and=
 Distro haven't supported<br>
&gt; it.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; 2. Encode new system registers in macros ***(preferre=
d)***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Virtualization=
 Secure Translation Control Register */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define VSTCR_EL2=
&nbsp; S3_4_C2_C6_2<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Virtualization=
 System Control Register */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define VSCTLR_EL=
2 S3_4_C2_C0_0<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* EL1 MPU Protec=
tion Region Base Address Register encode */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define PRBAR_EL1=
&nbsp; S3_0_C6_C8_0<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* EL2 MPU Protec=
tion Region Base Address Register encode */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define PRBAR_EL2=
&nbsp; S3_4_C6_C8_0<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; If we encode all above system regis=
ters, we don't need to bump GCC<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; version. And the common CFLAGS Xen =
is using still can be applied to<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Armv8-R64. We don't need to modify =
Makefiles to add specific CFLAGS.<br>
&gt; <br>
&gt; I think that's fine and we did something similar with the original ARM=
v7-A<br>
&gt; port if I remember correctly.<br>
&gt; <br>
&gt; <br>
&gt; &gt; ### **2.2. Changes of the initialization process**<br>
&gt; &gt; In general, we still expect Armv8-R64 and Armv8-A64 to have a con=
sistent<br>
&gt; &gt; initialization process. In addition to some architecture differen=
ces,<br>
&gt; there<br>
&gt; &gt; is no more than reusable code that we will distinguish through<br=
>
&gt; CONFIG_ARM_MPU<br>
&gt; &gt; or CONFIG_ARM64_V8R. We want most of the initialization code to b=
e<br>
&gt; reusable<br>
&gt; &gt; between Armv8-R64 and Armv8-A64.<br>
&gt; <br>
&gt; +1<br>
&gt; <br>
&gt; <br>
&gt; &gt; - We will reuse the original head.s and setup.c of Arm. But repla=
ce the<br>
&gt; &gt;&nbsp;&nbsp; MMU and page table operations in these files with con=
figuration<br>
&gt; operations<br>
&gt; &gt;&nbsp;&nbsp; for MPU and MPU regions.<br>
&gt; &gt;<br>
&gt; &gt; - We provide a boot-time MPU configuration. This MPU configuratio=
n will<br>
&gt; &gt;&nbsp;&nbsp; support Xen to finish its initialization. And this bo=
ot-time MPU<br>
&gt; &gt;&nbsp;&nbsp; configuration will record the memory regions that wil=
l be parsed from<br>
&gt; &gt;&nbsp;&nbsp; device tree.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; In the end of Xen initialization, we will use a runti=
me MPU<br>
&gt; configuration<br>
&gt; &gt;&nbsp;&nbsp; to replace boot-time MPU configuration. The runtime M=
PU configuration<br>
&gt; will<br>
&gt; &gt;&nbsp;&nbsp; merge and reorder memory regions to save more MPU reg=
ions for guests.<br>
&gt; &gt;&nbsp;&nbsp; ![img](https://drive.google.com/uc?export=3Dview&amp;=
id=3D1wTFyK2XfU3lTlH1PqRD<br>
&gt; oacQVTwUtWIGU)<br>
&gt; &gt;<br>
&gt; &gt; - Defer system unpausing domain.<br>
&gt; &gt;&nbsp;&nbsp; When Xen initialization is about to end, Xen unpause =
guests created<br>
&gt; &gt;&nbsp;&nbsp; during initialization. But this will cause some issue=
s. The unpause<br>
&gt; &gt;&nbsp;&nbsp; action occurs before free_init_memory, however the ru=
ntime MPU<br>
&gt; configuration<br>
&gt; &gt;&nbsp;&nbsp; is built after free_init_memory.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; So if the unpaused guests start executing the context=
 switch at this<br>
&gt; &gt;&nbsp;&nbsp; point, then its MPU context will base on the boot-tim=
e MPU<br>
&gt; configuration.<br>
&gt; &gt;&nbsp;&nbsp; Probably it will be inconsistent with runtime MPU con=
figuration, this<br>
&gt; &gt;&nbsp;&nbsp; will cause unexpected problems (This may not happen i=
n a single core<br>
&gt; &gt;&nbsp;&nbsp; system, but on SMP systems, this problem is foreseeab=
le, so we hope to<br>
&gt; &gt;&nbsp;&nbsp; solve it at the beginning).<br>
&gt; &gt;<br>
&gt; &gt; ### **2.3. Changes to reduce memory fragmentation**<br>
&gt; &gt;<br>
&gt; &gt; In general, memory in Xen system can be classified to 4 classes:<=
br>
&gt; &gt; `image sections`, `heap sections`, `guest RAM`, `boot modules (gu=
est<br>
&gt; Kernel,<br>
&gt; &gt; initrd and dtb)`<br>
&gt; &gt;<br>
&gt; &gt; Currently, Xen doesn't have any restriction for users how to allo=
cate<br>
&gt; &gt; memory for different classes. That means users can place boot mod=
ules<br>
&gt; &gt; anywhere, can reserve Xen heap memory anywhere and can allocate g=
uest<br>
&gt; &gt; memory anywhere.<br>
&gt; &gt;<br>
&gt; &gt; In a VMSA system, this would not be too much of a problem, since =
the<br>
&gt; &gt; MMU can manage memory at a granularity of 4KB after all. But in a=
<br>
&gt; &gt; PMSA system, this will be a big problem. On Armv8-R64, the max MP=
U<br>
&gt; &gt; protection regions number has been limited to 256. But in typical=
<br>
&gt; &gt; processor implementations, few processors will design more than 3=
2<br>
&gt; &gt; MPU protection regions. Add in the fact that Xen shares MPU prote=
ction<br>
&gt; &gt; regions with guest's EL1 Stage 2. It becomes even more important<=
br>
&gt; &gt; to properly plan the use of MPU protection regions.<br>
&gt; &gt;<br>
&gt; &gt; - An ideal of memory usage layout restriction:<br>
&gt; &gt; ![img](https://drive.google.com/uc?export=3Dview&amp;id=3D1kirOL0=
Tx2aAypTtd3kXAt<br>
&gt; d75XtrngcnW)<br>
&gt; &gt; 1. Reserve proper MPU regions for Xen image (code, rodata and dat=
a +<br>
&gt; bss).<br>
&gt; &gt; 2. Reserve one MPU region for boot modules.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; That means the placement of all boot modules, i=
nclude guest kernel,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; initrd and dtb, will be limited to this MPU reg=
ion protected area.<br>
&gt; &gt; 3. Reserve one or more MPU regions for Xen heap.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; On Armv8-R64, the guest memory is predefined in=
 device tree, it will<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; not be allocated from heap. Unlike Armv8-A64, w=
e will not move all<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; free memory to heap. We want Xen heap is derter=
mistic too, so Xen on<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Armv8-R64 also rely on Xen static heap feature.=
 The memory for Xen<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; heap will be defined in tree too. Considering t=
hat physical memory<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; can also be discontinuous, one or more MPU prot=
ection regions needs<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; to be reserved for Xen HEAP.<br>
&gt; &gt; 4. If we name above used MPU protection regions PART_A, and name =
left<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; MPU protection regions PART_B:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 4.1. In hypervisor context, Xen will map left R=
AM and devices to<br>
&gt; PART_B.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This will give Xe=
n the ability to access whole memory.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 4.2. In guest context, Xen will create EL1 stag=
e 2 mapping in PART_B.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In this case, Xen=
 just need to update PART_B in context switch,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but keep PART_A a=
s fixed.<br>
&gt; <br>
&gt; I think that the memory layout and restrictions that you wrote above<b=
r>
&gt; make sense. I have some comments on the way they are represented in<br=
>
&gt; device tree, but that's different.<br>
&gt; <br>
&gt; <br>
&gt; &gt; ***Notes: Static allocation will be mandatory on MPU based system=
s***<br>
&gt; &gt;<br>
&gt; &gt; **A sample device tree of memory layout restriction**:<br>
&gt; &gt; ```<br>
&gt; &gt; chosen {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Define a section to place boot mo=
dules,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * all boot modules must be placed i=
n this section.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; mpu,boot-module-section =3D &lt;0x1000000=
0 0x10000000&gt;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Define a section to cover all gue=
st RAM. All guest RAM must be<br>
&gt; located<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * within this section. The pros is =
that, in best case, we can only<br>
&gt; have<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * one MPU protection region to map =
all guest RAM for Xen.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; mpu,guest-memory-section =3D &lt;0x200000=
00 0x30000000&gt;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Define a memory section that can =
cover all device memory that<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * will be used in Xen.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; mpu,device-memory-section =3D &lt;0x80000=
000 0x7ffff000&gt;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; /* Define a section for Xen heap */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; xen,static-mem =3D &lt;0x50000000 0x20000=
000&gt;;<br>
&gt; <br>
&gt; As mentioned above, I understand the need for these sections, but why =
do<br>
&gt; we need to describe them in device tree at all? Could Xen select them =
by<br>
&gt; itself during boot?<br>
<br>
I think without some inputs, Xen could not do this or will do it in some<br=
>
assumption. For example, assume the first the boot-module-section determine=
d<br>
by lowest address and highest address of all modules. And the same for<br>
guest-memory-section, calculated from all guest allocated memory regions.<b=
r>
&nbsp;<br>
<br>
&gt; <br>
&gt; If not, and considering that we have to generate<br>
&gt; ARM_MPU_*_MEMORY_START/END anyway at build time, would it make sense t=
o<br>
&gt; also generate mpu,guest-memory-section, xen,static-mem, etc. at build<=
br>
&gt; time rather than passing it via device tree to Xen at runtime?<br>
&gt; <br>
<br>
Did you mean we still add these information in device tree, but for build<b=
r>
time only. In runtime we don't parse them?<br>
<br>
&gt; What's the value of doing ARM_MPU_*_MEMORY_START/END at build time and=
<br>
&gt; everything else at runtime?<br>
<br>
ARM_MPU_*_MEMORY_START/END is defined by platform. But other things are<br>
users customized. They can change their usage without rebuild the image.<br=
>
<br>
&gt; <br>
&gt; It looks like we are forced to have the sections definitions at build<=
br>
&gt; time because we need them before we can parse device tree. In that cas=
e,<br>
&gt; we might as well define all the sections at build time.<br>
&gt; <br>
&gt; But I think it would be even better if Xen could automatically choose<=
br>
&gt; xen,static-mem, mpu,guest-memory-section, etc. on its own based on the=
<br>
&gt; regular device tree information (/memory, /amba, etc.), without any ne=
ed<br>
&gt; for explicitly describing each range with these new properties.<br>
&gt; <br>
<br>
for mpu,guest-memory-section, with the limitations: no other usage between<=
br>
different guest' memory nodes, this is OK. But for xen,static-mem (heap),<b=
r>
we just want everything on a MPU system is dertermistic. But, of course Xen=
<br>
can select left memory for heap without static-mem.<br>
<br>
&gt; <br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; domU1 {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #xen,static-mem-a=
ddress-cells =3D &lt;0x01&gt;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #xen,static-mem-s=
ize-cells =3D &lt;0x01&gt;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Statically all=
ocated guest memory, within mpu,guest-memory-<br>
&gt; section */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xen,static-mem =
=3D &lt;0x30000000 0x1f000000&gt;;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module@11000000 {=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; compatible =3D &quot;multiboot,kernel\0multiboot,module&quot;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /* Boot module address, within mpu,boot-module-section */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; reg =3D &lt;0x11000000 0x3000000&gt;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module@10FF0000 {=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;multiboot,device-tree\0=
multiboot,module&quot;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Boot module address, within mpu,boot-modu=
le-section<br>
&gt; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x10ff0000 0x10000&gt;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; &gt; };<br>
&gt; &gt; ```<br>
&gt; &gt;<br>
&gt; &gt; ### **2.4. Changes of memory management**<br>
&gt; &gt; Xen is coupled with VMSA, in order to port Xen to Armv8-R64, we h=
ave to<br>
&gt; &gt; decouple Xen from VMSA. And give Xen the ability to manage memory=
 in<br>
&gt; PMSA.<br>
&gt; &gt;<br>
&gt; &gt; 1. ***Use buddy allocator to manage physical pages for PMSA***<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp; From the view of physical page, PMSA and VMSA d=
on't have any<br>
&gt; difference.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; So we can reuse buddy allocator on Armv8-R64 to=
 manage physical pages.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; The difference is that, in VMSA, Xen will map a=
llocated pages to<br>
&gt; virtual<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; addresses. But in PMSA, Xen just convert the pa=
ges to physical<br>
&gt; address.<br>
&gt; &gt;<br>
&gt; &gt; 2. ***Can not use virtual address for memory management***<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; As Armv8-R64 only has PMSA in EL2, Xen loses th=
e ability of using<br>
&gt; virtual<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; address to manage memory. This brings some prob=
lems, some virtual<br>
&gt; address<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; based features could not work well on Armv8-R64=
, like `FIXMAP`,<br>
&gt; `vmap/vumap`,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; `ioremap` and `alternative`.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; But the functions or macros of these features a=
re used in lots of<br>
&gt; common<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; code. So it's not good to use `#ifdef CONFIG_AR=
M_MPU` to gate relate<br>
&gt; code<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; everywhere. In this case, we propose to use stu=
b helpers to make the<br>
&gt; changes<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; transparently to common code.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 1. For `FIXMAP`, we will use `0` in `FIXMAP_ADD=
R` for all fixmap<br>
&gt; operations.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This will return physical add=
ress directly of fixmapped item.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 2. For `vmap/vumap`, we will use some empty inl=
ine stub helpers:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d vm_init_type(...) {}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d *__vmap(...)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return NULL;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d vunmap(const void *va) {}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d *vmalloc(size_t size)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return NULL;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d *vmalloc_xen(size_t size)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return NULL;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d vfree(void *va) {}<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; 3. For `ioremap`, it depends on `vmap`. As we h=
ave make `vmap` to<br>
&gt; always<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return `NULL`, they could not=
 work well on Armv8-R64 without<br>
&gt; changes.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `ioremap` will return input a=
ddress directly.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d *ioremap_attr(...)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; /* We don't have the ability to change input PA cache<br>
&gt; attributes */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; if ( CACHE_ATTR_need_change )<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return (void *)pa;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d __iomem *ioremap_nocache(...)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d __iomem *ioremap_cache(...)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return ioremap_attr(start, len, PAGE_HYPERVISOR);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static inline voi=
d __iomem *ioremap_wc(...)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *ioremap(...=
)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; 4. For `alternative`, it depends on `vmap=
` too. We will simply<br>
&gt; disable<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; it on Armv8-R64 in curr=
ent stage. How to implement `alternative`<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on Armv8-R64 is better =
to be discussed after basic functions of<br>
&gt; Xen<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on Armv8-R64 work well.=
<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But simply disable `alt=
ernative` will make `cpus_have_const_cap`<br>
&gt; always<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * System capabili=
ty check for constant cap */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define cpus_have=
_const_cap(num) ({&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; register_t __ret;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; asm volatile (ALTERNATIVE(&quot;mov %0, #0&quot;,&=
nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mov %0, #1&quot;,&nbsp;&nbsp;&nbsp;&nb=
sp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &quot;=3Dr&quot; (__ret));&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unlikely(__ret);&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; })<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So, before we hav=
e an PMSA `alternative` implementation, we have<br>
&gt; to<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implement a separ=
ate `cpus_have_const_cap` for Armv8-R64:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #define cpus_have=
_const_cap(num) cpus_have_cap(num)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; <br>
&gt; I think it is OK to disable alternative<br>
&gt; <br>
&gt; <br>
&gt; &gt; ### **2.5. Changes of guest management**<br>
&gt; &gt; Armv8-R64 only supports PMSA in EL2, but it supports configurable=
<br>
&gt; &gt; VMSA or PMSA in EL1. This means Xen will have a new type guest on=
<br>
&gt; &gt; Armv8-R64 - MPU based guest.<br>
&gt; &gt;<br>
&gt; &gt; 1. **Add a new domain type - MPU_DOMAIN**<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; When user want to create a guest that will be u=
sing MPU in EL1, user<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; should add a `mpu` property in device tree `dom=
U` node, like<br>
&gt; following<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; example:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; domU2 {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &q=
uot;xen,domain&quot;;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; direct-map;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mpu; --&gt; Indic=
ates this domain will use PMSA in EL1.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Corresponding to `mpu` property in device=
 tree, we also need to<br>
&gt; introduce<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; a new flag `XEN_DOMCTL_CDF_INTERNAL_mpu` =
for domain to mark itself<br>
&gt; as an<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; MPU domain. This flag will be used in dom=
ain creation and domain<br>
&gt; doing<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; vCPU context switch.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; 1. Domain creation need this flag to deci=
de enable PMSA or VMSA in<br>
&gt; EL1.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; 2. vCPU context switch need this flag to =
decide save/restore MMU or<br>
&gt; MPU<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; related registers.<br>
&gt; &gt;<br>
&gt; &gt; 2. **Add MPU registers to vCPU save EL1 MPU context**<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Current Xen only support MMU based guest, so it=
 hasn't considered to<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; save/restore MPU context. In this case, we need=
 to add MPU registers<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; to `arch_vcpu`:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; struct arch_vcpu<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; #ifdef CONFIG_ARM_MPU<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Virtualization=
 Translation Control Register */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; register_t vtcr_e=
l2;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* EL1 MPU region=
s' registers */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_t mpu_regions[=
CONFIG_ARM_MPU_EL1_PROTECTION_REGIONS];<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; #endif<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Armv8-R64 can support max to 256 MPU regi=
ons. But that's just<br>
&gt; theoretical.<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; So we don't want to define `pr_t mpu_regi=
ons[256]`, this is a memory<br>
&gt; waste<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; in most of time. So we decided to let the=
 user specify through a<br>
&gt; Kconfig<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; option. `CONFIG_ARM_MPU_EL1_PROTECTION_RE=
GIONS` default value can be<br>
&gt; `32`,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; it's a typical implementation on Armv8-R6=
4. Users will recompile Xen<br>
&gt; when<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; their platform changes. So when the MPU c=
hanges, respecifying the<br>
&gt; MPU<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; protection regions number will not cause =
additional problems.<br>
&gt; <br>
&gt; I wonder if we could probe the number of MPU regions at runtime and<br=
>
&gt; dynamically allocate the memory needed to store them in arch_vcpu.<br>
&gt; <br>
<br>
We have considered to used a pr_t mpu_regions[0] in arch_vcpu. But it seems=
<br>
we will encounter some static allocated arch_vcpu problems and sizeof issue=
.<br>
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; 3. **MPU based P2M table management**<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Armv8-R64 EL2 doesn't have EL1 stage 2 address =
translation. But<br>
&gt; through<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; PMSA, it still has the ability to control the p=
ermissions and<br>
&gt; attributes<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; of EL1 stage 2. In this case, we still hope to =
keep the interface<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; consistent with MMU based P2M as far as possibl=
e.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; p2m-&gt;root will point to an allocated memory.=
 In Armv8-A64, this<br>
&gt; memory<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; is used to save the EL1 stage 2 translation tab=
le. But in Armv8-R64,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; this memory will be used to store EL2 MPU prote=
ction regions that are<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; used by guest. During domain creation, Xen will=
 prepare the data in<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; this memory to make guest can access proper RAM=
 and devices. When the<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; guest's vCPU will be scheduled in, this data wi=
ll be written to MPU<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; protection region registers.<br>
&gt; &gt;<br>
&gt; &gt; ### **2.6. Changes of exception trap**<br>
&gt; &gt; As Armv8-R64 has compatible exception mode with Armv8-A64, so we =
can<br>
&gt; reuse most<br>
&gt; &gt; of Armv8-A64's exception trap &amp; handler code. But except the =
trap based<br>
&gt; on EL1<br>
&gt; &gt; stage 2 translation abort.<br>
&gt; &gt;<br>
&gt; &gt; In Armv8-A64, we use `FSC_FLT_TRANS`<br>
&gt; &gt; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; case FSC_FLT_TRANS:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( is_data )<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; enum io_state state =3D try_handle_mmio(regs, hsr, gpa);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; ```<br>
&gt; &gt; But for Armv8-R64, we have to use `FSC_FLT_PERM`<br>
&gt; &gt; ```<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; case FSC_FLT_PERM:<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( is_data )<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; enum io_state state =3D try_handle_mmio(regs, hsr, gpa);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; ```<br>
&gt; &gt;<br>
&gt; &gt; ### **2.5. Changes of device driver**<br>
&gt; &gt; 1. Because Armv8-R64 only has single secure state, this will affe=
ct some<br>
&gt; &gt; devices that have two secure state, like GIC. But fortunately, mo=
st<br>
&gt; &gt; vendors will not link a two secure state GIC to Armv8-R64 process=
ors.<br>
&gt; &gt; Current GIC driver can work well with single secure state GIC for=
 Armv8-<br>
&gt; R64.<br>
&gt; &gt; 2. Xen should use secure hypervisor timer in Secure EL2. We will<=
br>
&gt; introduce<br>
&gt; &gt; a CONFIG_ARM_SECURE_STATE to make Xen to use secure registers for=
 timer.<br>
&gt; &gt;<br>
&gt; &gt; ### **2.7. Changes of virtual device**<br>
&gt; &gt; Currently, we only support pass-through devices in guest. Because=
 event<br>
&gt; &gt; channel, xen-bus, xen-storage and other advanced Xen features hav=
en't<br>
&gt; been<br>
&gt; &gt; enabled in Armv8-R64.<br>
&gt; <br>
&gt; That's fine -- it is a great start! Looking forward to it!<br>
</div>
</span></font>
</body>
</html>

--_000_AS1PR08MB74269923288B75097392BDD99E3E9AS1PR08MB7426eurp_--

