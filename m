Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2C24D967C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 09:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290679.493052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU2jf-0006HN-DO; Tue, 15 Mar 2022 08:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290679.493052; Tue, 15 Mar 2022 08:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU2jf-0006ED-9c; Tue, 15 Mar 2022 08:40:55 +0000
Received: by outflank-mailman (input) for mailman id 290679;
 Tue, 15 Mar 2022 08:40:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG/1=T2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nU2jd-0006E4-3h
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 08:40:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dbee0fe-a43b-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 09:40:50 +0100 (CET)
Received: from DU2P250CA0023.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::28)
 by DB6PR0802MB2455.eurprd08.prod.outlook.com (2603:10a6:4:a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Tue, 15 Mar
 2022 08:40:33 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::1) by DU2P250CA0023.outlook.office365.com
 (2603:10a6:10:231::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Tue, 15 Mar 2022 08:40:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 08:40:32 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Tue, 15 Mar 2022 08:40:32 +0000
Received: from 6c3b5ba84082.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E87B0038-DD4D-4BD4-A603-C77B2D5781FA.1; 
 Tue, 15 Mar 2022 08:40:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c3b5ba84082.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Mar 2022 08:40:26 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com (2603:10a6:803:df::16)
 by AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Tue, 15 Mar
 2022 08:40:24 +0000
Received: from VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74]) by VI1PR08MB3967.eurprd08.prod.outlook.com
 ([fe80::479:b7f8:ba2a:4a74%5]) with mapi id 15.20.5061.029; Tue, 15 Mar 2022
 08:40:24 +0000
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
X-Inumbo-ID: 9dbee0fe-a43b-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQGHfPhFLIgM6vRyHj6xjcp5iy3AxVUs608c3Pon0PU=;
 b=nghOCDW2Q7wbIzKWo9zgkL9hKSXdBpNASMof24zZZGilwQ10p5nRvTT94QG3WAlMWpNSlR60AH310F1sIJxPoaTMz2IGnZSiNPoj5TsLIXhIMIBEAGc/MNSLXtHmul2YFI0tTspsUWq/tN4xCTZjqYFduXHYCDKnwFcrqeb61m0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 731868234aa37c73
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oc2d9S5kb+0ac4HAPrFGjYBb46pMqHT8NpCukp2Vma9VXpq7ZMpGg476pj1Z5eOkYitDxbszLTdUefxIIV/zaw5AI0EH8yTo5871ALENJjSAyF4NgCK2pL8T5Gt5MkfOiG6aDMxntumyJhas1HcvPmgcE1F7lux1dCosQ6rbJHzX9ns6hw5aEMxD3YP9b7Jrv1vaWokvmQ63tJa6TceKyKIS/I+uCQja77R6HBOpdFf2YWRV9YR2J2mMGKJgwgQ2QgKtTBIC6YILmorL8nw+T/nGHypX87RQsHCSO2I+mgdrwcVbtDEAQOZKvE9bItxJkaYlR+to4LnrXMu7kJ2VYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQGHfPhFLIgM6vRyHj6xjcp5iy3AxVUs608c3Pon0PU=;
 b=hjHVphlaVCOWkpXlvDTyH9lYcLKwjG01/BZV7CJk4zER1V82u9Msvq0M0tvtE7nI/EXO0+C96bAfSdnQWOa4Ei+upeTceQrHdQXChTQXvVkdukNetknBjcS92/Mmkx0MJl4x3VDh67tgaQ1WUb7xuc5gXrQFkkQfI2us9JU19kxUQAyOArsg2bNOBTUOyvcUiAbK4wYpkGhq0eFIdAKYex6Rba36/Xq4YTLxJn/gsgMkPmcQ+G/Gx8yDBhKy7mrqf8BxoR12j/XmvjIqitxoEh+zorCJbJsRj0Aq/Y5buBRnp0AuSbqnS6zDCHz4oN8F2a/Y0+XM/3HJgV+YVk2AdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQGHfPhFLIgM6vRyHj6xjcp5iy3AxVUs608c3Pon0PU=;
 b=nghOCDW2Q7wbIzKWo9zgkL9hKSXdBpNASMof24zZZGilwQ10p5nRvTT94QG3WAlMWpNSlR60AH310F1sIJxPoaTMz2IGnZSiNPoj5TsLIXhIMIBEAGc/MNSLXtHmul2YFI0tTspsUWq/tN4xCTZjqYFduXHYCDKnwFcrqeb61m0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYNKHSvTK6bj2+f02v/DWZHCtE9qy5jxyAgACrU4CAAKeKgIAFGdqAgAAriQA=
Date: Tue, 15 Mar 2022 08:40:24 +0000
Message-ID: <927CBDC0-4141-4964-84E3-8AF1ED491527@arm.com>
References: <20220310171019.6170-1-luca.fancellu@arm.com>
 <20220310171019.6170-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2203101957370.3497@ubuntu-linux-20-04-desktop>
 <A34CF75A-8139-4A4A-A1AE-3BA74E70DE55@arm.com>
 <alpine.DEB.2.22.394.2203111600330.3497@ubuntu-linux-20-04-desktop>
 <aee7dedf-3f70-da48-8be5-3d7cc9ec392c@suse.com>
