Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A201661F8CB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 17:17:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439488.693503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os4nc-0000SA-Hl; Mon, 07 Nov 2022 16:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439488.693503; Mon, 07 Nov 2022 16:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os4nc-0000Pd-EZ; Mon, 07 Nov 2022 16:16:36 +0000
Received: by outflank-mailman (input) for mailman id 439488;
 Mon, 07 Nov 2022 16:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z14L=3H=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1os4na-0000PX-De
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 16:16:34 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150082.outbound.protection.outlook.com [40.107.15.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b7a8e98-5eb7-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 17:16:33 +0100 (CET)
Received: from FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::6) by
 DBBPR08MB5884.eurprd08.prod.outlook.com (2603:10a6:10:1f6::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11; Mon, 7 Nov 2022 16:16:25 +0000
Received: from VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::9b) by FR3P281CA0105.outlook.office365.com
 (2603:10a6:d10:a1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11 via Frontend
 Transport; Mon, 7 Nov 2022 16:16:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT052.mail.protection.outlook.com (100.127.144.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 16:16:24 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 07 Nov 2022 16:16:24 +0000
Received: from 6ebcb3df0c69.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 29F517F6-1E3D-4BAB-8313-E7004DC60343.1; 
 Mon, 07 Nov 2022 16:16:16 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ebcb3df0c69.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 16:16:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBAPR08MB5654.eurprd08.prod.outlook.com (2603:10a6:10:1a6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 16:16:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 16:16:14 +0000
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
X-Inumbo-ID: 8b7a8e98-5eb7-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BfjdcWcdiFdwiu/KmvwyYBGOvIC3cMIS/O8HhHCOTEBJ78qLEZZPt0kkUv97Q785q1i6PnZpPiIFDVJtiVkyoX2uL98Fr7tu7eeV+1PE0KnWI98KsjHRbQI2BvojNMTRdXsuW+IUTK1cdPSv5fxE+gZ4zsTF4bZzGWKXamrEgji26vCPhPGkSp1M0V83Z+zOJq6HsQp1gq0TsGnl1o6mZsPJa7+m9a1zxuaUJGbAQcsSypR3vSfc5IprxHsviFj2/w0s+itklAfFNOqgaO65Vfzkwy7LQbPizcN6wdbQB9jnCJJ6d+dnqfKDyumwQSyUwQtSStTVPcnD7DlWaq0KCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQRdhziFnmVn8OW3rSTa+EhsyrqzDkX3SK1zJ1IgXxU=;
 b=K/Uy0cEvGzo+8mtbQsqMsGrbCxjhuFcCSujEvmXWkzRmP85X2NLC7pTUVuGfrISuTsQakqJDq/HQj0NBwpwmNwMfnFoqrqCG3av31VTDsaS42bD92xpBG6NFTSFtkz4tsJ6LE0v7rablJaAr0+8yZRb5kN0GDQtrU7jgaw4sTjD6qB3XvmRm3ywrAa1kdfRwTuDJK5vO3Zh4tB/1+wFzQcgyGNgJtYSgzGrz9wnhiIPzeJbz+GcT2ASV1kjE6QbAO4Wco8gi4OoJpL2vg5OUdtX+UMfclD32iYzdrvHTDHwOWqXGfNBnblgA1UVQ8djPfS27iQuYWbOrB5zSbF1KrA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQRdhziFnmVn8OW3rSTa+EhsyrqzDkX3SK1zJ1IgXxU=;
 b=CQJVW0B72LRVW7rYI4wHkHhiOpDNZtqAbIGsbRt/Ju282AU7dbBa1bJaCLUogH+H8TCMjpdm/PuCyCEl4Ci/A6XKfSaHLJQj64MbBLvvFt/xHNSH4Kpik0SSwXx4DQnig/9f1iZaE0aOEwb7M9evDhb89NJ2WkMaDO6nROe1J3A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27b6f2342f10bc34
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4Z7dge6cZJ1955kvU5YzA+9/5OxgS4tP6Wil2+TG9xDifE8jRSowCj1DGaWVStHEx2rTIEv4D/toat1fHqKwIY6jeic6a4lviQrK3MJswR5nJF8cNULXJRXXPp4cpMPM+ncg3jzt1wS6M59IPp5ewlu1P4a6HOBEaK0C0HWAdyJVG6wpmBIxbs/7FY/dfO8nP5g80infAYmxUoJn6FCs5H50vtLzTxqaxRmgBURYDKX3bgL6gojs8Vgy40pWbU/4TDTgfWhR9nU2SqZyJjbcCXdxk8X+3Qr6yjd2u6aNk8b1+2co5zOfGkrLCXxSN5ETW4Mrygn8MvsPHeSLG5SBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQRdhziFnmVn8OW3rSTa+EhsyrqzDkX3SK1zJ1IgXxU=;
 b=QqDDQ5FeE9nBRfDCW2c06AxCdaiCygg5P4NHiRJkwzdRBW2zzJtJsVSdDnqJUeqfWYfOvSCV4LxelW6L+elA9XUulwjoxF9DbeEsvIb4XI4Ik5k7HCQ2S+2o9t5TIGeiUhrncspukw0ROwegdD2woy3DTWqQz0oem/6AbYStihH11IMBlgEbH+96VtXOfuXTq/jBRTEDQq3VkQ982GfgFc80k4/rnv+9/wfnixj1NS1bstyQMqcM3uzS33olLSVPNmjUdvw1qwiRzl6qglUkEymnN8BXebwq6YmJ8tDsDpfAY0hX1E9+6kVeruW9c50NPA4DqwKI0EiL1wehCEUzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQRdhziFnmVn8OW3rSTa+EhsyrqzDkX3SK1zJ1IgXxU=;
 b=CQJVW0B72LRVW7rYI4wHkHhiOpDNZtqAbIGsbRt/Ju282AU7dbBa1bJaCLUogH+H8TCMjpdm/PuCyCEl4Ci/A6XKfSaHLJQj64MbBLvvFt/xHNSH4Kpik0SSwXx4DQnig/9f1iZaE0aOEwb7M9evDhb89NJ2WkMaDO6nROe1J3A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, osstest service
 owner <osstest-admin@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [linux-linus test] 174539: regressions - FAIL
Thread-Topic: [linux-linus test] 174539: regressions - FAIL
Thread-Index: AQHY6+CQ4VZAde/T6k6I0fM4JzEhfa4ptwOAgAG0q4CAAhQYgIAGK/+AgAAE+wA=
Date: Mon, 7 Nov 2022 16:16:13 +0000
Message-ID: <AA4DE279-AECC-4470-9D46-41FAFFF2D811@arm.com>
References: <osstest-174539-mainreport@xen.org>
 <3c8a3be2-db65-253d-94ae-1bfcad1b94e2@suse.com>
 <ea2ac746-bed1-c43a-62e5-d2e693bef6f6@suse.com>
 <3BA37602-681E-4A1F-8C01-0DAB8FB9262B@arm.com>
 <51eef76f-5b2e-c558-5caa-f457a9555f44@xen.org>
In-Reply-To: <51eef76f-5b2e-c558-5caa-f457a9555f44@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DBAPR08MB5654:EE_|VI1EUR03FT052:EE_|DBBPR08MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 2982feaf-27a9-412b-eca2-08dac0db6aab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 56cnEJlMpHWuBfF0tUjgShnOlWOGnmNNUANWw3Y3G7ljSq9w3dlKbiwFKvVcMIBx4JV4DKPYnufmNyiHD24MRmStwje+WquPHTKgLTbYxfwu70bNcxOdNpu7VV4W92haziprGj1jTlPtORJJZmH9QUBGivZ5wmhS/GZXvLz/xFMthtZlam5RIZStVswFwxloGN0KAXL1TuK6u0zvCaHpHG/+iNfw7bDLgzyTfvA8f2Ed4pWhUsNs7+XOMUumjWto7sUZAhwazt9vu+SJO0aAhmWnz2zQH9GAj9DlYDD8fB0Cq7tl5TX6Ewc0MR+G3GTPIbeSTkTsL3gXKixKh6i8+IJUE0LbPk+0BiPrbS+gqvq2ESyLSuo/f8qwXccUUPqL00U7EzWxb2ho97OotWph2NYiSSoDUbWC+yZov/tI4v7cxmUaGjMGWqgaM5N26feZe8qGfLAb6inDdBF3DBmqtUF14nPTBYvf5y+vGHyDiZhGGapzw59WNCsTfNJ1iugSSy4SzMVMG+VG++8EFKzApuXa3qv7VOLhPx7olxYV6m9fSgMz3IG16XDiQDEmjAPN4nbDmNp7yAzmmybh+86kWnXxUPKmiY81tMAUZAtu9oAAkPjqT5JEopi5acXmLHaVQ/JrIZiPDbeDJln+gmmM6vun9nkDH7JXCHdEGIU+3hA2pHJBzQ4lGKFC5bmV13CtBDRygZ1Kjx8zNehPlsC4Lsnf4kpYF4ugUSEpQJfQQeko/B/+h3UM7LkxYXo1L71ZkHjdusDX5ltgmnuVzPeZvmVb9tRIvcqSLZaOaZrQ8/CTHsSOvhIq+vdmI1NZD6aJVnVoMYeoDRurVKbo47Iocg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(451199015)(6486002)(8936002)(5660300002)(33656002)(83380400001)(66556008)(316002)(66946007)(41300700001)(2906002)(36756003)(76116006)(66476007)(64756008)(91956017)(478600001)(6916009)(66446008)(71200400001)(54906003)(4326008)(8676002)(186003)(2616005)(966005)(38100700002)(38070700005)(53546011)(6506007)(86362001)(26005)(122000001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FF46995628AC20409531A772612DFD6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5654
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23168df9-296d-4350-71c9-08dac0db6421
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/i2yeo7Hd7mVUcgTkh/gifNcspYaWUccd3uw+EHNxRA3kxy66PcUs8l/R0Hg4XnNvP2S3hzWpilVi5FhixYAVqT3FMBwvqJ7AXoTfJZ8AntWBX9CDhY3MtlhqZH5Pq4VI2KKUAhPMwoDUgv2KiCrKk6bxPiKExn9IiJV+Ap083H/rVNL6Kki1v89Uq7KV3QXYH7PMcQTKaB/NkicAn/1N0EWybFkxO2GyhidzNuhGcQMEfgPWlpNF4VCt4xYJpJzMDU187tT6S3mFE0itqYesGzHjLwjwj/sb/QDfamVtPDht3hyfofFFB2oIHZps/eb/XV2KBGgknxolNJjR6hkHPsHKIZkK5bac6QzMKXVp2NoabyXoPObjIDHvzz11QyXaqw+UJEh/4yYglafVqYeNBWQF+XDRkuRcjrXBrkw45FadC0M+wUmAhgLm1oDBJd6r0YDXTw/p94obeNDeeyro25X6EiFqg5zdThGjMDP/WNyqXMfBiiM2K3dBoU/rnSTTx1OftlomQdKb+DCF4zs5TKqdhutKXxB7XRmTf1ehtD3jKyXD+4EXN/LKkCCTP289jpTf7oQ6A+99YIo/22REfp50YhSe9jDw7RFxrM5mQ7/fOrAT55h9xqP9PthCquRaIrAeJhcpWlNvlBb6ww0B7sZD9paE41sdehFD14wZfl9+ywNi9M1UyLagHngEI1AOVAv1Re6ZMC4Jlxu0QNDvb+ulkOww0XAzOUySmcU2ey+ld949u+uJtjE50kfpI/Em6QGehg4TqZr/oMB6tjNkinmmwOSBVOEHbWXVkr/GOUoAUiNlIXl3yBqegrw7AVS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(36756003)(33656002)(81166007)(86362001)(966005)(316002)(6486002)(356005)(54906003)(82310400005)(36860700001)(478600001)(82740400003)(6512007)(26005)(6506007)(53546011)(8936002)(70206006)(8676002)(4326008)(5660300002)(70586007)(40460700003)(336012)(186003)(47076005)(83380400001)(6862004)(2616005)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:16:24.5275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2982feaf-27a9-412b-eca2-08dac0db6aab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5884

Hi Julien,

> On 7 Nov 2022, at 15:58, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 03/11/2022 17:43, Bertrand Marquis wrote:
>> Hi,
>=20
> Hi Bertrand,
>=20
>> +Julien and Stefano
>>> On 2 Nov 2022, at 09:58, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 01.11.2022 08:56, Juergen Gross wrote:
>>>> On 29.10.22 23:50, osstest service owner wrote:
>>>>> flight 174539 linux-linus real [real]
>>>>> http://logs.test-lab.xenproject.org/osstest/logs/174539/
>>>>>=20
>>>>> Regressions :-(
>>>>=20
>>>> I'm rather sure this is not kernel related, as the issue is occurring =
only on
>>>> Arm and it doesn't seem to be an architecture related issue (the volum=
e group
>>>> containing the root file system couldn't be found).
>>>>=20
>>>> Could it be an infrastructure problem?
>>>=20
>>> Why would such manifest on only linux-linus? Along the lines of what I
>>> did say in reply to flight 173480's report I continue to think that
>>> there's an issue with the loading of a driver, perhaps because of a
>>> bad / missing dependency just on Arm. Sadly the log doesn't have any
>>> data in that regard (perhaps because of too low verbosity), so I
>>> suspect finding out can only be done by someone with actual access to
>>> one of the affected systems.
>> @Julien or Stefano: Can one of you check this ?
>=20
> Sorry I was away part of last week. I will have a look this week.

Thanks :-) I was not really looking forward into understanding OSSTEST righ=
t now ;-)

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


