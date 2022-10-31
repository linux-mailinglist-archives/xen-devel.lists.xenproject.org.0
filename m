Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E34C6137FF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 14:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432866.685554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opUom-0007zm-OY; Mon, 31 Oct 2022 13:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432866.685554; Mon, 31 Oct 2022 13:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opUom-0007xQ-Kn; Mon, 31 Oct 2022 13:27:08 +0000
Received: by outflank-mailman (input) for mailman id 432866;
 Mon, 31 Oct 2022 13:27:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+oh=3A=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1opUok-0007xK-TG
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 13:27:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b95f23-591f-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 14:27:03 +0100 (CET)
Received: from DB6PR0301CA0061.eurprd03.prod.outlook.com (2603:10a6:4:54::29)
 by AS8PR08MB6149.eurprd08.prod.outlook.com (2603:10a6:20b:29d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 13:26:58 +0000
Received: from DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::1f) by DB6PR0301CA0061.outlook.office365.com
 (2603:10a6:4:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 13:26:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT064.mail.protection.outlook.com (100.127.143.3) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 13:26:58 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 31 Oct 2022 13:26:58 +0000
Received: from 6c2a35f5b6d2.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6EC524F4-3CDF-45D1-893C-2CAEE5C63D6E.1; 
 Mon, 31 Oct 2022 13:26:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c2a35f5b6d2.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 31 Oct 2022 13:26:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB7926.eurprd08.prod.outlook.com (2603:10a6:20b:575::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 13:26:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5769.014; Mon, 31 Oct 2022
 13:26:44 +0000
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
X-Inumbo-ID: b4b95f23-591f-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OEllxYGzZKXwMRCptB7TDF57eAh2SeEiTiMR82lEWJ92uAcLtZxDuWBOLyNzDCe4NYLCxfjpu9RBRi4hV9B6dtZ677bIrsokBgFfct+9THB6rq4id3Lnh75swMhxmGYwYzCM0pfTLQUZOs6i+saMJjm5Bl9gzgjA5/sOJxh1nmE50b4+nNgyvaSpGHSLXSC4M/wa/h9EfyudUNknZ4bZgBTiBNm5SQuYGxUBMDN1beV21jiza0mr2k6PHqYIvlQ7OEZTgb23Gu9LclGnw8TXyFhdiFeCCubZxTApalWIdnKo4Q+f8Co2t2Ydsnntv/2sNe+QWFYfvq1sq3PdB6DB2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0j4VWwaDaMbspt9Gdt93qfRGxWmQkVeaT1k2BNWivQ=;
 b=EGpJtjA4px86H0VbNlI08cXOHwM432lWo6ir+84WMBt5doD3qOiuUUx8YQvFiyqc1/vejWs+Wj6oATNWB1YVd0DO2oC3orA2eS3s8bEw7wX8VzFh4WUhybj5sXdVqJyj1pVe3CZUSE/1pMooh0mdSCctqHPMZuFYMNjCPZhYoHso6Vr2EVn0uUpcL4wwFgaJGobwzB3hgmHZuh4qoF6eG20+8gVsWIQdTg1niaBa2iAM2mag7Sqej0LhpCyrvul34L9xFpE2hpKhEIRdGegb9Guiu4yu260dDC73fr6bkl5qzdKj3+K//k2C7Y2T9z/CxCMYEu6hPGes4nFpIf9aig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0j4VWwaDaMbspt9Gdt93qfRGxWmQkVeaT1k2BNWivQ=;
 b=jpaoiUmqh2Qf6AsNIa5zxRtQ+eJkSiDvhbIgrBowieLqDn36AYqkPPct7P2OhMy9CXrbsNAuzBM3DpnLcSh2v5mbx5uI56Gw06tyfYGgZBRcvlzxGjcSmQI7TRK7fH7pD+ReQFPfe8IEV5ru4jzN4X67fTxo0seUNTG65OjfUYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: df9bc3fa5664f596
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgMw4fUbmR+USs/26EYUn/tmbPdhXtMadqOTtb+qMOsLeaX7iwvBdSpPTjrP4lmCUBI+R8xzmc7dZ0wI9+WhNgboupWEraFKC7dPNPt9mw6+08u1jQxhciJmBR9fMPYECplFZJMVHLQPAVFphLbbhgUMPCjln0oMWxriGYmHXllU1Kd/6Mt41noqh6sslkY7EQtr0Lqjsg5ZsdORE5TmXffqE/k+xAJ2ApxcgAB+AIqfaGNA71/3715z5uh5yL3CCdN7JWDYrCHLlqDlLTVHf2vk+77yi7Xf94gHSDK57R/4PmcwLhg2xHNWuBJj9LuhFnqU38ot90ERp2WjF55u1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0j4VWwaDaMbspt9Gdt93qfRGxWmQkVeaT1k2BNWivQ=;
 b=SzVKIEP1nRCVL5+SJApVnmETtBtcgJXcZD7/AFmqDHtLUZOeMfJ0Mdv7hPEYOOdsnUfQswDCQDc0QZdi9VEkYAYOETsv4ylPGfpxCn81ryO76UCQYLAq0JiAtQbG+PCnJUZ0WYnd7YPDM4QdFsn93Zm+4MXASI223tv8dEC8YOHmu8s9LrUL8MDaAKHueJtRZBF7oS/yFePaw2o10J6sbrrsqTY9cBgHHbZDT8YXSLIE98UjshMK3KVpcoUWdAs5BL22RyKBTdAc/NUW3bXPjbeLDrqG8QHKlywD0eok27IyqTnG2+x2B8q8SEcj5kqN0D/R9XNZsgW55btXM9rG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0j4VWwaDaMbspt9Gdt93qfRGxWmQkVeaT1k2BNWivQ=;
 b=jpaoiUmqh2Qf6AsNIa5zxRtQ+eJkSiDvhbIgrBowieLqDn36AYqkPPct7P2OhMy9CXrbsNAuzBM3DpnLcSh2v5mbx5uI56Gw06tyfYGgZBRcvlzxGjcSmQI7TRK7fH7pD+ReQFPfe8IEV5ru4jzN4X67fTxo0seUNTG65OjfUYQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>, Xen
 developer discussion <xen-devel@lists.xenproject.org>, Michal Orzel
	<Michal.Orzel@arm.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Topic: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Thread-Index:
 AQHY6T1V+gcJbmRqpEyt0b8GeG9bFq4grXIAgAAQCACAAFf9AIABVMyAgAAG64CAAVVJgIAAAzuAgAACBwCAAAPNgIADNHqAgABdGACAABWOgIABD7SA
Date: Mon, 31 Oct 2022 13:26:44 +0000
Message-ID: <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
 <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB7926:EE_|DBAEUR03FT064:EE_|AS8PR08MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a04b472-7af5-4eff-5ed9-08dabb439627
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9f+mGcAq72V0Kk8A/As+eXBgU4acJpMcGydRvchAyMXlJ6paM6nLMFYzuaJ/HK9yq6xKvGlivP9WGNOv6PHSRLzhAda8xq2+zeEhPFNz1Tu1a/TFieFiSEq8kurGph6zvIGeizoZKEA7wlFOdB0zHJv9DAJDfFYGmvNOuD0k7BhPZInAQPYXLIT0x3FpnV4q5rAgMdJrpf2uh5AG2cU6N80O4qsR70kNLksm6FGQF0peq9zSarjJ1+ywotMYx4vwru9uaXp3G1t6JX14bDSSPZlOhHpEzdwQUXN1bhHVocdBU33fNbYAeeJ90BlmgJ5/7TsjYTdaOJMhh5G1d13867Er2h1EdaPpRVHkCgfjisVJD5mIKTW+CWZT3p2kBahRDFsa5FUuPb3Mx1H8OD8LeC+//woRdcogTNvIEun9caDSKfaUH8xRPSq8JN30fR6W7TALyPqLqkwfWCNxEjz0hdLjY1rMyoIEaCxpyCa/+0GLj+JOf+r93l/CIaMbVGOoJhR+3iXrDsdJZErdinD371HgqPLWzFE2f1AMdKBGU+GQMvqKIOEFiSAwW06wh4phSUKH0MTyCeODmb6khEboPd2lt835JVhCk+OU1744Id8gtsdO35RGk44vOBM/s0gSjt0leuY/LcAeVS9ktSWnbDl+XPB361lAZXS5N2K14N5A0PwMLvo/HJyVsM6novKSBnrEmLLMW+qaUeK5kyaNZFFTDbcg6rUrS3iWncWqpAVxBdkqI73LionSKnI755Xo3Lh738fQDyvPeYptKJyb3dnZqbcNyhUChmhX3gkHIZrKxDyddGG3Cux5PX9eqyQCjkEzAIqPGpHD04iehAVX7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(33656002)(66899015)(2906002)(86362001)(36756003)(122000001)(38070700005)(38100700002)(186003)(53546011)(2616005)(6512007)(478600001)(6506007)(26005)(83380400001)(66476007)(41300700001)(76116006)(64756008)(8936002)(66446008)(966005)(66556008)(91956017)(71200400001)(6916009)(8676002)(316002)(6486002)(66946007)(5660300002)(45080400002)(4326008)(7416002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D60C4700D5B15945AD3F92150252CA74@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7926
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	613bea2a-036b-4614-c1f9-08dabb438dd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fVRC2PsszFHkT4On1/uBnrfldN8A3aGi6m4YU/l8z/8sELtDhA7PwnzsL45bR+qIrVVMb6bPhnuaeHkfM15HeQLi8fk3EZQiHUvWw/kkgsw7qsb2Ghmhhs+b6YkDQdG5YHXLElCm32Px/OS7oMfz8Jjxpsza/06um4rTt4hbZVH7qa7g0zXED48vVu2I2fW9T4CfgCFZ5vMkBVMrAeqFa3FLpdZSWbko9hYD9Kw2uk/P87gHhjspDmjS7uKmX9q8bTZDMIJJwUvc65lVl3Zy2quThDcn4c6ZoEcilylwJEWNBn38zmLI6tFl9Xwqbc+1ejn89a/NzFanejnd0AmYWmZFp7hO+Uq+X/Hq95lhkxf4l+7XGwAjq63W8hS75Wj24lv5EuvBMZMS2HY9wg09ZrT0VhvgjjzRymdSBPeKvg29aNN6bf5fSZz9IQwnMVsiwQc1q6GU/QjOSzui5PztJq0YCNFkB0rjufYct2n8fp40DdzbMAmB3oCTsQLzOs47zZL+RqRfdW8YcNlOs/vPVpiJ2ntI8dBi32hLtBRYdxAM/1UoAuauAgVB1Ql6C7ipZN4/8YF8UifCd0/qE80yqrIdhCtQPRCwCd3mo9BaDROfhbCioIoXDx8LwVIQePn8RYPnLPi9hOaax44ueAEp/v5ws4P6kEPZ3yigcUhgRKreyRTAADoPDqcMWzZkoQM7N3WNn6XeY0K+gfqTSVmIE1OCVZPXb81ZRyXRb+BqGrWCpQHJMO8Ax3eoaH0r0nAQh/cWekQgDUg1inUqD8g5+GyzghmTCVjrJUpvwKTUeqE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(336012)(186003)(2616005)(6486002)(966005)(478600001)(2906002)(6512007)(26005)(6506007)(53546011)(107886003)(81166007)(356005)(40460700003)(40480700001)(86362001)(82740400003)(47076005)(36860700001)(83380400001)(33656002)(82310400005)(8936002)(36756003)(6862004)(54906003)(316002)(70206006)(70586007)(8676002)(66899015)(4326008)(5660300002)(41300700001)(45080400002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 13:26:58.2712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a04b472-7af5-4eff-5ed9-08dabb439627
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6149

SGkgQWxsLA0KDQo+IE9uIDMwIE9jdCAyMDIyLCBhdCAyMToxNCwgU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFN1biwgMzAgT2N0IDIw
MjIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEhpIFN0ZWZhbm8sDQo+PiANCj4+IE9uIDMwLzEw
LzIwMjIgMTQ6MjMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBGcmksIDI4IE9j
dCAyMDIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+IE9uIDI4LzEwLzIwMjIgMTQ6MTMsIEJl
cnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4+Pj4gT24gMjggT2N0IDIwMjIsIGF0IDE0OjA2LCBK
dWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+PiANCj4+Pj4+PiBIaSBS
YWh1bCwNCj4+Pj4+PiANCj4+Pj4+PiBPbiAyOC8xMC8yMDIyIDEzOjU0LCBSYWh1bCBTaW5naCB3
cm90ZToNCj4+Pj4+Pj4+Pj4+PiBGb3IgQUNQSSwgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIHRoZSBp
bmZvcm1hdGlvbiB0byBiZQ0KPj4+Pj4+Pj4+Pj4+IGZvdW5kIGluDQo+Pj4+Pj4+Pj4+Pj4gdGhl
IElPUkVRLg0KPj4+Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+Pj4+IFNvIGNhbiB5b3UgYWRkIG1vcmUg
Y29udGV4dCB3aHkgdGhpcyBpcyBuZWNlc3NhcnkgZm9yDQo+Pj4+Pj4+Pj4+Pj4gZXZlcnlvbmU/
DQo+Pj4+Pj4+Pj4+PiBXZSBoYXZlIGluZm9ybWF0aW9uIGZvciBJT01NVSBhbmQgTWFzdGVyLUlE
IGJ1dCB3ZSBkb27igJl0DQo+Pj4+Pj4+Pj4+PiBoYXZlDQo+Pj4+Pj4+Pj4+PiBpbmZvcm1hdGlv
biBmb3IgbGlua2luZyB2TWFzdGVyLUlEIHRvIHBNYXN0ZXItSUQuDQo+Pj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+PiBJIGFtIGNvbmZ1c2VkLiBCZWxvdywgeW91IGFyZSBtYWtpbmcgdGhlIHZpcnR1YWwg
bWFzdGVyIElEDQo+Pj4+Pj4+Pj4+IG9wdGlvbmFsLiBTbyBzaG91bGRuJ3QgdGhpcyBiZSBtYW5k
YXRvcnkgaWYgeW91IHJlYWxseSBuZWVkDQo+Pj4+Pj4+Pj4+IHRoZQ0KPj4+Pj4+Pj4+PiBtYXBw
aW5nIHdpdGggdGhlIHZpcnR1YWwgSUQ/DQo+Pj4+Pj4+Pj4gdk1hc3RlcklEIGlzIG9wdGlvbmFs
IGlmIHVzZXIga25vd3MgcE1hc3RlcklEIGlzIHVuaXF1ZSBvbiB0aGUNCj4+Pj4+Pj4+PiBzeXN0
ZW0uIEJ1dCBpZiBwTWFzdGVySWQgaXMgbm90IHVuaXF1ZSB0aGVuIHVzZXIgbmVlZHMgdG8NCj4+
Pj4+Pj4+PiBwcm92aWRlDQo+Pj4+Pj4+Pj4gdGhlIHZNYXN0ZXJJRC4NCj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4gU28gdGhlIGV4cGVjdGF0aW9uIGlzIHRoZSB1c2VyIHdpbGwgYmUgYWJsZSB0byBrbm93
IHRoYXQgdGhlDQo+Pj4+Pj4+PiBwTWFzdGVySUQNCj4+Pj4+Pj4+IGlzIHVuaXEuIFRoaXMgbWF5
IGJlIGVhc3kgd2l0aCBhIGNvdXBsZSBvZiBTTU1VcywgYnV0IGlmIHlvdSBoYXZlDQo+Pj4+Pj4+
PiA1MCsNCj4+Pj4+Pj4+IChhcyBzdWdnZXN0ZWQgYWJvdmUpLiBUaGlzIHdpbGwgYmVjb21lIGEg
cGFpbiBvbiBsYXJnZXIgc3lzdGVtLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBJSE1PLCBpdCB3b3Vs
ZCBiZSBtdWNoIGJldHRlciBpZiB3ZSBjYW4gZGV0ZWN0IHRoYXQgaW4gbGlieGwgKHNlZQ0KPj4+
Pj4+Pj4gYmVsb3cpLg0KPj4+Pj4+PiBXZSBjYW4gbWFrZSB0aGUgdk1hc3RlcklEIGNvbXB1bHNv
cnkgdG8gYXZvaWQgY29tcGxleGl0eSBpbiBsaWJ4bCB0bw0KPj4+Pj4+PiBzb2x2ZSB0aGlzDQo+
Pj4+Pj4gDQo+Pj4+Pj4gSW4gZ2VuZXJhbCwgY29tcGxleGl0eSBpbiBsaWJ4bCBpcyBub3QgdG9v
IG11Y2ggb2YgcHJvYmxlbS4NCj4+PiANCj4+PiBJIGFncmVlIHdpdGggdGhpcyBhbmQgYWxzbyBJ
IGFncmVlIHdpdGggSnVsaWVuJ3Mgb3RoZXIgc3RhdGVtZW50Og0KPj4+IA0KPj4+ICJJIGFtIHN0
cm9uZ2x5IGluIGZhdm9yIG9mIGxpYnhsIHRvIG1vZGlmeSBpdCBpZiBpdCBncmVhdGx5IGltcHJv
dmVzIHRoZQ0KPj4+IHVzZXIgZXhwZXJpZW5jZS4iDQo+Pj4gDQo+Pj4gSSBhbSBhbHdheXMgaW4g
ZmF2b3Igb2YgcmVkdWNpbmcgY29tcGxleGl0eSBmb3IgdGhlIHVzZXIgYXMgdGhleQ0KPj4+IHR5
cGljYWxseSBjYW4ndCBkZWFsIHdpdGggdHJpY2t5IGRldGFpbHMgc3VjaCBhcyBNYXN0ZXJJRHMu
IEluIGdlbmVyYWwsDQo+Pj4gSSB0aGluayB3ZSBuZWVkIG1vcmUgYXV0b21hdGlvbiB3aXRoIG91
ciB0b29saW5nLg0KPj4+IA0KPj4+IEhvd2V2ZXIsIGl0IG1pZ2h0IG5vdCBiZSBhcyBzaW1wbGUg
YXMgYWRkaW5nIHN1cHBvcnQgZm9yIGF1dG9tYXRpY2FsbHkNCj4+PiBnZW5lcmF0aW5nIElEcyBp
biBsaWJ4bCBiZWNhdXNlIHdlIGhhdmUgMiBhZGRpdGlvbmFsIGNhc2VzIHRvIHN1cHBvcnQ6DQo+
Pj4gMSkgZG9tMGxlc3MNCj4+PiAyKSBzdGF0aWNhbGx5IGJ1aWx0IGd1ZXN0cw0KPj4+IA0KPj4+
IEZvciAxKSB3ZSB3b3VsZCBuZWVkIHRoZSBzYW1lIHN1cHBvcnQgYWxzbyBpbiBYZW4/IFdoaWNo
IG1lYW5zIG1vcmUNCj4+PiBjb21wbGV4aXR5IGluIFhlbi4NCj4+IFhlbiB3aWxsIG5lZWQgdG8g
cGFyc2UgdGhlIGRldmljZS10cmVlIHRvIGZpbmQgdGhlIG1hcHBpbmcuIFNvIEkgYW0gbm90DQo+
PiBlbnRpcmVseSBjb252aW5jZWQgdGhlcmUgd2lsbCBiZSBtb3JlIGNvbXBsZXhpdHkgbmVlZGVk
IG90aGVyIHRoYW4gcmVxdWlyaW5nIGENCj4+IGJpdG1hcCB0byBrbm93IHdoaWNoIHZNYXN0ZXJJ
RCBoYXMgYmVlbiBhbGxvY2F0ZWQuDQo+PiANCj4+IFRoYXQgc2FpZCwgeW91IHdvdWxkIHN0aWxs
IG5lZWQgb25lIHRvIHZhbGlkYXRlIHRoZSBpbnB1dCBwcm92aWRlZCBieSB0aGUNCj4+IHVzZXIu
IFNvIG92ZXJhbGwgbWF5YmUgdGhlcmUgd2lsbCBiZSBubyBhZGRlZCBjb21wbGV4aXR5Pw0KPj4g
DQo+Pj4gDQo+Pj4gMikgYXJlIGd1ZXN0cyBsaWtlIFplcGh5ciB0aGF0IGNvbnN1bWUgYSBkZXZp
Y2UgdHJlZSBhdA0KPj4+IGJ1aWxkIHRpbWUgaW5zdGVhZCBvZiBydW50aW1lLiBUaGVzZSBndWVz
dHMgYXJlIGJ1aWx0IHNwZWNpZmljYWxseSBmb3IgYQ0KPj4+IGdpdmVuIGVudmlyb25tZW50IGFu
ZCBpdCBpcyBub3QgYSBwcm9ibGVtIHRvIHJlYnVpbGQgdGhlbSBmb3IgZXZlcnkgWGVuDQo+Pj4g
cmVsZWFzZS4NCj4+PiANCj4+PiBIb3dldmVyIEkgdGhpbmsgaXQgaXMgZ29pbmcgdG8gYmUgYSBw
cm9ibGVtIGlmIHdlIGhhdmUgdG8gcnVuIGxpYnhsIHRvDQo+Pj4gZ2V0IHRoZSBkZXZpY2UgdHJl
ZSBuZWVkZWQgZm9yIHRoZSBaZXBoeXIgYnVpbGQuIFRoYXQgaXMgYmVjYXVzZSBpdA0KPj4+IG1l
YW5zIHRoYXQgdGhlIFplcGh5ciBidWlsZCBzeXN0ZW0gd291bGQgaGF2ZSB0byBsZWFybiBob3cg
dG8gY29tcGlsZQ0KPj4+IChvciBjcm9zc2NvbXBpbGUpIGxpYnhsIGluIG9yZGVyIHRvIHJldHJp
ZXZlIHRoZSBkYXRhIG5lZWRlZCBmb3IgaXRzDQo+Pj4gaW5wdXQuIEV2ZW4gZm9yIHN5c3RlbXMg
YmFzZWQgb24gWW9jdG8gKFlvY3RvIGFscmVhZHkga25vd3MgaG93IHRvIGJ1aWxkDQo+Pj4gbGli
eGwpIHdvdWxkIGNhdXNlIGlzc3VlcyBiZWNhdXNlIG9mIGludGVybmFsIGRlcGVuZGVuY2llcyB0
aGlzIHdvdWxkDQo+Pj4gaW50cm9kdWNlLg0KPj4gDQo+PiBUaGF0IHdvdWxkIG5vdCBiZSB2ZXJ5
IGRpZmZlcmVudCB0byBob3cgdGhpcyB3b3JrcyB0b2RheSBmb3IgWmVwaHlyLiBUaGV5IG5lZWQN
Cj4+IGxpYnhsIHRvIGdlbmVyYXRlIHRoZSBndWVzdCBEVC4NCj4+IA0KPj4gVGhhdCBzYWlkLCBJ
IGFncmVlIHRoaXMgaXMgYSBiaXQgb2YgYSBwYWluLi4uDQo+IA0KPiBZZWFoLi4NCj4gDQo+IA0K
Pj4+IFNvIEkgdGhpbmsgdGhlIGF1dG9tYXRpYyBnZW5lcmF0aW9uIG1pZ2h0IGJlIGJlc3QgZG9u
ZSBpbiBhbm90aGVyIHRvb2wuDQo+PiBJdCBzb3VuZHMgbGlrZSB3aGF0IHlvdSB3YW50IGlzIGNy
ZWF0aW5nIHNvbWV0aGluZyBzaW1pbGFyIHRvIGxpYmFjcGkgYnV0IGZvcg0KPj4gRGV2aWNlLVRy
ZWUuIFRoYXQgc2hvdWxkIHdvcmsgd2l0aCBzb21lIGNhdmVhdHMuDQo+IA0KPiBZZXMsIHNvbWV0
aGluZyBsaWtlIHRoYXQuIFdlIGhhdmUgYSBmcmFtZXdvcmsgZm9yIHJlYWRpbmcsIGVkaXRpbmcg
YW5kDQo+IGdlbmVyYXRpbmcgRGV2aWNlIFRyZWU6IExvcHBlciBodHRwczovL2dpdGh1Yi5jb20v
ZGV2aWNldHJlZS1vcmcvbG9wcGVyDQo+IA0KPiBJdCBpcyBtb3N0bHkgdGFyZ2V0ZWQgYXQgYnVp
bGQgdGltZSBidXQgaXQgY291bGQgYWxzbyBiZSBpbnZva2VkIG9uDQo+IHRhcmdldCBhdCBydW50
aW1lLg0KPiANCj4gDQo+Pj4gSSB0aGluayB3ZSBuZWVkIHNvbWV0aGluZyBsaWtlIGEgc2NyaXB0
IHRoYXQgdGFrZXMgYSBwYXJ0aWFsIGRldmljZSB0cmVlDQo+Pj4gYXMgaW5wdXQgYW5kIHByb3Zp
ZGVzIGEgbW9yZSBkZXRhaWxlZCBwYXJ0aWFsIGRldmljZSB0cmVlIGFzIG91dHB1dCB3aXRoDQo+
Pj4gdGhlIGdlbmVyYXRlZCBJRHMuDQo+PiANCj4+IEFGQUlDVCwgaGF2aW5nIHRoZSBwYXJ0aWFs
IGRldmljZS10cmVlIGlzIG5vdCBlbm91Z2guIFlvdSBhbHNvIG5lZWQgdGhlIHJlYWwNCj4+IERU
IHRvIGZpZ3VyZSBvdXQgdGhlIHBNYXN0ZXItSUQuDQo+PiANCj4+PiANCj4+PiBJZiB3ZSBkaWQg
aXQgdGhhdCB3YXksIHdlIGNvdWxkIGNhbGwgdGhlIHNjcmlwdCBmcm9tIGxpYnhsLCBidXQgYWxz
byB3ZQ0KPj4+IGNvdWxkIGNhbGwgaXQgc2VwYXJhdGVseSBmcm9tIEltYWdlQnVpbGRlciBmb3Ig
ZG9tMGxlc3MgYW5kIFplcGh5ci9Zb2N0bw0KPj4+IGNvdWxkIGFsc28gY2FsbCBpdC4NCj4+PiAN
Cj4+PiBCYXNpY2FsbHkgd2UgbWFrZSBpdCBlYXNpZXIgZm9yIGV2ZXJ5b25lIHRvIHVzZSBpdC4g
VGhlIG9ubHkgcHJpY2UgdG8NCj4+PiBwYXkgaXMgdGhhdCBpdCB3aWxsIGJlIGEgYml0IGxlc3Mg
ZWZmaWNpZW50IGZvciB4bCBndWVzdHMgKG9uZSBtb3JlDQo+Pj4gc2NyaXB0IHRvIGZvcmsgYW5k
IGV4ZWMpIGJ1dCBJIHRoaW5rIGlzIGEgZ29vZCBjb21wcm9taXNlLg0KPj4gDQo+PiBXZSB3b3Vs
ZCBuZWVkIGFuIGh5cGVyY2FsbCB0byByZXRyaWV2ZSB0aGUgaG9zdCBEZXZpY2UtVHJlZS4gQnV0
IHRoYXQgd291bGQNCj4+IG5vdCBiZSB0b28gZGlmZmljdWx0IHRvIGFkZC4NCj4gDQo+IEdvb2Qg
cG9pbnQNCj4gDQo+IA0KPj4+IEkgdGhpbmsgdGhpcyBpcyBhIGdyZWF0IGlkZWEsIEkgb25seSBz
dWdnZXN0IHRoYXQgd2UgbW92ZSB0aGUgYXV0b21hdGljDQo+Pj4gZ2VuZXJhdGlvbiBvdXQgb2Yg
bGlieGwgKGEgc2VwYXJhdGUgc3RhbmQtYWxvbmUgc2NyaXB0KSwgaW4gYW5vdGhlcg0KPj4+IHBs
YWNlIHRoYXQgY2FuIGJlIG1vcmUgZWFzaWx5IHJldXNlZCBieSBtdWx0aXBsZSBwcm9qZWN0cyBh
bmQgZGlmZmVyZW50DQo+Pj4gdXNlLWNhc2VzLg0KPj4gDQo+PiBJZiB3ZSB1c2UgdGhlIGNvbmNl
cHQgb2YgbGliYWNwaSwgd2UgbWF5IG5vdCBuZWVkIGEgdG8gaGF2ZSBhIHN0YW5kLWFsb25lDQo+
PiBzY3JpcHQuIEl0IGNvdWxkIGRpcmVjdGx5IGxpbmtlZCBpbiBsaWJ4bCBvciBhbnkgb3RoZXIg
dG9vbHMuDQo+IA0KPiBJIGRvbid0IGZlZWwgc3Ryb25nbHkgd2hldGhlciBpdCBzaG91bGQgYmUg
YSBsaWJyYXJ5LCBhIHNjcmlwdCBvcg0KPiBzb21ldGhpbmcgZWxzZS4gTXkgb25seSBwb2ludCBp
cyB0aGF0IGl0IHNob3VsZCBiZSBlYXN5IHRvIHVzZSBib3RoIGF0DQo+IGJ1aWxkIHRpbWUgKGUu
Zy4gWW9jdG8vWmVwaHlyL0ltYWdlQnVpbGRlci9Mb3BwZXIpIGFuZCBydW50aW1lDQo+ICh4bC9s
aWJ4bCkuDQo+IA0KPiBXZSBoYXZlIGFscmVhZHkgYSBwYXJ0aWFsIERUQiBnZW5lcmF0b3IgYXMg
YSBMb3BwZXIgImxvcCIgKGEgTG9wcGVyDQo+IHBsdWdpbikuIFByb2JhYmx5IHVzaW5nIExvcHBl
ciB3b3VsZCBiZSB0aGUgZWFzaWVzdCB3YXkgdG8gaW1wbGVtZW50IGl0LA0KPiBhbmQgdGhlICJs
b3AiIGNvdWxkIGJlIHVuZGVyIHhlbi5naXQgKGl0IGRvZXNuJ3QgaGF2ZSB0byByZXNpZGUgdW5k
ZXINCj4gdGhlIGxvcHBlciByZXBvc2l0b3J5KS4NCj4gDQo+IEJ1dCBpZiB3ZSB3YW50ZWQgYSBs
aWJyYXJ5IHRoYXQgd291bGQgYmUgT0sgdG9vLiBUaGUgaXNzdWUgd2l0aCBsaWJ4bCBpcw0KPiBu
b3QgbXVjaCB0aGF0IGl0IGlzIGEgbGlicmFyeSBidXQgdGhhdCBpdCBpcyBjb21wbGV4IHRvIGJ1
aWxkIGFuZCBoYXMNCj4gbWFueSBkZXBlbmRlbmNpZXMgKGl0IGNhbiBvbmx5IGJlIGJ1aWx0IGZy
b20gdGhlIHRvcCBsZXZlbCAuL2NvbmZpZ3VyZQ0KPiBhbmQgbWFrZSkuDQo+IA0KPiBJZGVhbGx5
IHRoaXMgd291bGQgYmUgc29tZXRoaW5nIHF1aWNrIHRoYXQgY2FuIGJlIGVhc2lseSBpbnZva2Vk
IGFzIHRoZQ0KPiBmaXJzdCBzdGVwIG9mIGFuIGV4dGVybmFsIHRoaXJkLXBhcnR5IGJ1aWxkIHBy
b2Nlc3MuDQoNCkkgdGhpbmsgdGhhdCB3ZSBhcmUgbWFraW5nIHRoaXMgcHJvYmxlbSBhIGxvdCB0
byBjb21wbGV4IGFuZCBJIGFtIG5vdCBzdXJlDQp0aGF0IGFsbCB0aGlzIGNvbXBsZXhpdHkgaXMg
cmVxdWlyZWQuDQoNCkZvciBub3csIHdlIGNvdWxkIG1ha2UgdGhlIGFzc3VtcHRpb24gdGhhdCBh
IG1hc3RlciBJRCBpcyB1bmlxIGFuZCBuZXZlcg0KcmV1c2VkIG9uIGEgc3lzdGVtLiBMaW51eCBp
cyBjdXJyZW50bHkgbWFraW5nIHRoaXMgYXNzdW1wdGlvbiB0byBzaW1wbGlmeQ0KdGhlIGNvZGUu
IFdlIGFsc28gZm91bmQgbm8gaGFyZHdhcmUgd2l0aCB0aGUgc2FtZSBtYXN0ZXIgSUQgcmV1c2Vk
Lg0KDQpJdCB3b3VsZCBtZWFuIHRoYXQgdGhlIHVzZXIgd291bGQganVzdCBuZWVkIHRvIGtlZXAg
dGhlIHN0cmVhbS1pZCBwcm9wZXJ0eQ0KaW4gdGhlIGRldmljZSB0cmVlLCByZXBsYWNlIHRoZSBs
aW5rIHRvIHRoZSBTTU1VIHdpdGggYSBmYWtlIHBoYW5kbGUuIFRoZQ0KdG9vbHMgY291bGQgdGhl
biBhZGQgdGhlIHZJT01NVSBub2RlIGFuZCBmaXggYWxsIHBoYW5kbGUgaW4gdGhlIGRldmljZSB0
cmVlDQp0byBwcm9wZXJseSBwb2ludCB0byBpdC4gSW4gcHJhY3RpY2UgdGhlIHVzZXIgY2FuIHNp
bXBseSBjb3B5IHRoZSB3aG9sZSBkZXZpY2UNCm5vZGUgd2l0aCB0aGUgc3RyZWFtLWlkIHByb3Bl
cnRpZXMgYW5kIGp1c3QgcmVwbGFjZSB0aGUgcGhhbmRsZSBieSAweDAuDQoNClRoaXMgd2lsbCBt
YWtlIHRoZSBmaXJzdCBpbXBsZW1lbnRhdGlvbiBhIGxvdCBzaW1wbGVyIGFuZCBwcmV2ZW50IGFk
ZGluZw0KaHlwZXIgY2FsbHMgb3IgdG8gbXVjaCBtYWdpYyBpbiB0aGUgdG9vbHMgZm9yIG5vdy4N
ClRoaXMgd2lsbCBhbHNvIGdpdmUgdXMgbW9yZSB0aW1lIHRvIGNoZWNrIGlmIHdlIG5lZWQgbW9y
ZSBjb21wbGV4IHVzZQ0KY2FzZXMgYW5kIGhvdyB0aGV5IGNvdWxkIGJlIGNvbmZpZ3VyZWQuDQoN
CldoYXQgZG8geW91IHRoaW5rID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCg==

