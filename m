Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F597AA668
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 03:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606663.944646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjUlM-00038U-NL; Fri, 22 Sep 2023 01:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606663.944646; Fri, 22 Sep 2023 01:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjUlM-00035h-Ii; Fri, 22 Sep 2023 01:15:20 +0000
Received: by outflank-mailman (input) for mailman id 606663;
 Fri, 22 Sep 2023 01:15:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aXRy=FG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qjUlK-00035Z-LO
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 01:15:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b04a992-58e5-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 03:15:13 +0200 (CEST)
Received: from DU2PR04CA0184.eurprd04.prod.outlook.com (2603:10a6:10:28d::9)
 by GV2PR08MB9424.eurprd08.prod.outlook.com (2603:10a6:150:dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 01:15:09 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::80) by DU2PR04CA0184.outlook.office365.com
 (2603:10a6:10:28d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.32 via Frontend
 Transport; Fri, 22 Sep 2023 01:15:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20 via Frontend Transport; Fri, 22 Sep 2023 01:15:08 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Fri, 22 Sep 2023 01:15:08 +0000
Received: from 174731fc91d3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 14193C31-D68F-4090-B875-8B465378EAE2.1; 
 Fri, 22 Sep 2023 01:15:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 174731fc91d3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Sep 2023 01:15:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9826.eurprd08.prod.outlook.com (2603:10a6:10:45d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 01:14:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 01:14:58 +0000
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
X-Inumbo-ID: 7b04a992-58e5-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxYVz3prC4xV/U9J5EJnRp+tM5e6ax3pGj6ME4iASRk=;
 b=IMdeATCrQW8HK/IScQMziIn5hExkU967oyiK2wShV+E6IF0hbFPGsgmEMrnpB/7pcJyoQ0igJ25S5yc0o8rGscYRNyCD+n8NSR744oRDPEQtealP/LrarLG+MbAI+70kO6sr5NUpM+ecDy6WQ6vvapVEFJrxsubBOftE6XWrqBI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75b9552e353edfc7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmRKzjyiuum8K3YQieWK+4MvPBWP1+ao9Z49nZbbyX8MP5HxPdftVVpEyJDN1ocbkz0dRmFgBClBNB+n+8+Va8umvXf2ljCN6V6obA/D9C+akvsVL4pbeYaJtzt4Ti8j/KGSWvHukGxvWHsY2gvy70BwVg1Vmpl9Ws9ZgxTes6atsLvSRHx8Y7hzBRJkVWWoKR8WN6c5/tFlATZKdyz+JoqRfQThGirr9r+VaFm9QY5jMSCZTiOQ5O8pEm592DQjEfS21ZBM7MSQf291aKTOJ4GR3mbFJ+iX18twPVt2gLa0iMsWxuPvL9IG/VzGfuFITQMljaIc8lFfa8E+0zcdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxYVz3prC4xV/U9J5EJnRp+tM5e6ax3pGj6ME4iASRk=;
 b=DkOt4kre7igeP83ihbgwoFEQb/dha+jXPextkDKFmxRQy1sdKvjjORLA2uB9SlOiywBbHaALlbHLnoSNioaqJrRN8AvEnXZixAnz55J80L3iWjhYlImlOEdCOuf+f+agPiqKcn0yiG7rh0AUU8hvDWvCiU+qzCjKBkF3tyriFduGR6Xs4LLtgGzy/twDPM7+n0AQAmpoqQIThmSf+uXa0HSKs2Ty2Ew7p7UbDPRDCS2qN4L85/D2PbBBZ42wwKoxfGZ2cSpj+6B2JwnMCXu56jTOPZXnzC+mf9ioAatz+tq4OPzT56lDOeMYnSVPUPD7D2fdiN0uU0AtlU5gtdRAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxYVz3prC4xV/U9J5EJnRp+tM5e6ax3pGj6ME4iASRk=;
 b=IMdeATCrQW8HK/IScQMziIn5hExkU967oyiK2wShV+E6IF0hbFPGsgmEMrnpB/7pcJyoQ0igJ25S5yc0o8rGscYRNyCD+n8NSR744oRDPEQtealP/LrarLG+MbAI+70kO6sr5NUpM+ecDy6WQ6vvapVEFJrxsubBOftE6XWrqBI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm64: head.S: Fix wrong enable_boot_cpu_mm() code
 movement
Thread-Topic: [PATCH] xen/arm64: head.S: Fix wrong enable_boot_cpu_mm() code
 movement
Thread-Index: AQHZ6FNGXuwkZcMSWUGVwj7cDe3WUbAljiuAgACFiYA=
Date: Fri, 22 Sep 2023 01:14:58 +0000
Message-ID: <58829389-9374-477D-B9B4-1BC61EBC269F@arm.com>
References: <20230916040649.1232558-1-Henry.Wang@arm.com>
 <0e8789b2-0b0e-4652-a1ee-b2d9efd804b9@xen.org>
In-Reply-To: <0e8789b2-0b0e-4652-a1ee-b2d9efd804b9@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9826:EE_|DBAEUR03FT022:EE_|GV2PR08MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 554cfcbd-9c15-47d4-c71d-08dbbb095c61
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h/Gy+lViYFOe7OVMFbU4EWSjUvLv33O83kWzzT33m/n1K31Y+bpam+rhEg0D1d2vonnFEauca7U8u1Cbk0jXP+ESivd94SFwMoSEVCmhdUISoJKZ2sDIxZTrXwCIZovc4y5abhIc0doOr014WjRG9OwXdTLkIF2Pko9PlOv3gVKqMlfYOvJh9lAIcEThiu8fyYq9AopANRhr01jD1m+pfM5Po8N0HOpyhTIpg8EabL/JNrRO4pOia20esrNT1BLlNGWV4ZACeWPSmBQGkr2yLvUfBcGVQnGk9gaGdwNha3bN7+sR38214Zo4pb8gL13C5pzkaLtfzlgO6/dqu6tQBW3PpJU9WD4DzW4BPuxdzL3qK3FUdKg3070Me/+RDRis8KSdfWwPRQsROkk+oT90hGg9GuNpk9FpHv53CQeaU1QsEYP1SlXlyk5Ut+B0k5IY7hvOVW3IktD35nfD6FziSsW8IKZ7o8wBTMDjyUrV8YOoOYhfqIY8wReeJeAczLyokZdrVPiCY9cby2xApG3+AG8qXz+kGyycE3ODqQT+5tRYI8RDKE7jjLWnEDu6mWpNa4B7XrtiF+k+7UxaIkL8iCprupoAqdV1hGGLavYYVTl/FV3kOsMMdnkCkpdXdW8Q/ssPIC4tS6U6laOnQUCHZw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199024)(186009)(1800799009)(8936002)(26005)(5660300002)(41300700001)(8676002)(4326008)(6512007)(83380400001)(53546011)(2616005)(6506007)(6486002)(71200400001)(478600001)(122000001)(6916009)(316002)(76116006)(54906003)(66946007)(64756008)(66476007)(66556008)(66446008)(91956017)(4744005)(33656002)(36756003)(38070700005)(38100700002)(86362001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <390DC7975EA92544962A471025624D1A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9826
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22a3c78c-0e74-4893-9348-08dbbb095679
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HV3/0XWpp6zQmoadxPk/1edwPhxtDWnZPWWHDw/XuLq7Y+b9/mRDXpdx6+zs1s/peKgtQFc4QHe9BpzVs7pZm9fW6cCeFEnMJwNlPaURNkXSCYVrMuZKjUudpSCOUmO7oX2N36sHR28pwleI1aPGFO/6oR3VCysh5lOEEh4HVCV2sxXwPcYJy1AuSLqhml47I8lTQQj/Xy6D2Fb6oohbutOk1GaN09p14UXU/adWOXZrnBlB18hXyCHSMZ4ZtTtiITYR+2YeeanfWW775T6yB8IEzeNNlPZJLJHy8WIFfUsW0/ps/VnLvcTPIVPMo/mkfbycXOkfFAQgqkQcXIJ9thf6qB4hTKvNnWRXbxypdrlEkYpWVQFLukXChYC3yLB35FGfF+Y7l6U8Qvz5rNe+m95RBuQLokOKuMPM9m+xwUQzSYQzxRjgqimP9sGZZ0Nboq6gM3jVofwk88nHeTsoEy5sz/UE6hrlcozLc8K0yLHEMuIPsbRyy74HxEUOrRJK5nK5JgIXDPK6ybHMHY7fZb6eiPw69saU7e3eL5pOw2ZWkO1JG2REVIMwLOx2rwgmZHujXm27Fu6By90Olx500XnhmVV1VieVXIbBe6oMp+fGLKr3Dd6A75vrd0jm+WNcSSGuZ1tS0VUTG0w83s3lTvcKDjyv8woDADi6sDB/zxhRuyXjYljfuGChi9nPsjzUJu6rb2WMRWhMi//VdjqVD4ZtgH95EuUtNNj29zZATrD4T/UI9Vw/hh6C0RrI3PZO6YfEOHRRs0dSBi44X8ORYQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199024)(1800799009)(230921699003)(82310400011)(186009)(36840700001)(40470700004)(46966006)(2906002)(54906003)(5660300002)(6862004)(70586007)(40480700001)(107886003)(4326008)(70206006)(8676002)(316002)(8936002)(41300700001)(478600001)(6486002)(6506007)(2616005)(6512007)(40460700003)(336012)(36756003)(26005)(47076005)(53546011)(36860700001)(86362001)(82740400003)(33656002)(356005)(83380400001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 01:15:08.1912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 554cfcbd-9c15-47d4-c71d-08dbbb095c61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9424

Hi Julien,

> On Sep 22, 2023, at 01:16, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 16/09/2023 05:06, Henry Wang wrote:
>> Some addressed comments on enable_boot_cpu_mm() were reintroduced
>> back during the code movement from arm64/head.S to arm64/mmu/head.S.
>> We should drop the unreachable code, move the 'mov lr, x5' closer to
>> 'b remove_identity_mapping' so it is clearer that it will return,
>> and update the in-code comment accordingly.
>> Fixes: 6734327d76be ("xen/arm64: Split and move MMU-specific head.S to m=
mu/head.S")
>> Reported-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks very much!

>=20
> I plan to commit this patch in staging so it is part of 4.18. Please let =
me know if there are any objection.

Yes, please commit this patch, as it should have been part of the committed=
 patch
6734327d76be (again I am sorry for the mess).

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