In-Reply-To: <aee7dedf-3f70-da48-8be5-3d7cc9ec392c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 391e9eb8-d008-49ad-6a21-08da065f77d5
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DB5EUR03FT015:EE_|DB6PR0802MB2455:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB24554E7DDB2F9CE48514D44EE4109@DB6PR0802MB2455.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ICfke8udB8gH60liL5JBcNERVPWgctwnmd4c8yfSKkdrHSx/cMPjQSUdoYMPxD185O8uV5nrGJFVM2EHOPulfPYeY1c6zJPoaabUgNqbQeeG0XOosBta9BDHPy0N2+iWkZyNyDo6dmo9SOr5VAhx4g/rn7dbFgQEjToKRBOE3CpuHWu0GEyD1kOxxsbNNbjLNqeMYJ8LFdzT3U51huwlGZ2EuoglNayPAAg8COsKLjvaGyLZiyhZrvcv+BKYb6cLQ5GtUxbEET5FddxNKwf/wPm36WQLSVq+csUBFILSuCIZgc5D78y0MHodQD7y7+7V56774zND+lJaOGWOv1DSM/h6PXBikZU0NG85s4E9Qsca1voOWw5hDNO5ZQs/6dXpoI/axF7R7HveP121ujvFyFsB+Qkgn/aT0NoJDyoM/sGrqWZWITJmC0s1jKqk/gPxIfWZqxJNGjSDIYfFa9bIUlhOfBnZnWMkAebNJeGwtups2MLN30Z/LwuoTOLvw7gES65S7+ChSSTMabB/UZlYIBOt22WCdKGyple2+CoqQX3f8u96z4H13lkbW4/sWfH/RKeXBpWlSMVG9PU2Wdne7OiHelmSKZcaAyUjXQhkhsqXS67tjqKzaxmw+yJOskjqNezIpzr0vzO5K9AsCjMHXdQhkxPvSFVmQ63sLNuCIChkrfoqFAY483Osog0r5P2EPHjkaPBRW9pJYcu93hySoMeO3ToqyEXB6LeBBXXL8hGeYAGPMZ65yLYds8LfJx5g
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(38100700002)(2616005)(8676002)(5660300002)(33656002)(54906003)(316002)(36756003)(83380400001)(6916009)(7416002)(86362001)(66556008)(66946007)(64756008)(76116006)(66476007)(66446008)(4326008)(6486002)(91956017)(38070700005)(26005)(71200400001)(186003)(8936002)(122000001)(6512007)(2906002)(4744005)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22482FCF6F3C3B46B5F0E265B159BA60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3809
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93d899c8-cee5-4c04-11e4-08da065f72fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G3Y5uP0TfK5y8FKqPzxhNZKmlral9RqREn/yxbeRbtzMaxpLtOHEgjRom6mCdh0lp8HXv5lU+yRosLlMAp+qbV2KxQPHgXGYVwKEPM+WCZxA0zgq4KTSJ+ECTj7rx/9D2iDLIbd7fncUEpAumQQBxF9xIiV2nWLK8IGPBUPtrRrIZGcSz+6+32uoKZ/3vB9npIpFoyWSAnz6L/w8YvFrFbzXa3K96pC4R3R9zy/+jhhG60jbnLTtCevM81w7vAFDGthnHfiMmgQK0FXO+vgNJloNa9i9WNaRPwAt8kxoiaFCFxFKnN778asQGI2vUH6KZHqUMVcgO4Z7mLk3hS6JUvX2nrOAFp66vOLYdyQVPVC1PkOmHKLgxojVxFQ7IGdkB7rDaX9xuImImW6mtLQqJpnbjp77fTRXV0x/ozA2u0cgN3fer5gD/rK4qdSciOjsJ1ZN5dF9HocAWvBqM+PAhKJQsYWugInJ1qEaniqQ5B7J8Af4+LnTUmzxRYKCVSzbAtrEtGiETpE68yIPLk9NLGE0cWrFyB0Y6SbDpt+eznXZNNdLii+TdOL5dBGNplA66yeVcSUxUaeI3nCgzvH3aeCx+ZyZseDQVADatBsmnoQdkJMelx3NqaHGN18L2WIIkyOQDjZRe0vyNZLaNfncEa8ZCdBtaAPXNhg+ckdEwa+nTk50IZCSDn1jvjPtlFo9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70586007)(33656002)(81166007)(356005)(186003)(336012)(82310400004)(8936002)(26005)(36756003)(6862004)(4326008)(6512007)(86362001)(40460700003)(2906002)(47076005)(36860700001)(4744005)(83380400001)(5660300002)(6486002)(107886003)(2616005)(8676002)(54906003)(316002)(70206006)(6506007)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 08:40:32.8406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391e9eb8-d008-49ad-6a21-08da065f77d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2455


> Hmm, this will fail the ASSERT(spin_is_locked(&cpupool_lock)) in
> __cpupool_find_by_id().
>=20
> I think you need to use cpupool_get_by_id() and cpupool_put() by making t=
hem
> globally visible (move their prototypes to sched.h).

Hi Juergen,

Yes I was thinking more to a __init wrapper that takes the lock and calls _=
_cpupool_find_by_id,
this to avoid exporting cpupool_put outside since we would be the only user=
.
But I would like your opinion on that.

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


