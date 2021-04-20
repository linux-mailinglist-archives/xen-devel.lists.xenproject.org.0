Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1FD36547F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 10:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113392.216056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYm2L-0000PW-2e; Tue, 20 Apr 2021 08:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113392.216056; Tue, 20 Apr 2021 08:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYm2K-0000PB-Us; Tue, 20 Apr 2021 08:47:12 +0000
Received: by outflank-mailman (input) for mailman id 113392;
 Tue, 20 Apr 2021 08:47:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4LT=JR=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lYm2J-0000P6-EV
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 08:47:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3b8f326-e4f4-4c35-a5e0-129f1eb66bfa;
 Tue, 20 Apr 2021 08:47:08 +0000 (UTC)
Received: from DB6PR1001CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::24)
 by AM7PR08MB5302.eurprd08.prod.outlook.com (2603:10a6:20b:103::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 08:47:06 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::a6) by DB6PR1001CA0038.outlook.office365.com
 (2603:10a6:4:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Tue, 20 Apr 2021 08:47:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 08:47:06 +0000
Received: ("Tessian outbound 4ee49f77c636:v90");
 Tue, 20 Apr 2021 08:47:05 +0000
Received: from 06c2448771e8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E66EDBB3-71E4-4D75-B08A-48D4DB7E584C.1; 
 Tue, 20 Apr 2021 08:46:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06c2448771e8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Apr 2021 08:46:54 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3984.eurprd08.prod.outlook.com (2603:10a6:803:e9::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 08:46:51 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 08:46:51 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0440.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.19 via Frontend Transport; Tue, 20 Apr 2021 08:46:50 +0000
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
X-Inumbo-ID: b3b8f326-e4f4-4c35-a5e0-129f1eb66bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhqrjjVWf5RYo5qRfmT4X90AeDm9BwL8JQdF4Qd8064=;
 b=lJCD+uZxk+p3vn6Cesb06pBfDb2McNAL8BkJbY5JzNHH9XXsH1tEZOVct7qhB7fOGa4oftQDRPwWV+RIZJpACdd0ziTfGjJCcNdH+xNiEgb60wphTLPx2nBJvoBZS9IrC9Qk2CggsVy8frx+AnMSYzV719KkBYiULvHNWVy8zMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a07f7b1d88f0f1d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gpwnan+T37ovopAU2HrPU27vuv6Pe/nkgrSP1hFzvT1o6RpCkJe+FPTMQVSlsDZRKM46vzbTC1xQppHtZXi61RSZJHjR7cb5sz7eSQ1w0tB1/xFfQdcButCvjcrdbN5rTcxRi5gMIqDZwMYpEsF+Yf/ZvMvwr1ePIcUHA1QtqBunzP//ob9K5xOR4+kJxDEriJGTLVHNkr3ly5nSHCaPcZa3XVsaGJO0Z2tIXPenMdiE3xQgIT7s08ChOma7Y7Ab2TRIlvHF3KTOvpUUTYt4ZGhjHoZl4mGorAYGiIQChUkDS+03TeeolqiNwt/KsiI/xcB29vmQVSmdE5YbpV1i4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhqrjjVWf5RYo5qRfmT4X90AeDm9BwL8JQdF4Qd8064=;
 b=azG12MxyT8vJ4/rK1aFpskrQLHXf7AenPK64Wpiq6HbkFrwThSCRLGK0BaVvGNtsyruVSmKZv2S4wn3qYEQ4U2Xr7pmeROTFxFvH3qlilFO6iK4RKZsUIdwJ+PwADJ9Tg5zZTogTLhqnqFMcfNgSFboQ/OueZXHTKwVR6i0jNOsOL+SJbgwoZ5ON927Z2ilLMEyzr3uGqjnUOSHQSr12G5G/AJFann/O9M0nLQeJxV6a0m4UORDWEvde2ECpo+3nbaiE1Z9goU+Ldz2s4C+eTP6YwF1ancCtIl8oJfHPXJKI9ot7RNL3DL3uCUF7gfaBViD3tWtydveD+/vmuXmhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhqrjjVWf5RYo5qRfmT4X90AeDm9BwL8JQdF4Qd8064=;
 b=lJCD+uZxk+p3vn6Cesb06pBfDb2McNAL8BkJbY5JzNHH9XXsH1tEZOVct7qhB7fOGa4oftQDRPwWV+RIZJpACdd0ziTfGjJCcNdH+xNiEgb60wphTLPx2nBJvoBZS9IrC9Qk2CggsVy8frx+AnMSYzV719KkBYiULvHNWVy8zMU=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
Date: Tue, 20 Apr 2021 09:46:44 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F26E53E-0C0A-4596-AC88-F803BC7A0493@arm.com>
References: <20210419091231.55684-1-luca.fancellu@arm.com>
 <20210419091231.55684-4-luca.fancellu@arm.com>
 <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0440.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::13) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 913f08eb-b67d-48b2-9c1c-08d903d8e045
X-MS-TrafficTypeDiagnostic: VI1PR08MB3984:|AM7PR08MB5302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5302C874457E31C48BA82C86E4489@AM7PR08MB5302.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x5OQI8oM/2vdMc8tp0QsLsj/o9uYKbAIXipabt2xN1pbvAn58nePRp0IVvnvypzwT8OmnFbQdCAVChGgA3CNiBKaIQyQGcE3CwB3j2NCXNF8hhwaC1Zsv60ngSGfYNPMAOUNBQpIh78RqG5UtV+qfv6sZlU00HhGeh+KfSiHgTR5oSjxectyRuTqWfu3Xusul/bOT2LeJUtNYluLT3mAly7JZ0TTOhir1ZixqSsXR1Dl0cwZMKns/A0MUrU7Q2gP0B0yLaX0ljnOmIroNeAzgMHsj79zw+YvHd1uwVhmBvOOV1W0PC7VZlnrlkfZz2SJAgGKNNHykbJ7Re6NvDtp5gMfZnXs2knsgGzi7tSbdeqN9bxuoVMMUlk2VBR4dLZoiMgKZaR1FQAz0lYW2QOl0tisZFPbclECPcW6vb6kYf96j0PtQmTarZOoBl3iOqsqECcRQa3n/oKakCjDWqhFLMXrx4FUFINdA2Oc9pgYgtPffu5vR+5SPcmAsBluIi3CR0lTdnPwPyubYKD+FORxBXg5/B9fnI5Nyvil6Ys7sh0vrVTAaSgIafySNMw0JLV+3PXMg0tyFpPHWP/adhrFdbOpBJmZ7hqlT98XI7B75IoHSMvKmbJOZ4XwpGhuy3NGcoKghchQeNbMGdmL/REZTXEF8/2UptWWFz4FKett/YH+GYY3fQ0KjOguu1F9i3TX0itZlJYYQ+Mqvxkgbu7wykI+6p4cC1VwUa/wSh87kCrtfq5D+BaLxRmDtS41adqYWk14iwd+EGGijf3W/jTfdA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(44832011)(66946007)(8936002)(33656002)(38100700002)(186003)(2616005)(6916009)(8676002)(956004)(53546011)(83380400001)(478600001)(6486002)(66476007)(316002)(36756003)(2906002)(66556008)(86362001)(4326008)(54906003)(966005)(7696005)(6666004)(26005)(52116002)(16526019)(5660300002)(38350700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?b29VN0pEOHFNUVNnbitzZjlMeDlTcGM4OFBZN2FXSlB2MFlLbWtPZUVQM0tU?=
 =?utf-8?B?QjgwaXNOQzduNzF1amFya0ZFTHpzWEtialdUZSt6OFNPSlFFekplckQzc0NB?=
 =?utf-8?B?ZzA4QStxeis2b2xLN3UyS1REUmVpQnZqRytQYTM3TGRKbEZkaW9PNEtESUNO?=
 =?utf-8?B?OFZyRjNmMmJtcWJrVEY5MmcrSkZBYm0vVFN0NUdJRWRlU2QwNXQ0LzBSVFd4?=
 =?utf-8?B?SGVRQktLdlJxMjFiVnpIVkxZeWNmUG9JZEliS0hsbDdPUTNwT3g1aWlGand1?=
 =?utf-8?B?YlAxeGgreFY3Z3lRSlRlUnF0b1pzK254eUJaVEQxcEpEdy94SjhVODFvZGxT?=
 =?utf-8?B?OGpSNmNnSFZzRVhLMHRHc0lZZU92VXVHeW5LMWV2MkZXV3VKWG5JVmtxb2ho?=
 =?utf-8?B?SGF5clVXaU5DdnlMdG56cjhrTUZoUStVS2lsV2RPZjJGY01ndmpwdWtpM08r?=
 =?utf-8?B?SjlJb1BacXUyZDdkNktpcXRUK1VzMmJZRHRJdlExNWZhTmdqUk9MdnhhSC9C?=
 =?utf-8?B?Uk5TNldjVHh6UUxxK1ZQRnJtaStydnB0Q0p4RXdvOXh6WnNybml0alhCQ3Zj?=
 =?utf-8?B?ZlNPTnBOMHZLS3hRVGhHRWVHSVF5cGpZZ01aSzBMU3FDM0ppd2ZXWEFGUmdQ?=
 =?utf-8?B?YVI4Snd4U2xNeitQdEdaeTQrY3E1ODNFRHMxNS9wQzFXVzlNc0tEUXc5QzZj?=
 =?utf-8?B?Z2owTDkvbjRBTE1xNFdWemtXVEoyYVk5NVdadXEvR3lvR1hRU0Q0dFhoN3Vz?=
 =?utf-8?B?UG1TUmdqYjY5dUJLQit6elRZSkR5cXpQeFdwN2JDTTVYc0t0M2NiRC9nNHl3?=
 =?utf-8?B?elBOYnd0Y1hPcFMzYk1zUlJFcW5oVlJ4SGMzc0pWZnE5dFRhTGtVNWd3VEMw?=
 =?utf-8?B?b2k2TVprR3JXd0FSdC9EMUlSWjg3SW52MFlRc3VzR1lSUHVZczd6QWd5bzRj?=
 =?utf-8?B?QnVyVmRMbXBqY2gvUFBac1BiODdPTUNNV3RRSDRYK1hHMjZhRXpzK3M3d3Ax?=
 =?utf-8?B?QnBXRzZEZ2E5WkFuRWc2MlBCc01ob2NGckNHMDFMM01KSENnck42ZXl5OWlQ?=
 =?utf-8?B?N3pSK0lvRS81T0pGa3B5L2c4ODhod2MvMkFIWGYvTGpWYWk4QkxIeDhjeUtN?=
 =?utf-8?B?NmZuQ1h0WXZDUmh0cnZCYUhFdjRrRC9DcVd3MzNPZ1o4SDc4VGhYZ3JxREZX?=
 =?utf-8?B?WVdSam9RUmwvVWRjNkhKQkhHc1dxdHJkaGV0VVdqbzJPVlg1a1VOOTc3QmVM?=
 =?utf-8?B?KzZQR2cxS1JjUkplYUVCS21zaGx1a3l3VWRteWRveDUxamhhd3FWU2plWW9V?=
 =?utf-8?B?cmM3M0dROG1CVHNCaFJtYkkrM1JVdGZhSmNlMUlWbXRUUS9XMjlncm9UVFJp?=
 =?utf-8?B?cFNnMGJOcU9ob2VHQUJHN3JpaWl2OFczK1hTYVk4VVhuazFSMDdLT092bEhR?=
 =?utf-8?B?VnBFbzcvcHkvenRPVWdMeHM3OGFDc2NXVkwxY0V2ZkNDekp0bDJQMTVhY2J5?=
 =?utf-8?B?QTBFVVd4TlRvb1EvRjh4S1Mxc21Od3VXYUZ1OGhlWVJFeEVINWFNN2tDQ0F6?=
 =?utf-8?B?NFlvSklLd1lWaER5a3VmeWYwUm5vSEwwMUwyRU9yV2NIc1h1eTNZRTZYLzdQ?=
 =?utf-8?B?WEZUU2R4dDRQUnRIZS83QVp2WndjS1FxVjFFclJ3UnFEY1l1TldVUFhyRmh4?=
 =?utf-8?B?YkpSdlhiWklId3R1TzNpNkdZc2cwQVk2czR2SVczV0tDd1FLSkltQjEzTE4r?=
 =?utf-8?Q?StOgExYulTz7ORRQSzdrRSvcVpNEwtK3HQoqaiJ?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3984
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d60fdd22-f241-4c1b-e45a-08d903d8d75a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zEd76CuvHjRUHVlreUZR+JQadKi0mHLoe7evhZzABU2ceJvh8TIwMrxoNSmW8dBAq7EvwTmPa3oZBYmecV2SKcLJgXKBQqd8Ne34qtKqBLfbMCzNmalvti31pZDIySGT8SQek4BFR6oN5NvD+rhhOTy5mOGXNboOMOyWlxirfjfp42fjz2MnOO4qxyFbC8vD71Iy/0Epc/zIre75vItBLxmdn3JQjr1MIJqA4zpLP0DuI1XrqcpxCl3yYmohslgFeD86cnzKzTT5oJTp6HRDGYltXeyWX2LZuoiGdTSb+wWDGLd9CoVtmQYBN2jisyexw5HlF3I7ok2YflNMn5Krqxm0foJmfPla0AVYA9ikxGQj6RylUjtZgbe9m81NURhxkvBlrE2i/gbObYdhglIdGWkGbQowlBOzhYnt5RK1E4UL+QwWL4Ah4xzHNGZ3BgrFKBJOt4hgs+Okiipe1DkQvNampzvmgSshsfM6h37Cj5uQEYUVj39elFA/3hLdmdagsRkB2tQ9wuwWmxuO6CGDJTFmHsvx4apIIqVuUiTK7XEbES4ulTy52yH3w8G0nzJpgwK+lASrc/fy81cmUufrGR/qKzHQV3gMrzmDuNP6ys3zmh4z5mTrhG2x1voVOzl5Av9/l53DTCwRrHyEyOXyWicXxbLZUFBwq7/zHGCrQbDjf/+L6fOE/QCHMyhR20u85upuXFmj+W2lilSYYMktmbCdT8SSGHfy7zGBzeXlsuI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(36840700001)(46966006)(16526019)(6486002)(2616005)(186003)(70206006)(966005)(478600001)(54906003)(26005)(70586007)(8936002)(33656002)(53546011)(336012)(6666004)(956004)(7696005)(36860700001)(82740400003)(47076005)(8676002)(86362001)(5660300002)(83380400001)(44832011)(82310400003)(2906002)(356005)(36756003)(4326008)(81166007)(6862004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 08:47:06.0033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913f08eb-b67d-48b2-9c1c-08d903d8e045
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5302



> On 19 Apr 2021, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 19.04.2021 11:12, Luca Fancellu wrote:
>> Modification to include/public/grant_table.h:
>>=20
>> 1) Add doxygen tags to:
>> - Create Grant tables section
>> - include variables in the generated documentation
>> 2) Add .rst file for grant table for Arm64
>=20
> I'm missing some reasoning about at least some of the changes done
> to grant_table.h. Looking at this and the earlier patches I also
> couldn't spot any general outline of what is acceptable or even
> necessary in such a header to be understood by doxygen. Without
> this written down somewhere (or, if documented elsewhere, a
> pointer provided to that doc) I'm afraid things might get screwed
> up again later on.

Hi Jan,

Doxygen is a tool that generates documentation based on parsing the source =
code comments, it recognises some
commands in the comments and builds the documentation sticking to what you =
wrote.

Here the doxygen docs: https://www.doxygen.nl/manual/docblocks.html

Basically it doesn=E2=80=99t react to all comments, it parses only some wel=
l crafted comments as explained in its documentation.

>=20
>> --- a/docs/hypercall-interfaces/arm64.rst
>> +++ b/docs/hypercall-interfaces/arm64.rst
>> @@ -8,6 +8,7 @@ Starting points
>> .. toctree::
>>    :maxdepth: 2
>>=20
>> +   arm64/grant_tables
>>=20
>>=20
>> Functions
>> diff --git a/docs/hypercall-interfaces/arm64/grant_tables.rst b/docs/hyp=
ercall-interfaces/arm64/grant_tables.rst
>> new file mode 100644
>> index 0000000000..8955ec5812
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/arm64/grant_tables.rst
>> @@ -0,0 +1,8 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Grant Tables
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. doxygengroup:: grant_table
>=20
> Why is this Arm64-specific?

This particular one is Arm64 specific, but it doesn=E2=80=99t mean that gra=
nt tables are arm specific, it is only that for now I=E2=80=99m
Introducing a partial documentation in the arm side. Any other user can in =
the future add more documentation for
each platform.

>=20
>> @@ -73,20 +75,25 @@
>>  *                           frame, or zero if none.
>>  *  3. Write memory barrier (WMB).
>>  *  4. Write ent->flags, inc. valid type.
>> + * @endcode
>>  *
>>  * Invalidating an unused GTF_permit_access entry:
>> + * @code
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>  *  NB. No need for WMB as reuse of entry is control-dependent on succes=
s of
>>  *      step 3, and all architectures guarantee ordering of ctrl-dep wri=
tes.
>> + * @endcode
>>  *
>>  * Invalidating an in-use GTF_permit_access entry:
>> + *
>>  *  This cannot be done directly. Request assistance from the domain con=
troller
>>  *  which can set a timeout on the use of a grant entry and take necessa=
ry
>>  *  action. (NB. This is not yet implemented!).
>>  *
>>  * Invalidating an unused GTF_accept_transfer entry:
>> + * @code
>>  *  1. flags =3D ent->flags.
>>  *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>> @@ -97,47 +104,55 @@
>>  *      transferred frame is written. It is safe for the guest to spin w=
aiting
>>  *      for this to occur (detect by observing GTF_transfer_completed in
>>  *      ent->flags).
>> + * @endcode
>>  *
>>  * Invalidating a committed GTF_accept_transfer entry:
>>  *  1. Wait for (ent->flags & GTF_transfer_completed).
>>  *
>>  * Changing a GTF_permit_access from writable to read-only:
>> + *
>>  *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writin=
g.
>>  *
>>  * Changing a GTF_permit_access from read-only to writable:
>> + *
>>  *  Use SMP-safe bit-setting instruction.
>=20
> For example - are the blank lines you add necessary or merely nice
> to have in your personal opinion?

The blank lines makes the docs output more good looking

>=20
>> - */
>> -
>> -/*
>> - * Reference to a grant entry in a specified domain's grant table.
>> - */
>> -typedef uint32_t grant_ref_t;
>=20
> Why does this get moved ...
>=20
>> -
>> -/*
>> + *
>>  * A grant table comprises a packed array of grant entries in one or mor=
e
>>  * page frames shared between Xen and a guest.
>> + *
>>  * [XEN]: This field is written by Xen and read by the sharing guest.
>> + *
>>  * [GST]: This field is written by the guest and read by Xen.
>> + *
>> + * @addtogroup grant_table Grant Tables
>> + * @{
>>  */
>>=20
>> -/*
>> - * Version 1 of the grant table entry structure is maintained purely
>> - * for backwards compatibility.  New guests should use version 2.
>> +/**
>> + * Reference to a grant entry in a specified domain's grant table.
>>  */
>> +typedef uint32_t grant_ref_t;
>=20
> ... here, past a comment unrelated to it?

The comment =E2=80=9CVersion 1 of the grant table entry [=E2=80=A6]=E2=80=
=9D was moved on top of the struct grant_entry_v1, in this way
Doxygen associate the comment to that structure.

The comment =E2=80=9CReference to a grant entry in a specified domain's gra=
nt table.=E2=80=9D Is moved on top of typedef uint32_t grant_ref_t
for the same reason above

>=20
>> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>>      * In that case, the frame field has the same semantics as the
>>      * field of the same name in the V1 entry structure.
>>      */
>> +    /** @cond skip anonymous struct/union for doxygen */
>>     struct {
>>         grant_entry_header_t hdr;
>>         uint32_t pad0;
>>         uint64_t frame;
>>     } full_page;
>> +    /** @endcond */
>>=20
>>     /*
>>      * If the grant type is GTF_grant_access and GTF_sub_page is set,
>>      * @domid is allowed to access bytes [@page_off,@page_off+@length)
>>      * in frame @frame.
>>      */
>> +    /** @cond skip anonymous struct/union for doxygen */
>>     struct {
>>         grant_entry_header_t hdr;
>>         uint16_t page_off;
>>         uint16_t length;
>>         uint64_t frame;
>>     } sub_page;
>> +    /** @endcond */
>>=20
>>     /*
>>      * If the grant is GTF_transitive, @domid is allowed to use the
>> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>>      * The current version of Xen does not allow transitive grants
>>      * to be mapped.
>>      */
>> +    /** @cond skip anonymous struct/union for doxygen */
>>     struct {
>>         grant_entry_header_t hdr;
>>         domid_t trans_domid;
>>         uint16_t pad0;
>>         grant_ref_t gref;
>>     } transitive;
>> +    /** @endcond */
>=20
> While already better than the introduction of strange struct tags,
> I'm still not convinced we want this extra clutter (sorry). Plus -
> don't these additions mean the sub-structures then won't be
> represented in the generated doc, rendering it (partly) useless?

Are you suggesting to remove the structure from docs?

>=20
>> @@ -433,7 +454,12 @@ typedef struct gnttab_transfer gnttab_transfer_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>=20
>>=20
>> -/*
>> +#define _GNTCOPY_source_gref      (0)
>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> +#define _GNTCOPY_dest_gref        (1)
>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>> +
>> +/**
>>  * GNTTABOP_copy: Hypervisor based copy
>>  * source and destinations can be eithers MFNs or, for foreign domains,
>>  * grant references. the foreign domain has to grant read/write access
>> @@ -451,18 +477,15 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>  * bytes to be copied.
>>  */
>>=20
>> -#define _GNTCOPY_source_gref      (0)
>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>> -#define _GNTCOPY_dest_gref        (1)
>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>> -
>> struct gnttab_copy {
>=20
> Again the question - why the movement?

Doxygen takes the comment just above the data structure to build the docs, =
so here we are moving the
Comment just on top of the described structure.

>=20
>> @@ -579,17 +602,19 @@ struct gnttab_swap_grant_ref {
>> typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
>> DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>>=20
>> -/*
>> +/**
>>  * Issue one or more cache maintenance operations on a portion of a
>>  * page granted to the calling domain by a foreign domain.
>>  */
>> struct gnttab_cache_flush {
>> +    /** @cond skip anonymous struct/union for doxygen */
>>     union {
>>         uint64_t dev_bus_addr;
>>         grant_ref_t ref;
>>     } a;
>> -    uint16_t offset; /* offset from start of grant */
>> -    uint16_t length; /* size within the grant */
>> +    /** @endcond */
>> +    uint16_t offset; /**< offset from start of grant */
>> +    uint16_t length; /**< size within the grant */
>=20
> Skipping just part of a struct is perhaps even more confusing than
> omitting it altogether.
>=20
> Also, what's the significance of "/**<" ?

It is a doxygen pattern that tells it to use the comment as a field related=
 documentation.
If you build the documentation you will find the result, I encourage you to=
 see it to
realize the power of the tool and the benefits that Xen can get with it.

Cheers,
Luca

>=20
> Jan


