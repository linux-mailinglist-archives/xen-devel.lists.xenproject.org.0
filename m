Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC1D6114BF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 16:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432116.684848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQV1-0005eO-UH; Fri, 28 Oct 2022 14:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432116.684848; Fri, 28 Oct 2022 14:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooQV1-0005bk-RE; Fri, 28 Oct 2022 14:38:19 +0000
Received: by outflank-mailman (input) for mailman id 432116;
 Fri, 28 Oct 2022 14:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqEQ=25=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ooQV0-0005be-Dy
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 14:38:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20053.outbound.protection.outlook.com [40.107.2.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 290ff155-56ce-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 16:38:17 +0200 (CEST)
Received: from AM6PR0202CA0072.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::49) by PAXPR08MB6591.eurprd08.prod.outlook.com
 (2603:10a6:102:150::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 14:38:05 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::d7) by AM6PR0202CA0072.outlook.office365.com
 (2603:10a6:20b:3a::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 14:38:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 28 Oct 2022 14:38:04 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 28 Oct 2022 14:38:04 +0000
Received: from f7e18d3e27e8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DC1F49C-55E7-4020-9B50-B5377C1AB14F.1; 
 Fri, 28 Oct 2022 14:37:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7e18d3e27e8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 14:37:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6445.eurprd08.prod.outlook.com (2603:10a6:102:159::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 14:37:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 14:37:27 +0000
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
X-Inumbo-ID: 290ff155-56ce-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KjfBU9iAHsrpl3NmGUlYNF0xABg8G/jDOXuIWCpBjn/oMdbUXm/egz63yYg1xrYcLAVORCjS78ySn+A4vfA91CK9KTe57Hy77oIodR3stz4f1hVZqciHWCQQlHGmm9jurEeZGnmmxbW+pB8Mp70XiyX808yBQ13jB9CksAMFcclDkxE7V8sdPMcPJKKhX8TBhmykJoITU50YvtZwFGvh1WdGkJ2TI669JHHtM/bxxwo1VK8RXqDN7mK7fz/4ua24E374i1x365cCJi6gaMnQZvSaT6BP5IkBVFRroDL9q0bpIaan+JIxwsLu5fYOVTNB5ttyQoNCbQIA8FEHgvteyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWfkTYsuJ5wbGQNDnH4LWt7X0jxKxnQ63RSEO4E52ng=;
 b=ajcps4fbtJIMZXsQtlwc7k70oL7nvvVNAvJqG5I8zWIcDl5SCO+kRD/llPIWe0/CqkCSilcvHVAhcY4gZbjE0ZPk5P8opd6wNdQ2AifCFyISD29lVBahNXciUAvnMemEa8mK3TBJQrlUMLTepFw9xIap7pM6KUmyVkwgieMJAElHt5v91cNLO1s31AXPDtIcASnh8k8rYrOlPlTSXuVc+qvZCxR4Rc40wzK20OGZjzDqMiP0x9cz4S4y5TC97KoxLlhNiOzl9/0/euH37VkFmskCxz4bSdRbLVDqE0vSL/fg78YltPnbuY2YThhi+negqYA5sUfIEoH0Llgx+qlBoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWfkTYsuJ5wbGQNDnH4LWt7X0jxKxnQ63RSEO4E52ng=;
 b=39AKnM25HzspWrz3zpgo/hhxvJHaDyTzREvGthTsJmvrXniv7g7WzK6o7YL5619Ub6kmGdjMdtwwcCt6mthtWos9M8XhLrU3E5fAUXZrTcx38wb2z7uoDoSRLfJpZHWxOHR+eNBXNu4WdZMt5f7w9/sasb3CgJAiaz2k40aPgsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7nKfWeFZOeG9ROq19MS8yH1vRG5N6riAn7zCNvjjSEiVYyMzDjykmTGJcxJkyPYkDlD7NVfDAaL2exo1FQS3di1XNJE9HIxqAKrTsJY0nG6VlpMYGIK6U9zHABgGXz2EbP4J927Mn2Y8IwWyWkeQmaIeMoubTV9aJyVUo5MBipYMzlKKo0VwibYPLcAI9WVAb1sXB1464Vq13oGHOFXAPNNcTGgWYD+NtlBUFRlnAr3ewJZnfLpq92zPIu5nULpaHAyCbf7kSOV0hiRi30nXr39gtu6oC+K+q5K4EW4Y+n3FEncnkrnQEwKxbBiXlT74iuco/C/0F7SgIKAZbtaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWfkTYsuJ5wbGQNDnH4LWt7X0jxKxnQ63RSEO4E52ng=;
 b=AO8YaQu4TqL4LwLLfNvw8TZnJw/XwZMiVxKu/r642kWwxFioMLigHS23In2ssLJ6YrlKPmvHD7ciSD9TuHDlmkE7kerJ0UgSLihDSRggTkhnpIkA4S7xkkBFcsgIlUbUAdFM1B6ESPMiK0Q0QeSR/Wkx6chcoAbev4eI7RYWhQEy8WOzzV90nadStLVxDDXXAu4zI70agO/RUyhJHOdGpfD146uiTUDUjVqpkPHVtUJF3wkP0lPta541dTg7UuneE72nEdJKpVNe0q8kbqRe+USbc5VrhNr/lP8gcozQKqCYx5GHqfzp/0qc7+Zw10N0EJxqoO7UlCQ3O1SLBkifhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWfkTYsuJ5wbGQNDnH4LWt7X0jxKxnQ63RSEO4E52ng=;
 b=39AKnM25HzspWrz3zpgo/hhxvJHaDyTzREvGthTsJmvrXniv7g7WzK6o7YL5619Ub6kmGdjMdtwwcCt6mthtWos9M8XhLrU3E5fAUXZrTcx38wb2z7uoDoSRLfJpZHWxOHR+eNBXNu4WdZMt5f7w9/sasb3CgJAiaz2k40aPgsg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <Michal.Orzel@arm.com>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index:
 AQHY6T1V+gcJbmRqpEyt0b8GeG9bFq4grXIAgAAQCACAAFf9AIABVMyAgAAG64CAAVVJgIAAAzuAgAACBwCAAAPNgIAAE5mA
Date: Fri, 28 Oct 2022 14:37:27 +0000
Message-ID: <2981F6DC-444B-49DE-9D01-C0093A32E68F@arm.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
In-Reply-To: <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB6445:EE_|AM7EUR03FT053:EE_|PAXPR08MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb862eb-bea1-4353-5586-08dab8f205fd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sUp51CVjW9ZVTYroOdBj3DeAIoc/cNRc70V3wH3wvc1X3V//MzxhdfL0RDUF6mGqIciCXfDgLrl2nGnYOkNWeORHwC8qvdJrGF/UpQMsZEzdf6a/3N6wCUFseKNB3NY456BvrbP6BKKi20hUZbeqzK2h1hUESDoK2v+fU1PaGf2bS1Vchim3h/YMLO1A4+GZXVfAAXzz113RYfWnjOOorv5WI3Bw7JRhiJcGS8Fmju5nRsPtVWY6A0wsVbseWVn4EjOhtTRV0MvIVuNBGrtSopkRsmQzMMTSfJro1HnaJadQpO+X4uPuikgAzFG2u9+G4MJHooz044KiUzbKqEjeotlGUxPOwYrt71Q5lkY3Tlz6k5KCj8mlTA9Ph23GcfWbTNRXnaDGRIAv9gFO7QlF1Vx9Uuz9Ilh2FdKfWDlnWLV+QIs7GGbqjTp7XcA7ObVrf1dRxh1n4XJgmsQ1kAAefBPIR5pOoyoXJXU7GfNZ47EncmTQ7DdCNFX7pyEC7kTwAzNMw3OivJQAsn5zNwK/mIbOj8NcuBclVHth9tBngYT+1MnCyKg4Jo9xuJlIl+RNAiBqlEtRs49G2pmJBsaadKgq5HcfKbI7LAoMRrqqGldKL5aqbe2r05hnbPtPeRSoJLCVONBZR0hBb3x6cLmlA+kxDRbtZCeyF0rqIevfjCc2kdITEemHTDM3pYIdnrh2kOsI0m7gqncx2zJZ6nHjH3H5mMsM3+KplfuhQiZogoQNu729qglZCW1DuU/WX1KL4KVSdq7YyO6YKp/ukJ21WF1U50IWJHSXwbDxYFd0t+c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(451199015)(186003)(478600001)(83380400001)(86362001)(2906002)(41300700001)(2616005)(38100700002)(38070700005)(76116006)(5660300002)(7416002)(8936002)(122000001)(6486002)(6506007)(6512007)(71200400001)(6916009)(66946007)(53546011)(26005)(54906003)(4326008)(66476007)(66556008)(64756008)(91956017)(66446008)(316002)(8676002)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFD8CE7886E567428ADAE476329CFC5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6445
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea4523f5-a750-4978-c1c0-08dab8f1efd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wNq30guCbiQVZMkDpBrWy8x6FybdBsMwT+Z8LJZVdWzi6q/SX9PSpwNuLkZ+mEoxAPBEtezTM87d7urFubcWTBiZTHDya31hWAS0VsPguv9DWopuAge6GDtThjTOsZcOvTKL5PmCVjOy4YOpvWXw2mn5rLtbT0AAoTVzqqw9xNYTJ2j22gzWtCaynkeKs/cIa58GaENkNvbouQp3mENkkVoq3r56JEvoSeVaFAr/XfOWdP8KLQ+CHiETxe0VyBvjnHGGLsAkRPQUvtJrVChIRc7eIuhyP1PPjb80SIF9qtVGC6FJ2yiSVdF2u5aS1LN7Gq//mG10/kdYeXSx8Dr2Zow6EHVXWjTZX/YtN8CthaYA0PhwODy09SwEh2SHFwOh8qOq0mbuz00DXyD/DtkJCgOc/UuDimtKy/LqhEN/hsGJ83YM9CAdUEuxevrNmqZc0Wc7erWpXLu+MhvMVgW2BCU3KkQipZIEj+NIXz9pqV7acf7VYYAqgn/9baFUzTizTPjgV1rvHxEr1cILGjr6S+b0RCUVNj4LeVScIKnkQm6VBFMSDDhuNFSJg27iqiVhHqQkMrk8tFyFcUbQ+HLznB0wLpMBl/eFMsCebJgOOkvd+/7BHFFIfT10HCUOHCr6IV/9rb2FAKMlMcoYaIUrDa/MqPAWYw8uYPBm93YWszH5AZOMa2LXvlcrpvnIZalyj+um6TjZB7Zlzj3ndakTgIbToT347kLr5Sbh/689TO1+HCwtXVigrPXKE0kAZdCry8Nff6WVdFVeXZs+eYqPxw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39850400004)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(81166007)(54906003)(356005)(478600001)(83380400001)(8936002)(8676002)(4326008)(70586007)(36756003)(41300700001)(2906002)(70206006)(40480700001)(6486002)(33656002)(6862004)(336012)(6512007)(186003)(40460700003)(47076005)(2616005)(5660300002)(36860700001)(107886003)(86362001)(53546011)(82740400003)(316002)(6506007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 14:38:04.7650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb862eb-bea1-4353-5586-08dab8f205fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6591

SGkgSnVsaWVuLA0KDQo+IE9uIDI4IE9jdCAyMDIyLCBhdCAxNDoyNywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDI4LzEwLzIwMjIgMTQ6MTMs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBCZXJ0cmFu
ZCwNCj4gDQo+Pj4gT24gMjggT2N0IDIwMjIsIGF0IDE0OjA2LCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBSYWh1bCwNCj4+PiANCj4+PiBPbiAyOC8x
MC8yMDIyIDEzOjU0LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+PiBGb3IgQUNQSSwgSSB3
b3VsZCBoYXZlIGV4cGVjdGVkIHRoZSBpbmZvcm1hdGlvbiB0byBiZSBmb3VuZCBpbiB0aGUgSU9S
RVEuDQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gU28gY2FuIHlvdSBhZGQgbW9yZSBjb250ZXh0IHdo
eSB0aGlzIGlzIG5lY2Vzc2FyeSBmb3IgZXZlcnlvbmU/DQo+Pj4+Pj4+PiBXZSBoYXZlIGluZm9y
bWF0aW9uIGZvciBJT01NVSBhbmQgTWFzdGVyLUlEIGJ1dCB3ZSBkb27igJl0IGhhdmUgaW5mb3Jt
YXRpb24gZm9yIGxpbmtpbmcgdk1hc3Rlci1JRCB0byBwTWFzdGVyLUlELg0KPj4+Pj4+PiANCj4+
Pj4+Pj4gSSBhbSBjb25mdXNlZC4gQmVsb3csIHlvdSBhcmUgbWFraW5nIHRoZSB2aXJ0dWFsIG1h
c3RlciBJRCBvcHRpb25hbC4gU28gc2hvdWxkbid0IHRoaXMgYmUgbWFuZGF0b3J5IGlmIHlvdSBy
ZWFsbHkgbmVlZCB0aGUgbWFwcGluZyB3aXRoIHRoZSB2aXJ0dWFsIElEPw0KPj4+Pj4+IHZNYXN0
ZXJJRCBpcyBvcHRpb25hbCBpZiB1c2VyIGtub3dzIHBNYXN0ZXJJRCBpcyB1bmlxdWUgb24gdGhl
IHN5c3RlbS4gQnV0IGlmIHBNYXN0ZXJJZCBpcyBub3QgdW5pcXVlIHRoZW4gdXNlciBuZWVkcyB0
byBwcm92aWRlIHRoZSB2TWFzdGVySUQuDQo+Pj4+PiANCj4+Pj4+IFNvIHRoZSBleHBlY3RhdGlv
biBpcyB0aGUgdXNlciB3aWxsIGJlIGFibGUgdG8ga25vdyB0aGF0IHRoZSBwTWFzdGVySUQgaXMg
dW5pcS4gVGhpcyBtYXkgYmUgZWFzeSB3aXRoIGEgY291cGxlIG9mIFNNTVVzLCBidXQgaWYgeW91
IGhhdmUgNTArIChhcyBzdWdnZXN0ZWQgYWJvdmUpLiBUaGlzIHdpbGwgYmVjb21lIGEgcGFpbiBv
biBsYXJnZXIgc3lzdGVtLg0KPj4+Pj4gDQo+Pj4+PiBJSE1PLCBpdCB3b3VsZCBiZSBtdWNoIGJl
dHRlciBpZiB3ZSBjYW4gZGV0ZWN0IHRoYXQgaW4gbGlieGwgKHNlZSBiZWxvdykuDQo+Pj4+IFdl
IGNhbiBtYWtlIHRoZSB2TWFzdGVySUQgY29tcHVsc29yeSB0byBhdm9pZCBjb21wbGV4aXR5IGlu
IGxpYnhsIHRvIHNvbHZlIHRoaXMNCj4+PiANCj4+PiBJbiBnZW5lcmFsLCBjb21wbGV4aXR5IGlu
IGxpYnhsIGlzIG5vdCB0b28gbXVjaCBvZiBwcm9ibGVtLg0KPj4gSSBhbSBhIGJpdCB1bnN1cmUg
YWJvdXQgdGhpcyBzdHJhdGVneS4NCj4+IEN1cnJlbnRseSB4bCBoYXMgb25lIGNvbmZpZ3VyYXRp
b24gZmlsZSB3aGVyZSB5b3UgcHV0IGFsbCBYZW4gcGFyYW1ldGVycy4gVGhlIGRldmljZSB0cmVl
IGlzIG9ubHkgbmVlZGVkIGJ5IHNvbWUgZ3Vlc3RzIHRvIGhhdmUgYSBkZXNjcmlwdGlvbiBvZiB0
aGUgc3lzdGVtIHRoZXkgcnVuIG9uLg0KPj4gSWYgd2UgY2hhbmdlIHRoZSBtb2RlbCBhbmQgc2F5
IHRoYXQgWGVuIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycyBhcmUgYm90aCBpbiB0aGUgY29uZmln
dXJhdGlvbiBhbmQgdGhlIGRldmljZSB0cmVlLCB3ZSBzb21laG93IGVuZm9yY2UgdG8gaGF2ZSBh
IGRldmljZSB0cmVlIGV2ZW4gdGhvdWdoIHNvbWUgZ3Vlc3RzIGRvIG5vdCBuZWVkIGl0IGF0IGFs
bCAoZm9yIGV4YW1wbGUgWmVwaHlyKS4NCj4gDQo+IEkgdGhpbmsgbXkgYXBwcm9hY2ggd2FzIG1p
c3VuZGVyc3Rvb2QgYmVjYXVzZSB0aGVyZSBpcyBubyBjaGFuZ2UgaW4gdGhlIGV4aXN0aW5nIG1v
ZGVsLg0KPiANCj4gV2hhdCBJIGFtIHN1Z2dlc3RpbmcgaXMgdG8gbm90IGludHJvZHVjZSBpb21t
dV9kZXZpZF9tYXAgYnV0IGluc3RlYWQgbGV0IGxpYnhsIGFsbG9jYXRlIHRoZSB2aXJ0dWFsIE1h
c3Rlci1JRCBhbmQgY3JlYXRlIHRoZSBtYXBwaW5nIHdpdGggdGhlIHBoeXNpY2FsIE1hc3Rlci1J
RC4NCj4gDQo+IExpYnhsIHdvdWxkIHRoZW4gdXBkYXRlIHRoZSBwcm9wZXJ0eSAiaW9tbXVzIiBp
biB0aGUgZGV2aWNlLXRyZWUgd2l0aCB0aGUgYWxsb2NhdGVkIHZpcnR1YWwgTWFzdGVyLUlELg0K
DQpPayBJIHVuZGVyc3RhbmQgbm93Lg0KDQo+IA0KPiBFYWNoIG5vZGUgaW4gdGhlIHBhcnRpYWwg
ZGV2aWNlLXRyZWUgd291bGQgbmVlZCB0byBoYXZlIGEgcHJvcGVydHkNCj4gdG8gcmVmZXIgdG8g
dGhlIHBoeXNpY2FsIGRldmljZSBqdXN0IHNvIHdlIGtub3cgaG93IHRvIHVwZGF0ZSB0aGUgImlv
bW11cyIuIFRoZSBsaXN0IG9mIGRldmljZSBwYXNzdGhyb3VnaCB3aWxsIHN0aWxsIGJlIHNwZWNp
ZmllZCBpbiB0aGUgY29uZmlndXJhdGlvbiBmaWxlLiBJT1csIHRoZSBwYXJ0aWFsIGRldmljZS10
cmVlIGlzIG5vdCBkaXJlY3RseSBpbnZvbHZlZCBpbiB0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUg
Z3Vlc3QuDQoNCkJ1dCB3ZSB3aWxsIGdlbmVyYXRlIGl0LiBIb3cgd291bGQgc29tZXRoaW5nIGxp
a2UgWmVwaHlyIGd1ZXN0IHdvcmsgPyBaZXBoeXIgaXMgbm90IHVzaW5nIHRoZSBkZXZpY2UgdHJl
ZSB3ZSBwYXNzLCBpdCBoYXMgYW4gZW1iZWRkZWQgb25lLg0KDQo+IA0KPiBTbyBmYXIsIEkgZG9u
J3Qgc2VlIGEgcGFydGljdWxhciBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2ggYmVjYXVzZSB0aGUg
dk1hc3RlciBJRCBhbGdvcml0aG0gYWxsb2NhdGlvbiBzaG91bGQgYmUgZ2VuZXJpYy4gQnV0IHBs
ZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgdGhpbmsgdGhlcmUgYXJlIGJpdHMgSSBhbSBtaXNzaW5n
Lg0KDQpJIGFtIGEgYml0IGFmcmFpZCBvZiB0aGluZ3MgdGhhdCBhcmUg4oCcYXV0b21hdGlj4oCd
Lg0KDQpGb3IgZXZlcnl0aGluZyBlbHNlIHdlIGxldCB0aGUgdXNlciBpbiBjb250cm9sIChJUEEg
Zm9yIG1hcHBpbmcsIHZpcnR1YWwgaW50ZXJydXB0IG51bWJlcikgYW5kIGluIHRoaXMgY2FzZSB3
ZSBzd2l0Y2ggdG8gYSBtb2RlbCB3aGVyZSB3ZSBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBhIHZN
YXN0ZXIgSUQuDQpXaXRoIHRoaXMgbW9kZWwsIGd1ZXN0IG5vdCB1c2luZyB0aGUgZGV2aWNlIHRy
ZWUgd2lsbCBoYXZlIHRvIGd1ZXNzIHRoZSB2TWFzdGVyIElEIG9yIHNvbWVob3cga25vdyBob3cg
dGhlIHRvb2xzIGFyZSBnZW5lcmF0aW5nIGl0IHRvIHVzZSB0aGUgcmlnaHQgb25lLg0KDQpDaGVl
cnMNCkJlcnRyYW5kDQoNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFs
bA0KDQo=

