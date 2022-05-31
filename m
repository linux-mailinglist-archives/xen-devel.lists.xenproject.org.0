Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB265392FE
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 16:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339674.564557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2df-0001Ak-6C; Tue, 31 May 2022 14:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339674.564557; Tue, 31 May 2022 14:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2df-00017e-2Y; Tue, 31 May 2022 14:14:27 +0000
Received: by outflank-mailman (input) for mailman id 339674;
 Tue, 31 May 2022 14:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nw2dc-00017X-E7
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 14:14:24 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe08::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f77fd89e-e0eb-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 16:14:21 +0200 (CEST)
Received: from AM6PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:20b:c0::14)
 by PAXPR08MB6830.eurprd08.prod.outlook.com (2603:10a6:102:130::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 14:14:20 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::e1) by AM6PR08CA0026.outlook.office365.com
 (2603:10a6:20b:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 14:14:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 14:14:19 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Tue, 31 May 2022 14:14:19 +0000
Received: from 6233080cacf7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 50E14D55-93C9-4914-98C6-957D1342AB10.1; 
 Tue, 31 May 2022 14:14:12 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6233080cacf7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 May 2022 14:14:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8100.eurprd08.prod.outlook.com (2603:10a6:150:7a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 14:14:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 14:14:10 +0000
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
X-Inumbo-ID: f77fd89e-e0eb-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LPgRh4zBhc8MZ1M1wpJgcdi7hhM5fDFu1oaGkBvmpOglVlE0cSjHvd91Qv9zTAqOdS2SjXtjHwuMLEWYzfq/E1D7eiHHcv5/kQu8rmIWwsradcSwtnAbQ1xGJSdnE62wuMcWTojlrnV4GTn1sqnsVT8tkRTV5/9lGp1DqQMhOujtRToG6fq6Fdx6fBpjdGrPpCVt3cHPyWYaPzggxpXokLqpSdbevPQ1n40matwojlNadGKgYOdQYqJaHI7Us8WgsuU2VMXTW4NWyspxZjQCdgilH1XREhUOIs9UakT/g7Ru4e/6Hqt34GaagJSqzBVfXpJtO3B583+6duBoYNLJ6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxHEcgMM49qBHPljpDfj5LGFJA9osm1VHxdl5+Cmsb8=;
 b=lotoNgrF8JD0hA6fkkhny8QGCNl51XceVoRdrG2AWFzGbaQQN2PPs+HKYEm43SYk6m2U45FmP6OTmB7t1e8THsDY/egw3h7ORGaNeedgEz2N8bgc+Ct0mzoBLKIvEMZkeE0GUch7/GClcKrNKVRJ3LxacaKwEkBMi4w9aK5JnqU/FSdAnW857YHD+Oc2mUTPxu/hzmS6eMOskvJ8Fp5tKpdtls3TPEB+21NQ9k1wT823B2ITYbL/U2vcLEROTzInhTlBqxDine+hdLLnYfiJgexUA8T/56sw6fJVU0VK1cKisuH+1RLmXg6MaI0bgYXnQGVyMnt4r9G4cL7SVcXp5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxHEcgMM49qBHPljpDfj5LGFJA9osm1VHxdl5+Cmsb8=;
 b=mT8jIrrcjhqIhUkCQMHMmkT0mmfuTPbTId6TjKgVOTdqkMaTHvzrghSNxtH1SFnHcPsk0CvAi5A2AkQPX7FEX+up8NsV4zz0Li51HcKD3RDRyEdew062Ysj5YZ/psec5vVFmLRnGbqAAixeyhnCxGwopiwD0OJs+i2jaR9LwMxE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d39288f946aac56
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1cs0bA1goyIJ16z+BO58BZGZ/qxQqppKLo9GiUiTJho2BfbwZF20K/JUwjRAutFipZvGXjB+WFAEoSLxdS7229jQ3Lm4VF5A+WdqoiVX3Piw0CmLtKMduTufYB0wqX9yPmlFC14UlTg2DTgOjLnPpUJprdZCet0+/NU0BFbBB+ydP6AoPMsAlLyT/kxHXgsGNkngwVZhIwLP8Sgnv5aySPVkkbZjkybUBdQJPoK5/7E3GHB9TaR50j2Q54Mw1gqDrpzDdaszkXn8FZoWWBi7OmvKGuPcrS832oGjn/mqlkrSfZejKjCsYAMCmnfi5es05N61EC8wXDeJmnyYtoeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxHEcgMM49qBHPljpDfj5LGFJA9osm1VHxdl5+Cmsb8=;
 b=WWtRE7PZ3FpbMERuqxlcu25D/uNLxHrVJanriJMCytwAhhHhTmp1nHWkHa5MHnfRXT1YFQ4VSuisFH8raZgb5lfbwJPLQnoiKSgwWEizm1JxkjcQE4bJrOwIPd2rirHvM7xyd3fUNedI7HrrWX31GwwuiBZi9WQjRCRZfPErlhDTQT6Y99kboqUBuzhQFVJnIZB90haxUJ3q726Z8LwNSLBzjip1SqKgMt+DT5lujBuDtDztUrNgi5XLEEDhR1/4Yom9kEKUmADoIOsV6eYU3fU+nnKW4lH6nQhWETV/9/5WKmJ9APpXqsQRHUt6Y4OSLK3zUmfkpS1sWbEJdSUT2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxHEcgMM49qBHPljpDfj5LGFJA9osm1VHxdl5+Cmsb8=;
 b=mT8jIrrcjhqIhUkCQMHMmkT0mmfuTPbTId6TjKgVOTdqkMaTHvzrghSNxtH1SFnHcPsk0CvAi5A2AkQPX7FEX+up8NsV4zz0Li51HcKD3RDRyEdew062Ysj5YZ/psec5vVFmLRnGbqAAixeyhnCxGwopiwD0OJs+i2jaR9LwMxE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Add MISRA support to cppcheck make rule
Thread-Topic: [PATCH] xen: Add MISRA support to cppcheck make rule
Thread-Index: AQHYdPKgb8OwohyX90ebe0mOYdpVU605ANEAgAAGrYA=
Date: Tue, 31 May 2022 14:14:10 +0000
Message-ID: <F7B128AC-3DB1-40E3-B3C0-D95CA367E766@arm.com>
References:
 <5467d017fa1c6721436e21f8cc10c5d74adeb5bf.1654002661.git.bertrand.marquis@arm.com>
 <a6e11bdb-976f-fdf4-6e07-a130980af90f@suse.com>
In-Reply-To: <a6e11bdb-976f-fdf4-6e07-a130980af90f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7fbd7ff6-346e-488d-3b00-08da430fda7d
x-ms-traffictypediagnostic:
	GV2PR08MB8100:EE_|VE1EUR03FT044:EE_|PAXPR08MB6830:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB68304EFBE6AC71CAB77EB2C79DDC9@PAXPR08MB6830.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vWT5y4T+RPFSAFTU4HUN6fVh8JEtr+7o4rlFcTA1C/KGuO3K8fFosnnZBXNdfeieaADOLyydPOR+6VfFi01zquxF1q2V+6rA1z8U3zfD+0YPUtoExmyOiDnwOHCdarP/Du4hjiuoOROLOFrw3NgFFqYql0arS3RXG0RWZ6sv391VgwBCqKJAcr+b8qZvcIvVp9N9IMp438ji/RleVoC6/IPSom1ecvv7I72tPCZY81H2mTa0FHnesS8fHIpHrqpkfWelrl76lYVRQATu1xF9H6mT4hffmBADgEBy9bpK27I2OlokcDuGMEa8Am3CXIc4tlhFJFgl8XZGRFNv90PPScyGRpDk0s0XDLIrG5JV/yikpEObX4YB9HSt6CxrTNch7T7gD+hHYjMotbTUSnvJSWn29V95+x6rs1BgaP7F39cDILA1K7gLN5FsUcs6eElHZ87vnlOfvOnYsjCEP1XQcV0uSgTBjI8WmhU1ouIml5Gxg60h2e7Pk44MFVi0AwS3R3OPCFJ3ZMwkWtthATO8jgCWIDFDjLgLHAj6kshf4ffMzY7MQxS0+Z4bCgX1qr2rFLfU3ru86o0CmyNlr+YmZdj7tPenEGKmEM62RWOnPIG+5XW27lNODGLhOnP+ey6Gvf1rOEwi2wNh5YjelGgrw0ziwt8BnqarXkyO11t56b/nXpVmQYlf883UET/3utzO8/dyGBCPyRGbdlWA4jJhwizf+nEHyjk7NMmCebqT4c+Y5ZPi2KX7UohJWSEHwWA7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(66476007)(36756003)(508600001)(64756008)(66946007)(66556008)(66446008)(54906003)(316002)(5660300002)(6486002)(71200400001)(2906002)(38070700005)(33656002)(26005)(53546011)(6512007)(6506007)(186003)(83380400001)(8676002)(4326008)(76116006)(91956017)(38100700002)(122000001)(6916009)(86362001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8DF3916E46EFD248AB662D3FFACDB7D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8100
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cc7538ad-68e8-4c78-dff1-08da430fd4ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pUpoHejbn6lN2v+c+1+CAL9SvZtdb7iVYmEMgG0/b2kC0hzhj0fLP5p93Ckw+Hyff6TisscPM3KGXsA0JoQ/3PyadQ653uU2rDtHePqWwPNtm5TFzgzIqm0FkX8wsGXBOvkKQjfht4DXYlK+H/xAgHArmtSxDkxdH6tNs2TKUOtt5g0mmImh2V8mbjtUl/LupsvGnQ9vOH2OiFWJknvETKgfYZOZM8iXgaE6EgjcSFdtr5y67hCXcICNg44BgwY1LtPnBRC/Q5TNHWdzR3ybqyP/H60b7mm5V8lJDz4esC4dzQK859s/V9f6hmaSSoM86tI1+SNGlgFRXzfqe+O4z45V9SbbCWRU2+GxFWRwu0W+UD89eDz+dzU8QVq2ddCoBO+2sHRZ2+5WP7sWozTwbVMDIlO5U7+2AKdBMcg0fcbIYset1VR/tbs9+yq2K2SIJZVl++mgs9AswJzDZ71yuXknkdjmTJhvSjof70HxsN8Tn/CbVqSXzuaGYNl/jzHdMXXbOQFoeVXJ1eikmvFxX9Dhf2cglk6HhiUV4mQHpe6kFOkz+WP/DqqkfRqFnqRCBVT1gXhJzqeg8MAYEEMQ8AM6Bv3KVMVjCt5WliASLBdh/ZG9PuRaO5Hjv53oEOrIty7mS6Bh3o6jOxV9uvc/gHGksQTSZ460lrcZ/E34QtIh+vornQjiWdIh9MOAvnxu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6862004)(2906002)(36756003)(4326008)(8676002)(36860700001)(508600001)(2616005)(70586007)(70206006)(83380400001)(5660300002)(33656002)(53546011)(6512007)(81166007)(26005)(186003)(86362001)(356005)(6506007)(6486002)(82310400005)(336012)(8936002)(40460700003)(54906003)(47076005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 14:14:19.4463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbd7ff6-346e-488d-3b00-08da430fda7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6830

Hi Jan,

> On 31 May 2022, at 14:50, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 31.05.2022 15:30, Bertrand Marquis wrote:
>> --- a/.gitignore
>> +++ b/.gitignore
>> @@ -297,6 +297,8 @@ xen/.banner
>> xen/.config
>> xen/.config.old
>> xen/.xen.elf32
>> +xen/cppcheck-misra.txt
>> +xen/cppcheck-misra.json
>> xen/xen-cppcheck.xml
>> xen/System.map
>> xen/arch/x86/boot/mkelf32
>=20
> Please can you obey to sorting here, inserting next to
> xen/cppcheck-htmlreport? Seeing that xen/xen-cppcheck.xml was added
> here by you at the same time as xen/cppcheck-htmlreport, may I further
> ask that you move that line to where it belongs as well?

Sure will do.

>=20
> Additionally I wonder if you couldn't use just one line, specifying
> xen/cppcheck-misra.* ; this could then also hold for the _clean rule
> addition further down in the patch.

Ok.

>=20
>> @@ -703,6 +716,21 @@ cppcheck-version:
>> 		exit 1; \
>> 	fi
>>=20
>> +# List of Misra rules to respect is written inside a doc.
>> +# In order to have some helpful text in the cppcheck output, generate a=
 text
>> +# file containing the rules identifier, classification and text from th=
e Xen
>> +# documentation file. Also generate a json file with the right argument=
s for
>> +# cppcheck in json format including the list of rules to ignore
>=20
> Nit: Missing full stop at the end.

Will fix

>=20
>> +# Replace current by goal in the dependency to generate an analysis for=
 all
>> +# rules we would like to respect.
>> +cppcheck-misra.json cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rs=
t
>> +	$(Q)$(srctree)/tools/convert_misra_doc.py -i $< -o cppcheck-misra.txt =
\
>> +		-j cppcheck-misra.json
>> +
>> +# Prevent parallel make issues as script is generating both files
>> +cppcheck-misra.json: cppcheck-misra.txt
>=20
> With this dependency the earlier rule should not list multiple targets
> (and it generally should not, for not being a pattern rule). If I'm not
> mistaken the way you have it the Python script would be invoked twice,
> and all you prevent is that it is invoked twice in parallel. And then
> please use $@ inside the rule. Additionally, with the script being an
> in-tree one, the rule should also have a dependency on that script
> (such that the targets would be rebuilt if the script alone changes).

I am a bit lost on the $@, previous patch adding cppcheck was changed
to use $(Q) instead. So can you justify this request ?

For the rest, thanks for the finding, I agree and will fix.

Cheers
Bertrand

>=20
> Jan
>=20


