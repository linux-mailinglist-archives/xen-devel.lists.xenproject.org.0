Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81655A7AA8
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 11:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395589.635350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTKP4-0006CC-37; Wed, 31 Aug 2022 09:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395589.635350; Wed, 31 Aug 2022 09:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTKP3-00069j-VQ; Wed, 31 Aug 2022 09:52:57 +0000
Received: by outflank-mailman (input) for mailman id 395589;
 Wed, 31 Aug 2022 09:52:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9FNh=ZD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oTKP2-00069d-0z
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 09:52:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adef4755-2912-11ed-bd2e-47488cf2e6aa;
 Wed, 31 Aug 2022 11:52:53 +0200 (CEST)
Received: from DB6PR0301CA0088.eurprd03.prod.outlook.com (2603:10a6:6:30::35)
 by GV2PR08MB7930.eurprd08.prod.outlook.com (2603:10a6:150:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Wed, 31 Aug
 2022 09:52:40 +0000
Received: from DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::d9) by DB6PR0301CA0088.outlook.office365.com
 (2603:10a6:6:30::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 31 Aug 2022 09:52:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT007.mail.protection.outlook.com (100.127.142.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 31 Aug 2022 09:52:39 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 31 Aug 2022 09:52:39 +0000
Received: from 25eff5d7e706.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1155503-351D-4C9C-B7B7-FD0EE18603AC.1; 
 Wed, 31 Aug 2022 09:52:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 25eff5d7e706.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 31 Aug 2022 09:52:27 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7628.eurprd08.prod.outlook.com (2603:10a6:10:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Wed, 31 Aug
 2022 09:52:25 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 09:52:25 +0000
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
X-Inumbo-ID: adef4755-2912-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AkZ13qBWoiCRH8WlPPpdr32evVDnCbpglFc5o+zP4IZrEFXIm+8rsl60D2/MzYVYTqeD9ZGPTXvNHzGB17HZeDdrr/aRx0ExHHSSeZNcuNw0NlxMotHfqzn4dIdoJfsk4QKT5iQns3g3AwXMZB0RpGcrlOYxWyOYT/JzykHxpRcIpJJNVlyZ5IpG+RA49MxJFCN9GEL+Y/+cW1SWfhnTi8N755ZhiuJYz+Rn82mHpvkz2gXomjzMwYiDp4FVW5hz+O4HB68hv9b+iNZgrlis1JDwYByYpWvE3oP5peah21Ge6rfsbVrUgV86bCl4IS4+BcvJU9ulCkei6heVuKuBRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GA2gRYET2YwqadhIflqkjLc3pgwBRhZTr+JWGVqf4w=;
 b=BZaTmzFa60kIPUuIFQY0AIymMBy+AxZF1OicFGL3I4Bkv5o/QaT/ZZshOMxtAv4EXov735vCXirY1+foOaaMctTlY9tohdm0lK3LwkT3cl834ab9Jx+jMJnlypdyceZqlJlYMgxhp76GDkG8IZ3QWIg6uPyBAl4o1hOhdubd8m8anxEEV+LLkb9WeRlfdl1kZMbPrR6HXIqaUsxJHuFxN+4hCsuEuA3V1Kig1i7r7jb2fsbHxLRhsh+ewP3axFp55RVVplJPMJMRyArhQSt796GOPOm6C2njYguXah+saJJTx0nT1GN6QMMG4wb1bqxL/NvSwwN51AzZuRilK2y9IQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GA2gRYET2YwqadhIflqkjLc3pgwBRhZTr+JWGVqf4w=;
 b=y+nL55+KtfZnYInsXT6z63dghNJZTfpJKBoTn9x5CBGMmsckjw/u1vBh5u5jxpOlvXnc8zVW9sMF/NFE/FArZdYS91EA2ZzmTQULI1AH66GnVbRcHdOyoeO1ZOYyV7lvKw5IxEpsznZCbBxdip7mpfaI25rN9jmwqX5e2jRgW2Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 923da219e26e91c0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7BCZEJ4QKsK8nfGxorWqaU190Org5PH0zK3NQHmvbFZd3tQN26FiWd9O+58zcSy6U2xvYcyi6PbNTA8guS8poNTX8K1ZLsRtjjpEIsB/FHJlkN/1hOvHWGI/fBR/sPk0aIbQ6ff5RqjsvAGgrpbmmZlPfkS+zMACREeVbgQO+LaMDAVoe3jnAuRdAM/8oE5zMHGxgIZYngBeoQBlwkmCg8hXVhO5xIJqBg5ut76jtZvgG3PCStwnohpFhjy4XpI8FZYqIGPocgpHc6eRPwMJ5SKcoNW5TxAeYFKWFBlc3hIkE7LxoV7T85BICUAr1QvwRIAGniugcIA3OWMOXS4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GA2gRYET2YwqadhIflqkjLc3pgwBRhZTr+JWGVqf4w=;
 b=iek2hgAgSWCwLNy96XNRHwzLf6boU9X+2kn/aPUJlUeWp0DIJGvqkq2PK5+5jIA+euib9vq1Pr9wZnaAA8c+rifKZ7b05Io8Jufd73+2sEmoWcWMQlRJop5laeMqtVelvHZsyc8Fk4bDPUx37T5hEGYv+DlfVOPiS+0n10Ii2bK9pW2uw3oAFzk0QpiXMvwGdILC+SiNDJYThtYCb78k8Vp80aBK1GjtTdXQpKZyZL7aU+HxkRZUVXBV0IQsr5H2LBRsdJ7x9L/Pj6+U74TyiLVTIHYoM9p1/GO6tazh7x7VyILwDZxYo1utG2vQUMl+JqScsYzM5fKjV893Y6wwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GA2gRYET2YwqadhIflqkjLc3pgwBRhZTr+JWGVqf4w=;
 b=y+nL55+KtfZnYInsXT6z63dghNJZTfpJKBoTn9x5CBGMmsckjw/u1vBh5u5jxpOlvXnc8zVW9sMF/NFE/FArZdYS91EA2ZzmTQULI1AH66GnVbRcHdOyoeO1ZOYyV7lvKw5IxEpsznZCbBxdip7mpfaI25rN9jmwqX5e2jRgW2Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
	xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYs7NVsywB9ZS1YkG+gj2FUNdLeq28SEyAgAG2wYCAAAw/gIAAHKuAgAAPTYCAABB2AIAAWmwAgAAL9QCAACl/gIAAbLmAgAAg9QCAAALsAIAAhRWAgAjqDQA=
Date: Wed, 31 Aug 2022 09:52:25 +0000
Message-ID: <78E010E8-7ED4-498C-881C-2E8925FFEB04@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
 <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
 <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
 <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
 <da07bb5d-98c3-9c94-a1f0-6021e398f898@xen.org>
 <alpine.DEB.2.22.394.2208241810390.15247@ubuntu-linux-20-04-desktop>
 <646CFFC2-9259-45C8-89AB-D59AA5B0DBC1@arm.com>
 <32a74a0a-9f4f-7b3a-622b-6fb5e9a097b0@xen.org>
 <35C21FDE-5648-425A-9399-1C5E2B9A37FB@arm.com>
 <alpine.DEB.2.22.394.2208251042040.733916@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208251042040.733916@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3cad8669-04cf-442b-4e6d-08da8b368a63
x-ms-traffictypediagnostic:
	DB9PR08MB7628:EE_|DBAEUR03FT007:EE_|GV2PR08MB7930:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WfdMIaJ3VGhw1AeYp3tJb/Cxz5fXe7Mg3JxRfmXRGJZ5hZJhEv5E0Cecb2OVfAP5n8VYW0DzrITiMTocCg4eQFxcsq08InuynAsIyyigTfbTaXg8Mxst5nBem0j+l5K4srkAR1UvtHAy+FtWn57iK5+bH36QxRFrojIb0hj1+PIFg2mJA4NkZzV5VjZjawenSqM2KtzUuibpx11PWRVaQqnS3Doz+rLEhMQBntfCQUqk5qLC8AapE+fL75EVfiXoOFQ+dGyiyoK2ulycmpMOHQLjb9VZDh28XGqqZdIj+z/i+uq9fwox2efVX0i9FXVnI4HqgpHci5h9wTN0uEWnWNxv0+tmKB2Pupr2YHO5YE8Vj1zkx5Zpqd1Mlq97umPB5QozAj2/cy+PFBTLmojsF9Y8S2Qm8JxhMjd9hL5Wu/LRM48az/eL7C7QTPa87+ffK9t8UsoieXvYpsfHh6TqJAUEWVVuzDd2vR9iJ55WsYSFdNIACa2WfhCbrTAe/dWlqxT4yy6/nhvXDMYabipPScV2w+5kb9M6IRCymo/3PtzkD2zYWZSif3z9kAfVvyke8LGk9hQLSmJd1oLIsolHGsnDhKsG0Zqw3/IAZJlwn44XZAbTfPfw298HUXroLrzjQSPj59ngiJ0wdROOd3g7dbXzsgqn6C4LEBzeKA74X4b+AJ9pZzEakfZo18W/At5sSd5hECjTt9p9cyEVAinDCtNfIZiAikexZYTYWv/EU2r0ud+WPHM6Lo333UsECsJTxryUhldL2lVSXitZLfbH4PylASOd3Qy52C6s1Vg0qxg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(66556008)(122000001)(66946007)(38070700005)(86362001)(41300700001)(4326008)(66476007)(6486002)(76116006)(38100700002)(64756008)(8676002)(66446008)(54906003)(5660300002)(478600001)(8936002)(2616005)(186003)(6916009)(316002)(71200400001)(91956017)(33656002)(2906002)(83380400001)(53546011)(26005)(6506007)(6512007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB0DCE2FB72ABE48AB3090970014002D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7628
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01829536-6d70-47bf-0b3c-08da8b3681ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6MXj93/xJ3G67SBJtPtMX+YtGnzwqK0403ZODOwPFmCmyTN3yf40GpP5oJCw+/UBgWkWMW15tLitcj+pyAVVih27GJHtAX7I61qWW7mbdnx8obWGo9mMlQdwalTO2ibeXnKbb5gXEK5XEa3G7H1VJN4cVFOUY0+iVH5r+ndQyi58xQeUUwspSqSwnCe2yUHF5YaOPSLi5+YjuRs3s2znxH21XDoUMsKErupSUG7yLvV8oug0qQS/kOqbD6xIs4bCipeFiATaBN0j8oafBTs0O1lU3xmYeFjZIDe7ow0ea5uJF3+DlpaLTQ+h8S6yzzOI2pDi/1PeXBg4M0r83MtTLcSk8j6DeCIseQj/NfrGm5P7dmz7Sl1XwynTTh8aLWFM7TVGYGozpWW27bzkPd06393kq8NeWELVAnyli+OILOhlxTwG12iQHmnHukL+3a+1SvhBHDd5FgVIcJedbjFDA8P1n/a5vSWArXsU/X7gJCiTFc0T1BGvOFuSaIdiXss7JV8qn0njgoCaDeDUFr939i759MHszMB/XsYUaNlix+t9B36erCE6gf3gmTp5/WckwijROzJkpGJGfyu4XymhTRgmRQPskkyLxmZrPXvnhAnCsWz0nHsn7m420S6cYN009Tqz5/GpMbzeTxrC6AmQ29eI1mdXK9+21tsGpbPb7Tk8ZkOrwM/C9Bk0ko7cTGqeEDRSEp5Q8o8PUN5CQtv7p5uy8vl2PYTuz8pgwI2i9KuRNmA8ezHBB9Z6kzp7GbrJHzIJOg3iTlnyIV60yfYvMA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(40470700004)(46966006)(83380400001)(82310400005)(82740400003)(2906002)(6512007)(53546011)(2616005)(6506007)(26005)(36860700001)(47076005)(40480700001)(33656002)(186003)(336012)(40460700003)(54906003)(4326008)(8676002)(316002)(70206006)(70586007)(6486002)(107886003)(356005)(36756003)(8936002)(81166007)(6862004)(86362001)(41300700001)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 09:52:39.2605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cad8669-04cf-442b-4e6d-08da8b368a63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7930

SGkgU3RlZmFubywNCg0KPiBPbiAyNSBBdWcgMjAyMiwgYXQgMTg6NDQsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDI1IEF1
ZyAyMDIyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IE9uIDI1IEF1ZyAyMDIyLCBhdCAx
MDozNywgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gT24gMjUvMDgv
MjAyMiAwODozOSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gSGksDQo+Pj4+PiBPbiAy
NSBBdWcgMjAyMiwgYXQgMDI6MTAsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IE9uIFdlZCwgMjQgQXVnIDIwMjIsIEp1bGll
biBHcmFsbCB3cm90ZToNCj4+Pj4+PiBPbiAyNC8wOC8yMDIyIDIyOjU5LCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6DQo+Pj4+Pj4+IE9uIFdlZCwgMjQgQXVnIDIwMjIsIFJhaHVsIFNpbmdoIHdy
b3RlOg0KPj4+Pj4+Pj4+IE9uIDI0IEF1ZyAyMDIyLCBhdCA0OjM2IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAyNC8wOC8yMDIyIDE1OjQyLCBS
YWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4+Pj4+IE9uIDI0IEF1ZyAyMDIyLCBhdCAxOjU5IHBt
LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IE9uIDI0LzA4LzIwMjIgMTM6MTUs
IFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+IEhpIEp1bGllbiwNCj4+Pj4+Pj4+Pj4+
IA0KPj4+Pj4+Pj4+Pj4gSGkgUmFodWwsDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+PiBQbGVh
c2UgbGV0IG1lIGtub3cgeW91ciB2aWV3IG9uIHRoaXMuDQo+Pj4+Pj4+Pj4+Pj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+Pj4+Pj4+Pj4+IGIveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+Pj4+Pj4+Pj4gaW5kZXggYmZlN2JjNmIzNi4uYTFlMjNl
ZWU1OSAxMDA2NDQNCj4+Pj4+Pj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMNCj4+Pj4+Pj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+
Pj4+Pj4+PiBAQCAtMzU2MiwxMiArMzU2Miw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVj
dF9kb21VKHN0cnVjdA0KPj4+Pj4+Pj4+Pj4+IGRvbWFpbiAqZCwNCj4+Pj4+Pj4+Pj4+PiAgIGlm
ICggcmMgPT0gLUVJTFNFUSB8fA0KPj4+Pj4+Pj4+Pj4+ICAgICByYyA9PSAtRU5PREFUQSB8fA0K
Pj4+Pj4+Pj4+Pj4+ICAgICAocmMgPT0gMCAmJiAhc3RyY21wKGRvbTBsZXNzX2VuaGFuY2VkLCDi
gJxlbmFibGVk4oCdKSkgKQ0KPj4+Pj4+Pj4+Pj4+IC0gIHsNCj4+Pj4+Pj4+Pj4+PiAtICAgIGlm
ICggaGFyZHdhcmVfZG9tYWluICkNCj4+Pj4+Pj4+Pj4+PiAgICAgICBraW5mby5kb20wbGVzc19l
bmhhbmNlZCA9IHRydWU7DQo+Pj4+Pj4+Pj4+Pj4gLSAgICBlbHNlDQo+Pj4+Pj4+Pj4+Pj4gLSAg
ICAgIHBhbmljKOKAnFRyaWVkIHRvIHVzZSB4ZW4sZW5oYW5jZWQgd2l0aG91dCBkb20wXG7igJ0p
Ow0KPj4+Pj4+Pj4+Pj4+IC0gIH0NCj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4gWW91IGNhbid0
IHVzZSAieGVuLGVuaGFuY2VkIiB3aXRob3V0IGRvbTAuIEluIGZhY3QsIHlvdSB3aWxsIGVuZCB1
cA0KPj4+Pj4+Pj4+Pj4gdG8gZGVyZWZlcmVuY2UgTlVMTCBpbiBhbGxvY194ZW5zdG9yZV9ldnRj
aG4oKS4gVGhhdCdzIGJlY2F1c2UNCj4+Pj4+Pj4+Pj4+ICJ4ZW4sZW5oYW5jZWQiIG1lYW5zIHRo
ZSBkb21haW4gd2lsbCBiZSBhYmxlIHRvIHVzZSBYZW5zdG9yZWQuDQo+Pj4+Pj4+Pj4+PiANCj4+
Pj4+Pj4+Pj4+IE5vdyBpZiB5b3Ugd2FudCB0byBzdXBwb3J0IHlvdXIgZmVhdHVyZSB3aXRob3V0
IGEgZG9tMC4gVGhlbiBJIHRoaW5rDQo+Pj4+Pj4+Pj4+PiB3ZSB3YW50IHRvIGludHJvZHVjZSBh
biBvcHRpb24gd2hpY2ggd291bGQgYmUgdGhlIHNhbWUgYXMNCj4+Pj4+Pj4+Pj4+ICJ4ZW4sZW5o
YW5jZWQiIGJ1dCBkb2Vzbid0IGV4cG9zZSBYZW5zdG9yZWQuDQo+Pj4+Pj4+Pj4+IElmIHdlIG1v
ZGlmeSB0aGUgcGF0Y2ggYXMgYmVsb3cgd2UgY2FuIHVzZSB0aGUgInhlbixlbmhhbmNlZCIgZm9y
DQo+Pj4+Pj4+Pj4+IGRvbVVzIHdpdGhvdXQgZG9tMC4NCj4+Pj4+Pj4+Pj4gSSB0ZXN0ZWQgdGhl
IHBhdGNoIGFuZCBpdHMgd29ya3MgZmluZS4gRG8geW91IHNlZSBhbnkgaXNzdWUgd2l0aCB0aGlz
DQo+Pj4+Pj4+Pj4+IGFwcHJvYWNoPw0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IFllcy4gRm9yIHR3
byByZWFzb25zOg0KPj4+Pj4+Pj4+IDEpIEl0IGlzIG11ZGR5aW5nIHRoZSBtZWFuaW5nIG9mICJ4
ZW4sZW5oYW5jZWQiLiBJbiBwYXJ0aWN1bGFyIGEgdXNlcg0KPj4+Pj4+Pj4+IG1heSBub3QgcmVh
bGl6ZSB0aGF0IFhlbnN0b3JlIGlzIG5vdCBhdmFpbGFibGUgaWYgZG9tMCBpcyBub3QgcHJlc2Vu
dC4NCj4+Pj4+Pj4+PiAyKSBJdCB3b3VsZCBiZSBtb3JlIGNvbXBsaWNhdGVkIHRvIGhhbmRsZSB0
aGUgY2FzZSB3aGVyZSBYZW5zdG9yZWQgbGl2ZXMNCj4+Pj4+Pj4+PiBpbiBhIG5vbi1kb20wIGRv
bWFpbi4gSSBhbSBub3QgYXdhcmUgb2YgYW55b25lIHdhbnRpbmcgdGhpcyBvbiBBcm0geWV0LA0K
Pj4+Pj4+Pj4+IGJ1dCBJIGRvbid0IHdhbnQgdG8gY2xvc2UgdGhlIGRvb3IuDQo+Pj4+Pj4+Pj4g
DQo+Pj4+Pj4+Pj4gU28gaWYgeW91IHdhbnQgdG8gc3VwcG9ydCBjcmVhdGUgInhlbix4ZW4iIHdp
dGhvdXQgYWxsIHRoZSByZXN0LiBUaGVuIEkNCj4+Pj4+Pj4+PiB0aGluayB3ZSBuZWVkIGEgZGlm
ZmVyZW50IHByb3BlcnR5IHZhbHVlLiBJIGRvbid0IGhhdmUgYSBnb29kIHN1Z2dlc3Rpb24NCj4+
Pj4+Pj4+PiBmb3IgdGhlIG5hbWUuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IElzIHRoYXQgb2theSBp
ZiB3ZSB1c2UgdGhlIGVhcmxpZXIgYXBwcm9hY2gsIHdoZW4gdXNlciBzZXQgICJ4ZW4sZW5oYW5j
ZWQNCj4+Pj4+Pj4+ID0gZXZ0Y2hu4oCdIHdlIHdpbGwgbm90IGNhbGwgYWxsb2NfeGVuc3RvcmVf
ZXZ0Y2huKCkNCj4+Pj4+Pj4+IGJ1dCB3ZSBjcmVhdGUgaHlwZXJ2aXNvciBub2RlIHdpdGggYWxs
IGZpZWxkcy4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFRoaW5raW5nIG1vcmUgYWJvdXQgdGhpcywgdG9k
YXkgeGVuLGVuaGFuY2VkIGhhcyB0aGUgaW1wbGljYXRpb24gdGhhdDoNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+IC0gdGhlIGd1ZXN0IHdpbGwgZ2V0IGEgcmVndWxhciBhbmQgY29tcGxldGUgInhlbix4ZW4i
IG5vZGUgaW4gZGV2aWNlIHRyZWUNCj4+Pj4+Pj4gLSB4ZW5zdG9yZSBhbmQgUFYgZHJpdmVycyB3
aWxsIGJlIGF2YWlsYWJsZSAoZnVsbCBYZW4gaW50ZXJmYWNlcyBzdXBwb3J0KQ0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gV2UgZG9uJ3QgbmVjZXNzYXJlbHkgaW1wbHkgdGhhdCBkb20wIGlzIHJlcXVpcmVk
IChmcm9tIGEgZG9tVSBwb2ludCBvZg0KPj4+Pj4+PiB2aWV3KSBidXQgd2UgZG8gaW1wbHkgdGhh
dCB4ZW5zdG9yZStldnRjaG4rZ250dGFiIHdpbGwgYmUgYXZhaWxhYmxlIHRvDQo+Pj4+Pj4+IHRo
ZSBkb21VLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gTm93LCBzdGF0aWMgZXZlbnQgY2hhbm5lbHMgYXJl
IGRpZmZlcmVudC4gVGhleSBkb24ndCByZXF1aXJlIHhlbnN0b3JlDQo+Pj4+Pj4+IGFuZCB0aGV5
IGRvbid0IHJlcXVpcmUgZ250dGFiLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSXQgaXMgYXMgaWYgdGhl
IGN1cnJlbnQgeGVuLGVuaGFuY2VkIG5vZGUgYWN0dWFsbHkgbWVhbnQ6DQo+Pj4+Pj4+IA0KPj4+
Pj4+PiAgeGVuLGVuaGFuY2VkID0gInhlbnN0b3JlLGdudHRhYixldnRjaG4iOw0KPj4+Pj4+IA0K
Pj4+Pj4+IENvcnJlY3QuDQo+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBhbmQgbm93IHdlIGFy
ZSBvbmx5IGVuYWJsaW5nIGEgc3Vic2V0Og0KPj4+Pj4+PiANCj4+Pj4+Pj4gIHhlbixlbmhhbmNl
ZCA9ICJldnRjaG4iOw0KPj4+Pj4+PiANCj4+Pj4+Pj4gSXMgdGhhdCBhIGNvcnJlY3QgdW5kZXJz
dGFuZGluZz8NCj4+Pj4+PiANCj4+Pj4+PiBZZXMgd2l0aCBzb21lIGNhdmVhcnMgKHNlZSBiZWxv
dykuDQo+Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiANCj4+Pj4+Pj4gSWYgc28sIHdlIGNhbiBj
bGFyaWZ5IHRoYXQ6DQo+Pj4+Pj4+IA0KPj4+Pj4+PiAgeGVuLGVuaGFuY2VkOw0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gaXQgaXMgYSBjb252ZW5pZW50IHNob3J0ZW5kIGZvcjoNCj4+Pj4+Pj4gDQo+Pj4+
Pj4+ICB4ZW4sZW5oYW5jZWQgPSAieGVuc3RvcmUsZ250dGFiLGV2dGNobiI7DQo+Pj4+Pj4+IA0K
Pj4+Pj4+PiBhbmQgdGhhdCBvdGhlciBjb21iaW5hdGlvbnMgYXJlIGFsc28gYWNjZXB0YWJsZSwg
ZS5nLjoNCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICB4ZW4sZW5oYW5jZWQgPSAiZ250dGFiIjsNCj4+Pj4+
Pj4gIHhlbixlbmhhbmNlZCA9ICJldnRjaG4iOw0KPj4+Pj4+PiAgeGVuLGVuaGFuY2VkID0gImV2
dGNobixnbnR0YWIiOw0KPj4+Pj4+PiANCj4+Pj4+Pj4gSXQgaXMgT0sgdG8gcGFuaWMgaWYgdGhl
IHVzZXIgc3BlY2lmaWVzIGFuIG9wdGlvbiB0aGF0IGlzIGN1cnJlbnRseQ0KPj4+Pj4+PiB1bnN1
cHBvcnRlZCAoZS5nLiAiZ250dGFiIikuDQo+Pj4+Pj4gDQo+Pj4+Pj4gU28gdG9kYXksIGlmIHlv
dSBjcmVhdGUgdGhlIG5vZGUgInhlbix4ZW4iLCB0aGUgZ3Vlc3Qgd2lsbCBleHBlY3QgdG8gYmUg
YWJsZQ0KPj4+Pj4+IHRvIHVzZSBib3RoIGdyYW50LXRhYmxlIGFuZCBldmVudCBjaGFubmVsLg0K
Pj4+Pj4+IA0KPj4+Pj4+IFRoZXJlZm9yZSwgaW4gdGhlIGxpc3QgYWJvdmUsIHRoZSBvbmx5IGNv
bmZpZ3VyYXRpb24gd2UgY2FuIHNlbnNpYmx5IHN1cHBvcnQNCj4+Pj4+PiB3aXRob3V0IGFueSBt
YWpvciByZXdvcmsgaXMgImV2dGNobixnbnR0YWIiLg0KPj4+Pj4+IA0KPj4+Pj4+IElmIHdlIHdh
bnQgdG8gc3VwcG9ydCAiZXZ0Y2huIiBvciAiZ250dGFiIiBvbmx5LiBUaGVuIHdlIGxpa2VseSBu
ZWVkIHRvIGRlZmluZQ0KPj4+Pj4+IGEgbmV3IGJpbmRpbmcgKG9yIG5ldyB2ZXJzaW9uKSBiZWNh
dXNlIG5laXRoZXIgInJlZ3MiIG5vciAiaW50ZXJydXB0cyIgYXJlDQo+Pj4+Pj4gb3B0aW9uYWwg
KGFsdGhvdWdoIGEgZ3Vlc3QgT1MgaXMgZnJlZSB0byBpZ25vcmUgdGhlbSkuDQo+Pj4+PiANCj4+
Pj4+IFllcyBJIHRoaW5rIHlvdSBhcmUgcmlnaHQuIEkgYWxzbyBicm9hZGx5IGFncmVlIHdpdGgg
dGhlIHJlc3Qgb2YgeW91cg0KPj4+Pj4gcmVwbHkuDQo+Pj4+PiANCj4+Pj4+IFRoaW5raW5nIGFi
b3V0IGl0IGFuZCBnaXZlbiB0aGUgYWJvdmUsIHdlIG9ubHkgbmVlZCAyICJsZXZlbHMiIG9mDQo+
Pj4+PiBlbmhhbmNlbWVudDoNCj4+Pj4+IA0KPj4+Pj4gMSkgZXZlcnl0aGluZzogeGVuc3RvcmUs
IGdudHRhYiwgZXZ0Y2huDQo+Pj4+PiAyKSBnbnR0YWIsIGV2dGNobiwgYnV0IG5vdCB4ZW5zdG9y
ZQ0KPj4+Pj4gDQo+Pj4+PiBOb3RoaW5nIGVsc2UgaXMgcmVhbGx5IHBvc3NpYmxlIGJlY2F1c2Us
IGFzIEp1bGllbiBwb2ludGVkIG91dCwNCj4+Pj4+ICJ4ZW4sZW5oYW5jZWQiIGltcGxpZXMgdGhl
IHhlbix4ZW4gbm9kZSBpbiB0aGUgZG9tVSBkZXZpY2UgdHJlZSBhbmQgaW4NCj4+Pj4+IHR1cm4g
dGhhdCBub2RlIGltcGxpZXMgYm90aCBldnRjaG4gYW5kIGdudHRhYi4NCj4+Pj4gU28gd2UgY291
bGQgc2F5IHRoYXQgeGVuLGVuaGFuY2VkIGFsd2F5cyBpbmNsdWRlcyBnbnR0YWIgYW5kIFhlbnN0
b3JlIGlzIG9wdGlvbmFsLg0KPj4+IA0KPj4+IE5vdCByZWFsbHksIFhlbnN0b3JlIGhhcyBhbHdh
eXMgYmVlbiBwYXJ0IG9mIHRoZSBzdG9yeSBpbiBYZW4uIFNvIEkgdGhpbmsgbWFraW5nIGl0IG9w
dGlvbmFsIGZvciAieGVuLGVuaGFuY2VkIiBpcyBnb2luZyB0byBtYWtlIG1vcmUgZGlmZmljdWx0
IGZvciB1c2VyIHRvIHVuZGVyc3RhbmQgd2hhdCB0aGUgbWVhbmluZyBvZiB0aGUgb3B0aW9uIChp
biBwYXJ0aWN1bGFyIHRoYXQgaW4gdGhlIGZ1dHVyZSB3ZSBtYXkgd2FudCB0byBzdXBwb3J0IFhl
bnN0b3JlZCBpbiBhIHNlcGFyYXRlIGRvbWFpbikuDQo+PiANCj4+IFNvcnJ5IHdyb25nIGZvcm11
bGF0aW9uLCBoZXJlIEkgd2FzIG1lYW5pbmcgdGhhdCB3ZSBqdXN0IG5lZWQgYSBzb2x1dGlvbiB0
byBkaXNhYmxlIFhlbnN0b3JlIChzaG91bGQgc3RpbGwgYmUgaGVyZSBieSBkZWZhdWx0IHdoZW4g
c3VwcG9ydGVkKS4NCj4+IA0KPj4+IA0KPj4+Pj4gU28gSSB0aGluayB3ZSBqdXN0IG5lZWQgdG8g
YWRkIGEgd2F5IHRvIGV4cHJlc3MgMikuIFdlIGNvdWxkIGRvDQo+Pj4+PiBzb21ldGhpbmcgbGlr
ZToNCj4+Pj4+IA0KPj4+Pj4geGVuLGVuaGFuY2VkID0gImV2dGNobixnbnR0YWIiOw0KPj4+PiBJ
IGFtIGEgYml0IHB1enpsZWQgaGVyZSBhcyBnbnR0YWIgaXMgYWx3YXlzIHRoZXJlLg0KPj4+IA0K
Pj4+IFdoYXQgZG8geW91IG1lYW4/DQo+PiANCj4+IEFza2luZyB0aGUgdXNlciB0byBzcGVjaWZ5
IGdudHRhYiBpbiB0aGUgbGlzdCBldmVuIHRob3VnaCBpdCBpcyBub3Qgc3VwcG9ydGVkIHRvIG5v
dCBoYXZlIGl0IGluIHRoZSBsaXN0Lg0KPj4gDQo+Pj4gDQo+Pj4+PiANCj4+Pj4+IE9yIHdlIGNv
dWxkIHVzZSBhIG5ldyBzZXBhcmF0ZSBvcHRpb24gbGlrZSBKdWxpZW4gaW5pdGlhbGx5IHN1Z2dl
c3RlZCwNCj4+Pj4+IGUuZy46DQo+Pj4+PiANCj4+Pj4+IHhlbixlbmhhbmNlZC1uby14ZW5zdG9y
ZTsNCj4+Pj4+IA0KPj4+Pj4gInhlbixlbmhhbmNlZC1uby14ZW5zdG9yZSIgaXMgYSB0ZXJyaWJs
ZSBuYW1lIGFjdHVhbGx5LCBidXQganVzdCB0bw0KPj4+Pj4gZXhwbGFpbiB3aGF0IEkgYW0gdGhp
bmtpbmcgOi0pDQo+Pj4+IEkgdGhpbmsgbW9zdCBjb21tb24gdXNlIGNhc2Ugd2lsbCBiZSB0byBo
YXZlIGFsbCwgc28gbWFrZSBzZW5zZSB0byBhbGxvdyB0byBkaXNhYmxlIFhlbnN0b3JlLg0KPj4+
PiBIb3cgYWJvdXQ6DQo+Pj4+IHhlbixlbmhhbmNlZCA9IOKAnG5vLXhlbnN0b3Jl4oCdID8NCj4+
PiANCj4+PiBJIHdvdWxkIGJlIGZpbmUgd2l0aCBpdC4NCj4gDQo+IFdlIGhhdmUgYWdyZWVtZW50
IG9uIHRoaXMsIHNvIEkgd291bGQgc2F5IGxldCdzIGtlZXAgaXQgc2ltcGxlIGFuZCBnbw0KPiB3
aXRoIHRoaXMgb3B0aW9uLg0KPiANCj4gDQo+Pj4+IEFuIG90aGVyIHNvbHV0aW9uIGlzIHRvIGtl
ZXAgeGVuLGVuaGFuY2VkIGFzIGl0IGlzIGFuZCBpbnRyb2R1Y2UgYSBuZXcgb3B0aW9uOg0KPj4+
PiBYZW4sbm8teGVuc3RvcmUNCj4+PiANCj4+PiBJIGRvbid0IGxpa2UgdGhlIGlkZWEgb2YgaW50
cm9kdWNpbmcgeWV0IGFub3RoZXIgb3B0aW9uLg0KPj4+IA0KPj4+PiBBdCB0aGUgZW5kIFhlbnN0
b3JlIGNhbm5vdCBiZSB1c2VkIGlmIHRoZXJlIGlzIG5vIERvbTAgYW5kIHRoYXQgd2UgY2FuIGRl
dGVjdCBlYXNpbHkuDQo+Pj4+IEFsc28gdGhlcmUgaXMgbm8gc29sdXRpb24gYXQgdGhpcyBzdGFn
ZSB0byBoYXZlIGFuIG90aGVyIGRvbWFpbiB0aGVuIERvbTAgcHJvdmlkaW5nDQo+Pj4+IFhlbnN0
b3JlIChtYXliZSBpbiB0aGUgbG9uZyB0ZXJtIHNvbWVvbmUgd2lsbCB3YW50IHRvIGludHJvZHVj
ZSB0aGF0IGFuZCB3ZSB3aWxsIG5lZWQNCj4+Pj4gYSB3YXkgdG8gc3BlY2lmeSB3aGljaCBkb21h
aW4gaXMgaGFuZGxpbmcgaXQpLg0KPj4+PiBTbyBJIHN0aWxsIHRoaW5rIHRoYXQgd2UgY291bGQg
anVzdCBzYXkgdGhhdCBYZW5zdG9yZSBjYW4gb25seSBiZSBhY3RpdmUgaWYgdGhlcmUgaXMgYSBE
b20wDQo+Pj4+IGFuZCBqdXN0IGRpc2FibGUgWGVuc3RvcmUgYXV0b21hdGljYWxseSBpZiBpdCBp
cyBub3QgdGhlIGNhc2UuDQo+Pj4gDQo+Pj4gU2VlIGFib3ZlIGFib3V0IGRpc2FibGluZyBYZW5z
dG9yZSBhdXRvbWF0aWNhbGx5Lg0KPj4gDQo+PiBSaWdodCBub3cgWGVuc3RvcmUgY2FuIG9ubHkg
d29yayB3aXRoIGEgZG9tMCBhbmQgaWYgc29tZW9uZSB3YW50cyB0byBoYXZlIGFuIG90aGVyIGRv
bWFpbiB0byBwcm92aWRlIGl0IHdlIHdvdWxkIG5lZWQgYSB3YXkgdG8gc3BlY2lmeSB3aGljaCBv
bmUgaW4gdGhlIGNvbmZpZ3VyYXRpb24uDQo+PiBTbyBpbiBhIGNvbmZpZ3VyYXRpb24gd2l0aG91
dCBkb20wLCBJIHN0aWxsIHRoaW5rIHRoYXQgbm90IGVuYWJsaW5nIFhlbnN0b3JlIGF1dG9tYXRp
Y2FsbHkgaXMgb2suDQo+PiANCj4+PiANCj4+Pj4gSWYgdGhlcmUgaXMgYSBkb20wIGFuZCBzb21l
b25lIHdhbnRzIGEgZ3Vlc3Qgd2l0aG91dCBYZW5zdG9yZSwgdGhlbiB3ZSB3b3VsZCBuZWVkIHRv
DQo+Pj4+IGhhdmUgdGhlIG5vLXhlbnN0b3JlIHN1cHBvcnQuDQo+Pj4+IEJ1dCBpcyBpdCBhIHVz
ZSBjYXNlID8NCj4+PiANCj4+PiBEbyB5b3UgbWVhbiB3aGVuICJ4ZW4sZW5oYW5jZWQiIGlzIHNw
ZWNpZmllZD8gSWYgeWVzLCB0aGlzIGNvdWxkIGJlIHVzZWZ1bCBpZiBvbmUgd2FudCB0byBsaW1p
dCB0aGUgaW50ZXJmYWNlIGV4cG9zZWQgdG8gdGhlIGd1ZXN0Lg0KPj4gDQo+PiBIb3cgYWJvdXQg
dGhlIGZvbGxvd2luZzoNCj4+IFhlbixlbmhhbmNlZDogZ250dGFiLCBldmVudHMgYW5kIFhlbnN0
b3JlIGlmIHRoZXJlIGlzIGEgZG9tMA0KPj4gWGVuLGVuaGFuY2VkID0g4oCcW25vLV14ZW5zdG9y
ZSxbbm8tXWV2dGNobixbbm8tXWdudHRhYuKAnSBmb3Igd2hlbiB0aGUgdXNlciB3YW50cyB0byBl
eHBsaWNpdGx5IHNwZWNpZnkgd2hhdCBoZSB3YW50cyAoYW5kIFhlbiBzdG9wcGluZyBvbiB1bnN1
cHBvcnRlZCBjb25maWd1cmF0aW9uKS4NCj4+ICAgSW4gdGhpcyBJIHdvdWxkIGFsbG93IHRvIHBy
b3ZpZGUgYW55IGNvbWJpbmF0aW9ucyBvZiB0aGUgMw0KPiANCj4gSSBhbSBPSyB3aXRoIHdoYXQg
eW91IHdyb3RlIGFzIHdlbGwsIGJ1dCBjb25zaWRlcmluZyB0aGUgYWRkaXRpb25hbA0KPiBjb21w
bGV4aXR5IHRoYXQgbm8tZ250dGFiIGFuZCBuby1ldnRjaG4gZW50YWlsIGdpdmVuIHRoYXQgdGhl
eSBjYW5ub3QgYmUNCj4gYWN0dWFsbHkgZGlzYWJsZWQgdG9kYXksIEkgc3VnZ2VzdCB0byBrZWVw
IGl0IHNpbXBsZSBhbmQgZ28gd2l0aDoNCj4gDQo+IHhlbixlbmhhbmNlZCA9ICJuby14ZW5zdG9y
ZSINCg0KSSBhZ3JlZSB3aXRoIHRoYXQuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KDQoNCg==

