Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B525B3995
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404382.646837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWePM-0002nb-NZ; Fri, 09 Sep 2022 13:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404382.646837; Fri, 09 Sep 2022 13:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWePM-0002lk-Kp; Fri, 09 Sep 2022 13:51:00 +0000
Received: by outflank-mailman (input) for mailman id 404382;
 Fri, 09 Sep 2022 13:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uksk=ZM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oWePL-0002le-4x
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 13:50:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60089.outbound.protection.outlook.com [40.107.6.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e35cd91-3046-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 15:50:57 +0200 (CEST)
Received: from DB6P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::22) by
 DB9PR08MB9827.eurprd08.prod.outlook.com (2603:10a6:10:460::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.14; Fri, 9 Sep 2022 13:50:49 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::a) by DB6P195CA0012.outlook.office365.com
 (2603:10a6:4:cb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 13:50:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 13:50:48 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 09 Sep 2022 13:50:48 +0000
Received: from afc243a3d778.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F71F7AC2-687F-4C3D-9D0E-E00A852FF23A.1; 
 Fri, 09 Sep 2022 13:50:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id afc243a3d778.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 13:50:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB9443.eurprd08.prod.outlook.com (2603:10a6:10:45b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 13:50:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5612.018; Fri, 9 Sep 2022
 13:50:38 +0000
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
X-Inumbo-ID: 6e35cd91-3046-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fc9vGAu4eWGiVcBZlvqzzT2QlVvsl0PpG97aNesJrlt/2iTbDuBPYjMMfi7gB+LwVpaSjD/UleHTbQSa8GblOv+6iu2pyZkNmTowV407wPt80Khb1IDRKSezzftQBhRWGkpyzYIYuVirmfXmQJiNwvA+coRHHiZb028CM008n7q+TEc0x2644L9/CisZIpYGvK0E8ZtQwiP1JdebjvgWv64qMGjWzqksIadUt2n7MJw4sUJ/OpZALK4WirLu23zlCX1OtudLtT8S8MIySpu5jU2mCqsyhbKcfmQj7+c2tlxMnK6tUD8dqWjlRLtMR0n/GLILX6HylGjOqO9SAkoGyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jDsreU1vBZNuhY/69MbfGIQEY+gr1f4wWOpZ5owf3g=;
 b=f4Qf9uFn5tSx/FAdtoqB3qWOTGdr44ypcZDh9nU2Wh2S+ST6Dnf3cdrrCklfeZFSeAGBY/TXMs/8yH24ZxLMfWWK+QQcqVATNz2MSkZXbqpMfA7bQp7V9yPM1ymHabBcHO5A9/V7qdFcHEsqV1zRobOUXk08OCXNpw4EvZr7XMCQfMg43MCMgFaKrj/+s+V7J7QvY1luErt3/aTxjK4ju7JbKzuefQHTXo3q2x8Sod/c+j4I553+gQ39UYcejOYjZNV69KcXBjTUP17APoLE01fMBre9oFJ1ZZai8SlzQTZmW0XJV8iFMkYBzC54MOUjjrUIKGoQqmThydBFf5PoEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jDsreU1vBZNuhY/69MbfGIQEY+gr1f4wWOpZ5owf3g=;
 b=a2BLVa19E3SiibisBkw3Y3rMXXvPl9bTqFNXiBaP6lsjfvnAOYw1EPOgC+6bSd/tkDtdrsiEQkXLS/K4ydbaen4Ym9nmah8p+1STsZD0tqYL9hcehjizImTnnCvtpmkTkPGo+4UpI4dhJh9xxw5sxWWChUWCm4QY6pIqOjxc0Ew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cb0ae331638fa43
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdsPMPmuvlIURfcaH/tOL4KJMUdCbvrf/tunSf8CnhWTLD2LzG2TNQALbUTcSjU7hlyeWsf/LXYujVnLHAqDuad+jWhEnHeh5Pt1j98QjMb2x6EHtwOcY4F8829E4wAPpoVGSFmCR70rXbS6IFvuU3HchpeGGupJwDMoW2JWflkI44wrTT+vO7HyGT+X67Uw5LsXlUnPg5GZZLAI33RcesbTTiD5FMeTYRLPgphPNzqSmu9+RBNsZojvMAGIxZgt4zU89hwfnxcu6nG+wmVR+GQsZ+ivw6Sa1oON7Uxud8ZvD7KsiRbAAtKmKU2dlH7nhKpeGFgV2CL6YI3WYE4Kjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jDsreU1vBZNuhY/69MbfGIQEY+gr1f4wWOpZ5owf3g=;
 b=enWRkQU3FQ79xeQMFVG84/OvyXKcZ+vrLp/rXpTSWLZLpK5IXhGWHNsLWYifN0G/29V/QRNQaGwhWqgzoL6+/zMRcBslkrH1OzndOqOX3lrgrr4UPtayt1q+uRyJV9d9onHaZCEeMxO9WWOm8hsjp3v8f9nMoizCjuI0vUi4WXZzMN3tTpemxTT+es24r74KVL2+QWunbqFispuqbyaaKSczQV5tR5GlkyRZjgtn+EDWFDtf8xbkyVGy/hXJuBeAC0Exp2ebK9ru/M1RxMD+TdT7MKeyjRNM/OloePxo5G8/WsYMgtcHJOAAofDsjnsmSORTlT0h9HROUK6G9LgTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jDsreU1vBZNuhY/69MbfGIQEY+gr1f4wWOpZ5owf3g=;
 b=a2BLVa19E3SiibisBkw3Y3rMXXvPl9bTqFNXiBaP6lsjfvnAOYw1EPOgC+6bSd/tkDtdrsiEQkXLS/K4ydbaen4Ym9nmah8p+1STsZD0tqYL9hcehjizImTnnCvtpmkTkPGo+4UpI4dhJh9xxw5sxWWChUWCm4QY6pIqOjxc0Ew=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] build: correct cppcheck-misra make rule
Thread-Topic: [PATCH] build: correct cppcheck-misra make rule
Thread-Index: AQHYxFHaJwlnNsxgQECM5kPu4Ki3xq3XHaOA
Date: Fri, 9 Sep 2022 13:50:38 +0000
Message-ID: <8FB0B363-FE6D-4BFA-B5D7-E0C00737D3FF@arm.com>
References: <0dbef17c-be73-1d88-cd20-83f3123361bf@suse.com>
In-Reply-To: <0dbef17c-be73-1d88-cd20-83f3123361bf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB9443:EE_|DBAEUR03FT014:EE_|DB9PR08MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a7e213-4729-4b85-f1a9-08da926a4d59
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D27H464Ly1OoRT4BdIF+EQIa3qvqSBpxG+rHEOLdHc75vU1hf4lMMkBDSU8BA3Gjk80QbgZnvQV5WiQIRgTw39aXftHSGV8p4wl8oi0GOy6hst4mEmwWwW8x2GDcqgVtAreFbYdZYVd10n9n9q+5psmB6OMkh6Hs2Bp1BggEhSaxcbxctmo9oP7nAIB9mGp/IbdVNGOzDkfCvzNUA4LLsb+nh6A3+c3YMYVevPReDHlxC9ocrx8C9HjrphhRpdsuXZDDMIUtGCJu1SkygWL87TysFqfXtXBcPVEu6npXxPqI+FPM0umPBcxppFwzqXATT4Y/cz6+LvZFxl0qxWsLRg6wK/YHFqUyUG07Gf9HMOx2HZAKPgU6OH+meFf6D+q12q04HKu5nujMJEos4aUK3awbIedr1gIvnXirJ7M70eIwVCMyYGQMqSafmobZPKxHe4YUQfh8iWbWdZlImCkF8ohi4waNdMc2nfVuSmyD35kpYnT24SR+k9nfXYDDptctoq0APhhOSHW8NcVnT91NIuyxCykkyxc4jY9Aw2OJDiIktffqb2o3GEtnpohSPC/GZ4E6S/ShZJgQDR2849Sr8G7uie7sEABnSC8EovWA/MJ3xJE1sbgYpGrwkjx/oFxmiI85n3N3t8WyhHVpriBZS/qKd4/cc+sjxJEOF3AYo2nA9ZNoswo3rEUPfevDuKFFEzyj0aCIrotZXvOFHzx60twijqZGXSKwbJn+DOXDwPbOBdeMKsp3BzvLwA3OjYBaVH0d1wg3VQWVYrXtJg2SlF/9C3LlUqQLkWc6ABZBR/M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(316002)(64756008)(54906003)(6916009)(2906002)(86362001)(66556008)(38070700005)(8936002)(66476007)(66446008)(66946007)(5660300002)(122000001)(4326008)(91956017)(76116006)(8676002)(36756003)(2616005)(71200400001)(478600001)(33656002)(83380400001)(186003)(6486002)(41300700001)(6506007)(6512007)(26005)(38100700002)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2257647299309C41AE751F4CE067AC49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab2213b3-8273-4cc6-4595-08da926a475d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gop4N0n7Oe5DzFiOsWbWUzmVR5Pf4BZe9QJJwOsS9lRvAEfOtRjHsVTN1fV8yERxEQpjiitYF9uFvP2iHwoXWXgjBbyAwkzG49WGgfZChHKm4CJ/kjbDc6+rgyd1aG2xW9HkNwLGhTMQeElU04I9Cp5OeyRvq7a23tZNJdj7RqYj6BRdkXN9gGJYfrS/sDvewF2wdT0VAYD+KqgUOuMYXg66Aqi6eKSokXJHZ3IdUUnZ7qyh6zzM8jb6X8OgM9czDyop1odQnzwVgiURP+a5doUBqbrflE/liteuXb97DBS9Jy6BpqSOF5qOVLWFHYQ97e8/G0cZ9HhBhzLcrqlBYMQLUPrIznEIMgKmhYRZp4kbyK+HleglNSCLcPPAm6G6Ji0ULQTVx6mYv/bZ3nam7QZozozgANLXPEuF0USN9KvvqIRcya5Z0xYg6QvbvdeHaa0ur79fkg7/cwdxZEww9p6iqroBBl5abTlUvcG6ny9fWDFMurSe2Qvk7F9GxxcOXMAUcQrS72MMtw0RyPeyWpjrWAWzGExJ/VTQVgBnh0F8ANRxyNd+yljOKtpiX95n8BshSu4HSTciHV329EbyFoKaWPJ3imFPG8JwaXxDeL2HV4SaPYHC7mnK/Sv0G/xG7+OqxBATXNy1nbVROIuoMGpUnWhe0Hp6AurEeRz2iV6fDKBJe76fSTqnC6vaDOf6QenrjXV/rmUBKmyBizfbARUChbIJGeTbecFokcHAhEcSRURwvLmlaHIunAH7iVIGPnK0DuCy28Kht/i/tRJrig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(46966006)(40470700004)(6862004)(53546011)(6512007)(356005)(6506007)(26005)(36756003)(5660300002)(82310400005)(8676002)(2906002)(2616005)(41300700001)(6486002)(8936002)(81166007)(54906003)(186003)(82740400003)(86362001)(478600001)(4326008)(316002)(70206006)(33656002)(70586007)(40460700003)(107886003)(83380400001)(36860700001)(336012)(40480700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 13:50:48.8119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a7e213-4729-4b85-f1a9-08da926a4d59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9827

Hi Jan,

> On 9 Sep 2022, at 14:41, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> It has been bothering me for a while that I made a bad suggestion during

This is not a sentence for a commit message.

> review: Having cppcheck-misra.json depend on cppcheck-misra.txt does not
> properly address the multiple targets problem. If cppcheck-misra.json
> is deleted from the build tree but cppcheck-misra.txt is still there,
> nothing will re-generate cppcheck-misra.json.
>=20
> With GNU make 4.3 or newer we could use the &: grouped target separator,
> but since we support older make as well we need to use some other
> mechanism. Convert the rule to a pattern one (with "cppcheck"
> arbitrarily chosen as the stem), thus making known to make that both
> files are created by a single command invocation. Since, as a result,
> the JSON file is now "intermediate" from make's perspective, prevent it
> being deleted again by making it a prereq of .PRECIOUS.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I've not been able to spot where / how cppcheck-misra.txt is used. If
> it's indeed unused, a perhaps better alternative would be to convert the
> original rule to specify cppcheck-misra.json as (the only) target. One
> might then even consider using "-o /dev/null" instead of producing an
> unused *.txt file.

Txt file is used by cppcheck to give a text description of the rule.
If you look inside the json content you will see it mentioned.

>=20
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -746,11 +746,9 @@ cppcheck-version:
> # documentation file. Also generate a json file with the right arguments =
for
> # cppcheck in json format including the list of rules to ignore.
> #
> -cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/tools/co=
nvert_misra_doc.py
> -	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $@ -j $(@:=
.txt=3D.json)
> -
> -# convert_misra_doc is generating both files.
> -cppcheck-misra.json: cppcheck-misra.txt
> +.PRECIOUS: %-misra.json
> +%-misra.txt %-misra.json: $(XEN_ROOT)/docs/misra/rules.rst $(srctree)/to=
ols/convert_misra_doc.py
> +	$(Q)$(PYTHON) $(srctree)/tools/convert_misra_doc.py -i $< -o $*-misra.t=
xt -j $*-misra.json

As far as I know, this is not saying to make that both files are generated =
by this rule,
but that this rule can generate both files so nothing is telling make here =
that calling
it once is enough I think.

Anyway this should work but the commit message needs some rephrasing and I
cannot test this right now.

Bertrand

>=20
> # Put this in generated headers this way it is cleaned by include/Makefil=
e
> $(objtree)/include/generated/compiler-def.h:


