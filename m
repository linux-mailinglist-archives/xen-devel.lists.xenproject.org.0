Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AD155E5DE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 18:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357310.585804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6DmE-0006vH-Gx; Tue, 28 Jun 2022 16:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357310.585804; Tue, 28 Jun 2022 16:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6DmE-0006s5-Dz; Tue, 28 Jun 2022 16:09:22 +0000
Received: by outflank-mailman (input) for mailman id 357310;
 Tue, 28 Jun 2022 16:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+uE0=XD=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o6DmD-0006rz-9C
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 16:09:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140070.outbound.protection.outlook.com [40.107.14.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa582b99-f6fc-11ec-bd2d-47488cf2e6aa;
 Tue, 28 Jun 2022 18:09:19 +0200 (CEST)
Received: from AM6PR10CA0092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::33)
 by AS8PR08MB6438.eurprd08.prod.outlook.com (2603:10a6:20b:33e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 16:09:17 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::cb) by AM6PR10CA0092.outlook.office365.com
 (2603:10a6:209:8c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Tue, 28 Jun 2022 16:09:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 16:09:16 +0000
Received: ("Tessian outbound ef501234d194:v121");
 Tue, 28 Jun 2022 16:09:16 +0000
Received: from b329bf3226a4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A39BF014-261B-46D2-9DD1-3CC5C920DF37.1; 
 Tue, 28 Jun 2022 16:09:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b329bf3226a4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 28 Jun 2022 16:09:10 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7876.eurprd08.prod.outlook.com (2603:10a6:150:5f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 16:09:08 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5373.016; Tue, 28 Jun 2022
 16:09:07 +0000
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
X-Inumbo-ID: aa582b99-f6fc-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Yx+eP25QMUs0mcRZYycidaL6jVWKbOCFcBtaQy2TUEE50eRvNaUYPk11O/wiovJxZ2N95deBiT/0BuDJYuW+I3hkkYyd3e6AAfjMoawFf47LJcoB6zibhBF85imI5C8Ss9itAO4U758AI5XxzoxDk7//GC6aZGZDCaSCUVo0ay52FvpGlAMi8C2n7heoAHR0qFTHgYm02IZlLqhLDIGlK8HsCgnAkxf2omvuM6Y9szorVFBtnevy4dPNVIfRun2+XN+uG2TIL4MtCVExkdDz+0ZBWoFWhF5lwkTYQW3B+ZwCV/DIDrSrXDknVbaVKGZ+u7OmzkX++Kf/zZZbifl4Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN2ZAQZXILDaBZsbkmRhI4rnGOcT6dF72uPMXaUaW54=;
 b=dvWd9PqqcyzDTBg1FC/b7tCqeasx9cxeAexJwTfbxHL9JjnAoVafuXjWpV7ydY3F7Ns0RZrvbVmK17E+o+GKWsyxbY5fkGeB0ylMk7Vp51DDucHbJTi6oLCwfxmRN+ISV5+G03eLsh416X3ZXr9DbypgqYyFCr3G3b22i0he0T21V3CYs2NtRmZdO5b3ddyDG2rrL/3BT4MofD3Uwjkh/3SfLFpYZ7SqvKbJIIFYAWSbaOrucSUMiXLV6YP8UXts6chQ8bbPeKFGckHEB1R7vIgD0y3qaAg0+SbwPOXVOR12nRJhQknKh8fLZgqm3tgDoiOF+YzoquO4dWQ/fSd5TA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN2ZAQZXILDaBZsbkmRhI4rnGOcT6dF72uPMXaUaW54=;
 b=dFAfipd+/agk5BqTs1hV9TekZJeOsedi/gDzF9ij+S7iuE7Qk8FjaJlDLyhhLA62YhcdEsgDc6wAgmGk+F778YlPXGmGTT+PjKJNFzlgUOCv6TXQ9rVRrXh1Yxgv6baWXjcU/66Y0bpmoA2st1sgpJDA+Oiim2PnUKdTErQ/77s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e948e9ea95dc040
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGUo87+KZfrjXlPJozYrVlR/hjep1Xy8d+lGanH+GItYZ5kEbnxpJ7R7AYUF/Z7gj4akZ1sCNMm479GB55Kyt+TawVgbaYA6przyUTC45m5bhQ5k1oIO9DcAJehnAmiH6Vn/wqW5jWxgrlwY3JylBRpSAOQE2B956TNWbrD9YYU5b7S59IqMOlg1SRzl2A9qDtswqhUOmQttIUFozfs2h+Nhw3kSxiBcgP7JteRMUgnBxhy4GRzuRqSnOGIWosVqOVgDB1kBhaDPB/GLiuJzaNzMQraT8aiGnDYcI9CBY597d28a6xClxuQB+eiuFqZICJQaLgK3rVx9IQeEjp7FlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SN2ZAQZXILDaBZsbkmRhI4rnGOcT6dF72uPMXaUaW54=;
 b=i8vfpMAWQWk/kTj2mn+5RpvBxS+go1DtZYBb2cjCDX68uL6sQcFqLLxm8hWRJqZn6DlJ96sr4OoqUUFx5MFj5nsE36tq12NsRoyQIFfyyK9srNAognzlBij33mHoaZ1VQHQWFI3J972Xw0hWbYkzG/woBjtCWM3dOOjNX6Fb/c2Sw09fGmpxVGQYRqux2kCALqQgcjP2Qa2rFC+p3/8PEtxXSoeBBxdx9QP2z66K2Rw2ayHn82tua/XaugzMGFtjgo6Np/cWNFAM5z+C+zQfn+nuwOIUGQKO+ENjk/zmdW1aWXz1s+WqnL7X8pSjxO3U6fmXMS6aYy5juFUmkCaL4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SN2ZAQZXILDaBZsbkmRhI4rnGOcT6dF72uPMXaUaW54=;
 b=dFAfipd+/agk5BqTs1hV9TekZJeOsedi/gDzF9ij+S7iuE7Qk8FjaJlDLyhhLA62YhcdEsgDc6wAgmGk+F778YlPXGmGTT+PjKJNFzlgUOCv6TXQ9rVRrXh1Yxgv6baWXjcU/66Y0bpmoA2st1sgpJDA+Oiim2PnUKdTErQ/77s=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Topic: [PATCH] xen/arm: smmu-v3: Fix MISRA C 2012 Rule 1.3 violations
Thread-Index: AQHYiwEFE+FsL2M3X0iEtb0hwEG2QK1k/MeA
Date: Tue, 28 Jun 2022 16:09:07 +0000
Message-ID: <CC6DCBA3-AA80-4D51-AFAF-C15855BBF7B0@arm.com>
References: <20220628150851.8627-1-burzalodowa@gmail.com>
In-Reply-To: <20220628150851.8627-1-burzalodowa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ff78ce39-22da-4ed2-7a60-08da59208cff
x-ms-traffictypediagnostic:
	GV1PR08MB7876:EE_|AM5EUR03FT030:EE_|AS8PR08MB6438:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XY2/t0hk6RB9+5ceBpeLPvZ2QM2sqm9hzXXmtpXP0cgydo95MdpR+/eh4UpPFnydRt+s7d3+82Su3ufh+tdw/n7Y1npet4dEf42PzGRPDBpwYGtPHgjYDTtda4qgdYX1mKTUaxJ8sf1suddqsVAI8XY74rPTiormvlfSMQkshHmyFaIYtbmtdbvh4OZgphBI2m94rzKD8U41sgAfiHNE6SMcmxikvN88a5W2MGXxk2lklncv3sxCg2HFHia0ops0xj7xUQuiGZsOHQ2Zz7VK2pQaf9MWv47QHDFMhw7jycBK2TkVPY2bGVyTSS7pr2se2rykCdVnX6f+sdHTYTpOvHh5yvVjMq0H//JH+KqSXDmxH48OURLAjsZQJ3LYnb+xwqMcvWSiqSynKl1yKlx9+R6vVchJCxm1+YMaPhyizyDMz05u7ZaqPZRBzKmilyjCEBZQzzyTCz2r6I70sXMBNJMjLp7hKpb5IG72p22u6PMKzzM2LFQpDNwm59Gr3s65hQwZyibF/WhwchMO68C63VM1ERWH8H5R1avODF5M8rwk0yu0E3Hax6IR6L2FGKwmpYdWZbDxsnx7jsSMbdZBxwdee+i30wh8KWRoEd7pbY62jqdGQ2GXTYB8DzX7QCJeJRIVpXtMxITPu+YRqseWk5zhn0mTcqromTqknZ6OGKLkGz24ULRbt7cFjCxRYldt7tOmWu+MwJguZj1Pvu9ielWunpYKjn2lmMS8MKCCxVw6nGAwFpysydRlCGABz2T95Q/P5D/W2xU7jgqV6RUxN00/aHhXbiuZXh1EzXgpzQD4+KVvpGE0r9Awd2eoOJXY4v8qZfOaLOG/lg/tp1P6Ow==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(6486002)(6506007)(6512007)(76116006)(41300700001)(71200400001)(26005)(66476007)(66446008)(2616005)(186003)(38100700002)(86362001)(83380400001)(478600001)(33656002)(122000001)(53546011)(36756003)(316002)(54906003)(5660300002)(6916009)(2906002)(66556008)(66946007)(91956017)(8936002)(64756008)(8676002)(38070700005)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ABBE22999FF38B45AB4FC0D036CD8891@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7876
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9aff0d7-bc77-494e-09ed-08da592087bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5uhD0yf/QEhdkto+Wf2U6GRELKXxPMoQffCjwnCprvyb3fVkelIVm2mCGIOIu1QZU6katR4WX9EQJlBxgZY7Oq5igA3jnxkerPZyUSoT7ryaRxJv+pfN6m0lyxCHpRinvX3PqDOAFAsvZXdvCKlE5a6jvBdBJ7ksha/C4A+f4qhYp0bfTG0W6FnU4GZVNUGXESh8SFs2m19OBjiwsVBgRri7pkX/QQJSEgU2Pke95QjAd7kdW4Gnbp1VC1bNH0r+0tjlWe1bt+VpFESCBjL9qENhFakPE53P707JXzIeuMfkqfEPvZgTW9zlYRc2iNc/RSqcm7+MC6n3rLQC6COhueu4JA3nTLHxuLNEvyxeILZe7vFFyqKToP0Q8HoEnxOpuR1reZqV+3xB30gxD52MzgCLvhPRibv6tzAPBEc5Ww5Oopl4kh1xTULd4pLAj0s+a54ML7Fq3rlSIDreg7N98oOvVnj9MFs5wZchUbCh4GaV8SzHulNguT+TBbjgFT+SocXRFL7Z1z53YpHNTrx3Tdhd3h+7jADpe3arbapCJsIzsh3DVMKHWK8AGzKpLlL8hhJghcHL7H67bN39y/5evSF8E4yNEZy4ZaomTWkAieJlc+/Osxu1Vp3t4/oHGQR39cg2CxxKzj5eeqjzkNh4AFTriNtdhzGfgvaiDTNP8afqx+51kKHj0lYokfvb2n0mi3A8K8V/0eyxJbhKWIzLzzHNz7rfZhWCtHprA6dWykOI5/pi1HKEaHGPbB7B6+98cp93p6esv6V+X6TDgvOXgNxiKS+NTqNe7xND07dYYxwsD7ELtbHf1+Wm0npTBVLI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(40470700004)(46966006)(356005)(82740400003)(40460700003)(83380400001)(47076005)(81166007)(54906003)(5660300002)(4326008)(36756003)(186003)(8936002)(107886003)(82310400005)(70586007)(36860700001)(40480700001)(336012)(6862004)(6512007)(2616005)(6486002)(41300700001)(53546011)(6506007)(8676002)(316002)(86362001)(26005)(2906002)(70206006)(478600001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 16:09:16.5121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff78ce39-22da-4ed2-7a60-08da59208cff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6438

Hi Xenia,

> On 28 Jun 2022, at 4:08 pm, Xenia Ragiadakou <burzalodowa@gmail.com> wrot=
e:
>=20
> The expression 1 << 31 produces undefined behaviour because the type of i=
nteger
> constant 1 is (signed) int and the result of shifting 1 by 31 bits is not
> representable in the (signed) int type.
> Change the type of 1 to unsigned int by adding the U suffix.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> Q_OVERFLOW_FLAG has already been fixed in upstream kernel code.
> For GBPA_UPDATE I will submit a patch.
>=20
> xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 1e857f915a..f2562acc38 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -338,7 +338,7 @@ static int platform_get_irq_byname_optional(struct de=
vice *dev,
> #define CR2_E2H				(1 << 0)
>=20
> #define ARM_SMMU_GBPA			0x44
> -#define GBPA_UPDATE			(1 << 31)
> +#define GBPA_UPDATE			(1U << 31)
> #define GBPA_ABORT			(1 << 20)
>=20
> #define ARM_SMMU_IRQ_CTRL		0x50
> @@ -410,7 +410,7 @@ static int platform_get_irq_byname_optional(struct de=
vice *dev,
>=20
> #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
> #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
> -#define Q_OVERFLOW_FLAG			(1 << 31)
> +#define Q_OVERFLOW_FLAG			(1U << 31)
> #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
> #define Q_ENT(q, p)			((q)->base +			\
> 					 Q_IDX(&((q)->llq), p) *	\
> --=20
> 2.34.1
>=20


