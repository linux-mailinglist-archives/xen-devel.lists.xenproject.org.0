Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1558AA7C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 14:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381105.615633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJw5H-0006CF-LC; Fri, 05 Aug 2022 12:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381105.615633; Fri, 05 Aug 2022 12:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJw5H-00069P-Hf; Fri, 05 Aug 2022 12:05:43 +0000
Received: by outflank-mailman (input) for mailman id 381105;
 Fri, 05 Aug 2022 12:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34eQ=YJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oJw5G-00068Y-3G
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 12:05:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20045.outbound.protection.outlook.com [40.107.2.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec63fd40-14b6-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 14:05:40 +0200 (CEST)
Received: from FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::17)
 by VI1PR08MB4559.eurprd08.prod.outlook.com (2603:10a6:803:100::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 12:05:37 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::7f) by FR0P281CA0053.outlook.office365.com
 (2603:10a6:d10:48::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Fri, 5 Aug 2022 12:05:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16 via Frontend Transport; Fri, 5 Aug 2022 12:05:36 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Fri, 05 Aug 2022 12:05:36 +0000
Received: from cc54504fab03.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75CC43E4-BFFA-488E-91C3-772C8E4C703C.1; 
 Fri, 05 Aug 2022 12:05:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc54504fab03.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Aug 2022 12:05:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8470.eurprd08.prod.outlook.com (2603:10a6:10:406::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Fri, 5 Aug
 2022 12:05:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 12:05:23 +0000
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
X-Inumbo-ID: ec63fd40-14b6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Kh91LmvjidxXvabeeFSL5uqWurR+zgCVP9fHFN2dsEGRbqUdnQtjGJjM29KwRuPjs9lr92GM1kI9AvhZHfnLCL784NkgZOHMQQXFjr8oSnhl79SRBb8xCGyan57Xse3arc8fs95ysgQ6ir//ywF0UYlFodApUeBJtuslo8zskGB7qwwBhAx89aaB8mMq/Xpy48B4H49Jb5noDJtgg66qquF9OjRLyftcD78igAQGtLAavoaFsR7PYUjRMJ3IwiLvZjQQzy/V2HcsCJ7kVjbT1ThNpj+kGAeXw6btyPNwFv2v5Yq9TauDQqXoYw+ZkacAEa8dMJfwRBmkVFx4ol8bwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXNlIwD4rqRziOLZr0CUjujEfSVSItRtbleORrE8oF4=;
 b=PFYSUzfkEYPTolnMFmxS/3yeeH6J8Xci4ubDBw0ZicTtMUoeQ/u/ox39LwLCUX2sNlKaKtjRuU5khE02hHjKCaac/PXhsC5AL2ecXx8Mm9d+GPDuEzP9OYhJgdC4sIFQw5nEEX3jvePf4DIu8zme7KQyU6r4LMMpg0AXlVZylveZu0uES5seb7CDXv1gcANg+7Q1CYOWHDHHQGPToGey31sNHbjDEJ7ABpQk/lapD4P5cqfDJnNktdsHP0kLrkLm3a24LS5yw40CCQY46/KafHRnFx9WpGGrsRPos5BPb3LfL7WH/zcOhMhFMbMkxTOT9/cD4pzqi/Go6wqtJdqnng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXNlIwD4rqRziOLZr0CUjujEfSVSItRtbleORrE8oF4=;
 b=v3gJUTkDtxBGCmaxB4MP81N+G0lwg5QFB4KMBMJFZZDK4LaJePIf9T3+XZTuXkvRz/+vH6RvgW75YlWTVhKZATyVSaWD8+NHs9zl257+cIlf3SiWvE6QEUbdEPGjVm5z5bb1F9BhkOc5W2MnFUWRT/hT18Owj1RKv6gCC2ya2tI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20023080a0a20548
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwmrPU8Am4DrBXexY29pUyquN9Xtlt6fsgjAxZFPLHmGGefT0o11A5d+XichKPJICXbCpSqFAZyNAMUj/VjP6VgkUg8yj7GLcAXgMYXrnS4N3NRZLZHWehKKY3LxDAmoCaIQvipuoz2gM1oKz5BP7rg7sc0hL+k9ffAT+P4r2X/I8pgiQC+1p8CO0tvHi9YlolKO1b37FQEcLEWyH1YglXu9qIawPYtjy0XS3ww135qFZN/EDItMWW/cpW0jXU00X+L6jjizO+NjzGeVQuPCTempGDjtWSI8+hCkM5PMsx+7EqCA+M57qRfoQAlufrIL43tUW0gfYqM0875/P2ySwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXNlIwD4rqRziOLZr0CUjujEfSVSItRtbleORrE8oF4=;
 b=Myxvdf/GthqsFOHraW8sfOJ8VpibvoQFCm1/O7rQNr/0l8EfN+v08ySVWsDen10IsjaESvAvE6Mdg7LakCqCoRieeyKa4HZz+Cr3r6V0ToiirTV+Gus9jwILPhgBKounn6rto35pSBq04Y4SR8K5uFnsdOVnYRgUnCcmPlJJqqp3EeROMXKRzpXbj/g0JTHCshgCPOI8klMyvpW73Zx1zdLa1ksK/IlniMZY1xWMaayNALAGfhWa7C9v6YFmVL03PkjX5urb+dtN/3dQ1FEMGsyC7vt4lgFyE8Y3aqt3ybp6j/CaeXbwlxauPtg+cuSoQUOzSDStkWQScU65ZQwRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXNlIwD4rqRziOLZr0CUjujEfSVSItRtbleORrE8oF4=;
 b=v3gJUTkDtxBGCmaxB4MP81N+G0lwg5QFB4KMBMJFZZDK4LaJePIf9T3+XZTuXkvRz/+vH6RvgW75YlWTVhKZATyVSaWD8+NHs9zl257+cIlf3SiWvE6QEUbdEPGjVm5z5bb1F9BhkOc5W2MnFUWRT/hT18Owj1RKv6gCC2ya2tI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Peter Griffin
	<peter.griffin@linaro.org>, Jerome Forissier <jerome.forissier@linaro.org>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Topic: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Index: AQHYp9oMDnfnppRN40WNR+bqQStYIa2gMcaAgAAFzAA=
Date: Fri, 5 Aug 2022 12:05:23 +0000
Message-ID: <EA8A294E-856D-4579-B26E-55F6B7EB477C@arm.com>
References: <20220804081253.GA1219098@leoy-ThinkPad-X240s>
 <D6DDAE40-A8EF-4230-A292-401FBA085EE0@arm.com>
In-Reply-To: <D6DDAE40-A8EF-4230-A292-401FBA085EE0@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 33acfad1-6a7c-4890-8e54-08da76dacebf
x-ms-traffictypediagnostic:
	DU0PR08MB8470:EE_|VE1EUR03FT045:EE_|VI1PR08MB4559:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jjKC9sw26RcwHB7lozlpQx6K3b6xXeQzXHDHI9H+A+CXcvkmfV+lWrx2foyu+imuGVUZ3oqBpS7NVJCsW/0WLMS5ZvOc7d+sFdgLQTmNo8qrvGP7Oq3NGLKByeafb5oStDU0o/OtbhZLhbR+qN4fsBac5shvkh+NI050C7CYa9mHgsqIImWXQCcp+4JIJUoll0nEnsNfi+0dtXo7vutcF7IMNUXyZnEYIPqJLG7bivtSJww327z7j2uqnkR1eEzen7SkFjNpKkzmLkhk+kLPp3WfUggdX7SVlu4tDeiwvz03XbQl1k85O3Z6rMP+Py1qFWL9NMIWLJVvQtp9FdSqMdIC8YogI9WUp8nf3gfQ6VzuBQ/o0WeboOIvRWThMUFnihUo73012HVTGv55x+pj5L7WjTsjmV2yVt7zLRXTgyP2YkyFpZWM8d2aNcDgFrBa0VHtiCZsj8Dyzvmup4F5EE8N8cnbQWCWAkWE7WeJhF1B9kdKFpdbuS3HIQPRkMEBYOON18xco8Uq2HX38asE3LhuCMOmYpqHQAlB2bDZF6wii9VWcZMrgOWITeJfgsNU8O+HP7Iv45iCteXnZ9yICH7IMCsMCL7yYGMJxODN2rvVYykw5nhQJlQd+b0k7wpWCFf2P0Skbyc/tNDmSdysQqAkLpPmt7lF85XpEVzoxwCpljVSY677HUXY1jUxVmJZsNrIHsvsoCjj6s81EkUz4DUbCJ9zN5R5peZpT3nVHpv7JXilZdiZsPtoSI+OIbHnUT7Fdi1ZncqbjEy6h0jkYk97C1pTUxzbVaRQnIJBu1CFvqYCtgdGuSpTr793XIm9GkmVE9FtzKeuSY4skmPBbA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(478600001)(2906002)(64756008)(2616005)(6486002)(66446008)(83380400001)(91956017)(8676002)(186003)(36756003)(26005)(71200400001)(4326008)(33656002)(6512007)(5660300002)(6506007)(76116006)(53546011)(38100700002)(66946007)(45080400002)(86362001)(66556008)(38070700005)(122000001)(6916009)(54906003)(316002)(8936002)(66476007)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFAE786890DA60409799899A0273F717@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8470
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	405a6d48-01a7-49cf-a2d6-08da76dac6ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z4iM8dGCroM+ovT0qcRrixB/2uW1RT5ZEzdDr+xKyYSAUFbXAOhrglHtrVNRlLQehvLpMh5dcuYlhNimSJyl/nqtxtY5ueo4hcwxFVNY5uKy1d3iAup7oR6dV/49gT4iMR5caDytzVeCyDW3haxWQsFXwhE8yggzoR4G4JNrs3AWtrSKvPEiiP15OUGefJwtr7Ztm+c8qF1Hmj8D4kfEs40pTcFe38tI0yekIcrq1Jdu0Bw54IXY+XOBm9hlfJVd7nCVZcTfZDCqYv+Hp0+qvo78Ut4hooAvg3S1hI3a/lKMw09dynUXafmHUqLAljrOBlu0zZoynJX/H6dAL3b1yueRP8Ppn9K899bCrx/3mwR6lkNETs7xvq6nWkNj2eT+IvqxpamknHgQpWLCvdGRrqCuK2EB51Bzrtpe+tC1ApTeo9vU3/IhVrVsqfm/fIphFTJGjRfPfpgRp5wQ0Hz1b4I5RbosUlDWYOtpBmiUcqZOSHHE0ktfLqBkp3gcyBKpLBGUNk5dBsVlov8CTG4AwdA45qznj8hGCnP/iTw+wzte59wREZuLdU6U074Tu1WQAy9zp53yZQiWU2o4rqcoJEoj7u/zV+jFeqK4XQShZNTSk23vq6L8cwlHnF2OSwh/Vri+5CoUzEvjXrGyvlfaL+nBBVRoaS1qU4jcIG1kCNVz22UMK7nbKKWjw7AOUU8OHxCZ6ps/ZHUOi59fhzAbOsl+9pQPjzp+EauIoSPD6dDh8yeRSdRPMO5TvPsqCtoJCLbbC/2DF4QmCKfOjdDcdU6+ralqS6DyGmwnRQ0KaLcpyNcoTMbu9jEANg0j0028
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(36860700001)(82740400003)(6486002)(2906002)(5660300002)(82310400005)(33656002)(41300700001)(26005)(478600001)(6512007)(53546011)(6506007)(8936002)(6862004)(36756003)(83380400001)(81166007)(316002)(356005)(45080400002)(54906003)(186003)(2616005)(40480700001)(86362001)(8676002)(4326008)(70586007)(336012)(70206006)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 12:05:36.8816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33acfad1-6a7c-4890-8e54-08da76dacebf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4559

HI Leo

> On 5 Aug 2022, at 12:44, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Hi Leo,
>=20
>> On 4 Aug 2022, at 9:12 am, Leo Yan <leo.yan@linaro.org> wrote:
>>=20
>> Hi there,
>>=20
>> Now I am working on Ampere Altra SoC platform, with Xen (4.16) and Linux
>> kernel (5.15.23).
>>=20
>> I observed a warning is reported by Linux kernel in the booting flow:
>>=20
>> [    0.403737] ------------[ cut here ]------------
>> [    0.403738] WARNING: CPU: 30 PID: 0 at drivers/irqchip/irq-gic-v3-its=
.c:3074 its_cpu_init+0x814/0xae0
>> [    0.403745] Modules linked in:
>> [    0.403748] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W      =
   5.15.23-ampere-lts-standard #1
>> [    0.403752] pstate: 600001c5 (nZCv dAIF -PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
>> [    0.403755] pc : its_cpu_init+0x814/0xae0
>> [    0.403758] lr : its_cpu_init+0x810/0xae0
>> [    0.403761] sp : ffff800009c03ce0
>> [    0.403762] x29: ffff800009c03ce0 x28: 000000000000001e x27: ffff8807=
11f43000
>> [    0.403767] x26: ffff80000a3c0070 x25: fffffc1ffe0a4400 x24: ffff8000=
0a3c0000
>> [    0.403770] x23: ffff8000095bc998 x22: ffff8000090a6000 x21: ffff8000=
09850cb0
>> [    0.403774] x20: ffff800009701a10 x19: ffff800009701000 x18: ffffffff=
ffffffff
>> [    0.403777] x17: 3030303035303031 x16: 3030313030303078 x15: 303a3020=
6e6f6967
>> [    0.403780] x14: 6572206530312072 x13: 3030303030353030 x12: 31303031=
30303030
>> [    0.403784] x11: 78303a30206e6f69 x10: 6765722065303120 x9 : ffff8000=
0870e710
>> [    0.403788] x8 : 6964657220646e75 x7 : 0000000000000003 x6 : 00000000=
00000000
>> [    0.403791] x5 : 0000000000000000 x4 : fffffc0000000000 x3 : 00000000=
00000010
>> [    0.403794] x2 : 000000000000ffff x1 : 0000000000010000 x0 : 00000000=
ffffffed
>> [    0.403798] Call trace:
>> [    0.403799]  its_cpu_init+0x814/0xae0
>> [    0.403802]  gic_starting_cpu+0x48/0x90
>> [    0.403805]  cpuhp_invoke_callback+0x16c/0x5b0
>> [    0.403808]  cpuhp_invoke_callback_range+0x78/0xf0
>> [    0.403811]  notify_cpu_starting+0xbc/0xdc
>> [    0.403814]  secondary_start_kernel+0xe0/0x170
>> [    0.403817]  __secondary_switched+0x94/0x98
>> [    0.403821] ---[ end trace f68728a0d3053b70 ]---
>>=20
>> Looked into the code, the GICv3 driver tries to create persistent
>> reservations for pending pages, and the persistent reservation table
>> can be used by kexec/kdump.  For the persistent reservations, it
>> relies on MEMRESERVE EFI configuration table, but this table is not
>> supported by xen.efi, I think this is the reason for the above oops.
>=20
> Yes, you are right above warning is observed because Xen does not support=
=20
> memreserve efi table. I also observed a similar warning on the N1SDP boar=
d.
>>=20
>> I checked that if I boot a host Linux (without Xen), then the EFI has
>> provided MEMRESERVE configuration table, I can get below log:
>>=20
>> #  dmesg | grep MEMRESERVE
>> [    0.000000] efi: TPMFinalLog=3D0x807f9ef0000 ACPI 2.0=3D0x807fa0d0018=
 ... MEMRESERVE=3D0x807f8141e98
>>=20
>> Just want to confirm, is anyone working on enabling MEMRESERVE EFI
>> configuration table for Xen?  And welcome any comments and
>> suggestions!
>>=20

No I do not think anybody is working on this at the moment.
If you want to work on adding support for this in Xen, we can provide suppo=
rt
and help on reviewing and testing as we have several targets on which we
observe this (N1SDP and Ava).

Cheers
Bertrand


