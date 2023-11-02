Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860377DEAB2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 03:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626710.977211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyNTR-0008If-Lt; Thu, 02 Nov 2023 02:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626710.977211; Thu, 02 Nov 2023 02:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyNTR-0008GC-He; Thu, 02 Nov 2023 02:30:21 +0000
Received: by outflank-mailman (input) for mailman id 626710;
 Thu, 02 Nov 2023 02:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y1wU=GP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qyNTQ-0008G6-P2
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 02:30:20 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2ebc341-7927-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 03:30:18 +0100 (CET)
Received: from AM6PR0202CA0056.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::33) by DB5PR08MB10192.eurprd08.prod.outlook.com
 (2603:10a6:10:4a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 02:30:13 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:3a:cafe::3f) by AM6PR0202CA0056.outlook.office365.com
 (2603:10a6:20b:3a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 02:30:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 02:30:12 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Thu, 02 Nov 2023 02:30:11 +0000
Received: from 244345b635b2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3215286C-FECA-4938-A1EB-9267B3592786.1; 
 Thu, 02 Nov 2023 02:30:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 244345b635b2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Nov 2023 02:30:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9006.eurprd08.prod.outlook.com (2603:10a6:102:33f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 02:29:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 02:29:57 +0000
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
X-Inumbo-ID: c2ebc341-7927-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YN/FKm4XupnlHxv6d8srl2WU5HgDXuj6Se6m8FGoMC6k5chjoln4EC88bDyMA+lgbMEeCjNd+j6o9j8ySH8S3hpuI9PzZWgOUM4+HZ2NcHbSLlHTQWKmv9k7gwLDGT9pYIA9e5eAdRvSuM0/xr+xXxN2W/UmmdYKPZcj2ka0sprHIL2DtQIXx+yEJro2OZUMfHDTRCDlU3NxtCMgr2hbAEjVQbW4uGdq6+dd9CNVYya7UQKDfMrfZ0n6Cjnfb/tU0CtX7YMS3jESDd4MXAUiaDJLDzcNAPXDb75fGa5xj87x2lE6sVBgZ9FKmmqO2w4YBfmrWcwxzZV+9hXjCG1b8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jtxg3k86Voh2Q2GNY+hGzJPlq9sU77v95sycEcpAjQQ=;
 b=gp/dOSJnmzTI0N8RbhY+1L0MGax+4NDQqAp4LjLAn9ZOUBcLCCJRrHFznZq3TIY2N/IHsB/PrDG+E0lVKsGN2OCA56e7RR9DWaYugS/6pyc2swYWA+ENLFdsLYcB4b+hh7zORWQBN2kfBUkWnWzaJpnTL6ZGFABgj3rak2f8wwfCZyiGeSQtviwh+wG5spWV2F7UtfLVAPB0INtUr/CElooZr6nopQgyxC0Z6ZrCoAwUUyfAuclp/uTNN05dgZKbf8+To7Wdm5E6fqBqRZ4FH5HqtDaB4TdCHrJXeXMOvsmojfGVHA3P8rU7n4k8Utqh7QxbFf7cEUHKRjnL4j4a9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtxg3k86Voh2Q2GNY+hGzJPlq9sU77v95sycEcpAjQQ=;
 b=tcFjORRwLxH/gEdNGfAL7gLUk6THzknHpsGPT2iLpAUUSiLE8V6+0B0XNxXD969ga8IUEj8IyFuo68drvFpZxFqEL+idnxxIT2EUXq0YcmkMRC3CihjrhCqmfqBDSXyH6lhwE4C6RoB661RkmfQ9ejXgtkuQMje74Fe7/vwGwDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b0b99255def6662
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/TA0iMwM8/hqsha7h4PijpeVY81gqoQvOI/7kOvmcEbQlqFO0jduNKwWNf7FM+x+669laG9zGRtC+TPAJU/MwLUl6OM4ajqu/+gc/c01aKCGWN2fJadYWJB1OH3qUSmCNOIV97M9dQW9QkgcLTs86WPn8lqU75vLyjCBo8BHrXL44lUlL5m2JKQ57rlnVJsgjHXhqmqOibcAaH3hb9Etih3oyMnyeCofId5BZ+5P08byT3kXs2IGWxAmTu4jrkKduBOnlfUeeQRJNNLduc7zf39IOZRTfsgjWlC5osFe5GXyrlCT3rwncsqjjfp3T6R7qKSV4fQAdkRhn9zzic58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jtxg3k86Voh2Q2GNY+hGzJPlq9sU77v95sycEcpAjQQ=;
 b=VqGFAz2/glXxIwmTJxy8l1a7HmpcSLhE/KHwexthjxaDMn+DLpbJ4rbIDzclRfbNMKIbei6T07ilLxom3PeWhRut0vVU89MriUCuyH2ZbCwC1h7e3TZFjzWXJxOBT2ZlVF9X1EElCClRTPiXEK6ghlINdJRuI5hGQEHIadjTHi+yNmeqJ6jXH4vs3skB3K/hlA2effFNYUtKmBF4JrAy5y1eXxRDpvuxCsy3BrfIvU36nuFe1L4SJ5caL9K4fRT636xoTTBaLSFhlkD+EhZxDmwzJexmUFEK7DagGr1ZEyBHyqvPG+/qOoK4I928Ph4DtRwH5jqmfH1o/5lfZvh7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jtxg3k86Voh2Q2GNY+hGzJPlq9sU77v95sycEcpAjQQ=;
 b=tcFjORRwLxH/gEdNGfAL7gLUk6THzknHpsGPT2iLpAUUSiLE8V6+0B0XNxXD969ga8IUEj8IyFuo68drvFpZxFqEL+idnxxIT2EUXq0YcmkMRC3CihjrhCqmfqBDSXyH6lhwE4C6RoB661RkmfQ9ejXgtkuQMje74Fe7/vwGwDw=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm32: head: Rework how the fixmap and early UART
 mapping are prepared
Thread-Topic: [PATCH 1/2] xen/arm32: head: Rework how the fixmap and early
 UART mapping are prepared
Thread-Index: AQHaDRtrrldLYi71I0SBpLEDDiH4ZbBmTqoA
Date: Thu, 2 Nov 2023 02:29:57 +0000
Message-ID: <FAB1A89E-0F0A-4410-80DC-F8DD1EC8ADE6@arm.com>
References: <20231101233011.83098-1-julien@xen.org>
 <20231101233011.83098-2-julien@xen.org>
In-Reply-To: <20231101233011.83098-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9006:EE_|AMS0EPF000001A1:EE_|DB5PR08MB10192:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f83a34f-7526-4525-3d2b-08dbdb4ba3f9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IYyDajoiufnyVMSnKOAHKZRrWcRmdyrsHQS2qIjq82I6AI2zI8n/wnq7qOQ1vNO8/WSKCflnjTFQok1gJ8tOUJFFpATj1VcK2zYf3FRYe/IDmMnJ7didrKpBtfvi2RTGNL26qakfqSbDn4TvW6OBnmDw/MSl+ayo+lVvbAonh+2yzadD58tRqR1t7bxzcfosIxsqJXSevOiOcJ2KuWvJkBPQpySTJqZtgEbvwiK519AKO3pxqFlNioXrdAp180VtEbnSqYPXA2UvPFd2oCL1Z5ycUKfZdsowDEKZYhP38bwyi/Ey7UoPi+xwRJ9I9AKV6Y6rjvbpgDY0O2UDzO4hB9rCdAHxCqg/fEBAT7BOQl2BDzl9f+ybl4RE3Op9KBv0byU4P/5kXi32CYCCuKLvwbSla0VyWWKrhv6qkcqp+IthAX3NNLAsETxUU4BSptJNau7TdB/vNRZpuLDijhg09u34r38TqiL5KS9Vp9wwrXZP6elB2esPn06wX3DyPo1y0auQ1VdpB+HGPeu5WFK3GFZdWs1oduDapXg7ncyWOw9H5SxAt5hKtyVCheRSl+YqiuKr2VljgEI7TiA0NUhe60jnV8EnjtYdAWThXvH7dDArTiaoongbAeoWQww1W84sgmTiTeadMmQmemBLDyLXWg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(122000001)(38100700002)(54906003)(5660300002)(2906002)(64756008)(66446008)(36756003)(66556008)(8676002)(316002)(76116006)(91956017)(66476007)(45080400002)(4326008)(8936002)(6486002)(83380400001)(86362001)(33656002)(6512007)(6506007)(66946007)(71200400001)(2616005)(26005)(53546011)(478600001)(41300700001)(6916009)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57506DAE71C7EB47B663B9447A088FDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c543628-6c6b-4703-5754-08dbdb4b9ade
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CziTNtUrNpNyW1XDEN0VXEkDNTnvoHgFMW9xlV2QjbF0nIDRVwsUSN47Zot8DRaBXDfi4JRFqYKCjX24wmd7P9OcjbD4qvpyrItEWhVqhuU7/mgJsu8QzWda+OEWnYxgEav+wSJYsUup2YAJPxAulATyR+uUYsDfcy2jzZ2df6ANx7lZLl2m/WQm8NK8xoNArqT2XxwC2TuDzjLzt6LGfyrFKHuc39/OtXTUWZXNI6aJB/WyWEG2HuRIPaqrRe4ZaTBO0XWq8/1/+t2aNV+9f7QzJEjQ/jZAp86GOo78t/S5tMaIW/JA9AIo26OMi8N1KsNNxB74X/yTw1E4kS16GGbIJwz1wDdJTUqSE4n0yYrkp7Z+Bbgh2fdTArrZz6nJwPIo2dgSbMOypIit28/Y8VGOn2HYhY98Ey2LTYuI1HB5QsBd+5J3yi2oTyKMGhAzljKKY+l9l7g87wEn+lxgZrXEtl68ORZJtdEmJdcHdT6VslPc0CNjhfkYwb4VCkuQ2QR9vEaUy0YghhpOrNyQaPoRhRBafAjId94/rY66YFgVRuj4FvKuK60fekmrxgMWyF8qiSY5DjJiN3Leadg1eik3o9sKOz0kdomlHBqXG5wfZuAFK2gdhUAN8Nj5OwyBJoqfNamRQwYtkjiUKZFtMimRABvLQdTw/5j9EedU12sxBP50oEKIaTGmUdr1NvZp0GAggQWEO4wLDxVNYi2exJI17bqBg61qH7wnMw8TdirVJJ50/VmrxG6p/KZQ8tKa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39850400004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(40480700001)(36860700001)(6506007)(53546011)(45080400002)(478600001)(81166007)(356005)(83380400001)(47076005)(40460700003)(336012)(2616005)(107886003)(6512007)(33656002)(41300700001)(86362001)(2906002)(8936002)(8676002)(6862004)(4326008)(5660300002)(36756003)(54906003)(70206006)(70586007)(316002)(26005)(82740400003)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 02:30:12.2638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f83a34f-7526-4525-3d2b-08dbdb4ba3f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10192

Hi Julien,

> On Nov 2, 2023, at 07:30, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Since commit 5e213f0f4d2c ("xen/arm32: head: Widen the use of the
> temporary mapping"), boot_second (used to cover regions like Xen and
> the fixmap) will not be mapped if the identity mapping overlap.
>=20
> So it is ok to prepare the fixmap table and link it in boot_second
> earlier. With that, the fixmap can also be used earlier via the
> temporary mapping.
>=20
> Therefore split setup_fixmap() in two:
>    * The table is now linked in create_page_tables() because
>      the boot page tables needs to be recreated for every CPU.
>    * The early UART mapping is only added for the boot CPU0 as the
>      fixmap table is not cleared when secondary CPUs boot.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> xen/arch/arm/arm32/head.S | 48 ++++++++-------------------------------
> 1 file changed, 9 insertions(+), 39 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0ca..fec2433e568f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -183,12 +183,16 @@ past_zImage:
>         bl    check_cpu_mode
>         bl    cpu_init
>         bl    create_page_tables
> +        /* Add the UART mapping if requested */
> +#ifdef CONFIG_EARLY_PRINTK
> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
> +        create_mapping_entry xen_fixmap, r0, r11, type=3DPT_DEV_L3

I tried to test this series today and found a corner case in this patch:

If we build Xen only with this patch, and CONFIG_EARLY_PRINTK=3Dy, we
will get below from compiler:

```
arch/arm/arm32/head.S: Assembler messages:
arch/arm/arm32/head.S:189: Error: bad instruction `create_mapping_entry xen=
_fixmap,r0,r11,type=3D0xe73'
make[3]: *** [Rules.mk:253: arch/arm/arm32/head.o] Error 1
```

With the second patch applied, the above error will disappear and I confirm
arm32 will work fine with both patch applied + either CONFIG_EARLY_PRINTK=
=3D{y,n}.

Kind regards,
Henry





