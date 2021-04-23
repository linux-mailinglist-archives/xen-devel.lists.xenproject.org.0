Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AFE368D95
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 09:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115915.221206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZpsS-0002Lb-I4; Fri, 23 Apr 2021 07:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115915.221206; Fri, 23 Apr 2021 07:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZpsS-0002LC-ER; Fri, 23 Apr 2021 07:05:24 +0000
Received: by outflank-mailman (input) for mailman id 115915;
 Fri, 23 Apr 2021 07:05:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiSz=JU=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lZpsR-0002L6-Hy
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 07:05:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c0b1159-8aa2-4c23-a44c-e43b4cc63b81;
 Fri, 23 Apr 2021 07:05:22 +0000 (UTC)
Received: from MR2P264CA0049.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::13)
 by DB8PR08MB4043.eurprd08.prod.outlook.com (2603:10a6:10:a8::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 07:05:19 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::aa) by MR2P264CA0049.outlook.office365.com
 (2603:10a6:500:31::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 07:05:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 07:05:18 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Fri, 23 Apr 2021 07:05:18 +0000
Received: from 68dad47bbb60.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E35090D1-5DD3-4E3E-B9C1-129D122DE8D9.1; 
 Fri, 23 Apr 2021 07:05:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68dad47bbb60.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 23 Apr 2021 07:05:11 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1840.eurprd08.prod.outlook.com (2603:10a6:800:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 07:05:05 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 07:05:05 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Fri, 23 Apr 2021 07:05:04 +0000
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
X-Inumbo-ID: 1c0b1159-8aa2-4c23-a44c-e43b4cc63b81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbTuDLLcuOIeG8S0Lhaxa5ixkykOjPLHp7E5lkbcJG8=;
 b=Ox8Ch1IOMgzxr8JR8ji1ZMg1MPiyOul84fzV3+IMBFfl8uURNIwdTvk6iFcccgWhG4lty8JAlMZkzdJjqxnTYThUMRDGmD06AFPRc0suLPHV769CnsRqojLI+pTEF8/nnLUnkq/9iYtsj1FFzGFeQOY8Ho7MK1o8zhPfn5gH4uI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 795107ae783b1025
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvR4H1dYRq79uQJQywX/VzRwez5Md1ZZdX9+q6mcKuKFMNAUW5WXRZWF4BRDskv3aCfQX5dUeW0qN4J3OKfjhUnQlcPvbepGWUa3d1hQB4kL5tYNYaKRYCjzoO2YC2JT9O+H8+tIa3RwtgV7XNf5TJ/2fSUmHkKBQDdbKK+mXLGedWS8gaDkij582mR20knByO092gf3xB1cyWyDg0yBUMcowQRYBBODq6S+qsyvHZzzEvMA91K0yrahvDxanAGzbhnMax0OwiP2uOopu0VhKUtUgaxbf6n0y3hsUKr/Ao4F3GnXW4DdiOEsfvA9A1x9LjimZkqJ3oGhbqthunxPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbTuDLLcuOIeG8S0Lhaxa5ixkykOjPLHp7E5lkbcJG8=;
 b=Y/41BQtupjBUHM5z8qjle3tTIkLmBM6rYaAyXw84sSDUKsMww1QFHtQJ0kCKJD2NuaMC0iaRqF4W4kl0xCsnHTmrs/zbu9aCXOPcL7a+UPjMwINF1wW6NEBEBKhPwXvwBE5uyoDBtsiGIWSHxhcl/cZvYeX+HeW+akP86QAB1dSC3dDmD2E3Xmc8WPqz2sCy6Ammf0i59XFN7n7yu+Tw8TSu+gf+Kb9w7bSzDG9EIyTXieISbwtB8n/6IAYa4IxuM/0lFv+upC7a/MXcYAb23F8dwc5oZHVyLbx16DBZJApuYpa0N9HHY9xhe5tHGyOSg+wzdxZXqvmObJGofQwKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbTuDLLcuOIeG8S0Lhaxa5ixkykOjPLHp7E5lkbcJG8=;
 b=Ox8Ch1IOMgzxr8JR8ji1ZMg1MPiyOul84fzV3+IMBFfl8uURNIwdTvk6iFcccgWhG4lty8JAlMZkzdJjqxnTYThUMRDGmD06AFPRc0suLPHV769CnsRqojLI+pTEF8/nnLUnkq/9iYtsj1FFzGFeQOY8Ho7MK1o8zhPfn5gH4uI=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/gntdev: fix gntdev_mmap() error exit path
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <9cb9bd6c-8185-9741-31b9-8f6baf3848a3@suse.com>
Date: Fri, 23 Apr 2021 08:04:57 +0100
Cc: xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 stable@vger.kernel.org,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <92E0F915-499C-4471-B0C9-336494C5E31D@arm.com>
References: <20210423054038.26696-1-jgross@suse.com>
 <467B8109-C829-4755-8398-196E50090898@arm.com>
 <9cb9bd6c-8185-9741-31b9-8f6baf3848a3@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LNXP123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::29) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ca24ff-1399-4b89-6b14-08d90626273a
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1840:|DB8PR08MB4043:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB4043EFACEA8A4F7CC9D4225DE4459@DB8PR08MB4043.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k5UtoziOeJS9SyleRwVT7SiivhTWtuFa1R93mny6H8Mwl+d0xlGPDEjvQ4IGvq0vY2eUnpzSLWH+GHIbw5L5uM1VmbhLznI84oLV8LV2tfP8QVGdUcDIfMwVyHs3Z5SUh3YwM4iD1H0BvT6gXzC2xiQEOA4lYjipo6jM3XrfAUQTmDgO3B4UN8Xk6GtGS01eeb5Y/2GqKau1JBBazazHceyBNtVoukI+XTOyKEDK77Ev4xgBLhO8Ur6Qw10hJoGWRpTenDf/MLFT/VwkFHLvoqSzkXH6JK++78Gm0b+3dqk5IiPbW+try0/PGGqTkW44jkIHoqdn7ZFtsmDcKcquKOm75j2s37VNPAOi2KuJln96Ha22ym4MgFCV31AsqHGXdAtq3RfQDOchopIhdtmMfAG92Os+TPZDzj1ZB6Z8RKSOmlIUDPhS3TRtjMpxC/CIlUnu0zrWb7nHWuofmHKXGU91z127zHjmywC1DgiS/6WpOhPVGNIw/sag1wHqOf6eMByDkn1TPPiQdtPq70F1fYLbh5VD9/o9RcMbArPNAtDPMGzyq/RU5VG5FcZW5mO8No5FNQizRgfY/XeXo5CCU6YAu+80dC2REJK2px2S/mvcprPF3sVOELNi3z0fENm5dhnqSI3+hRD/7VnEzc2iuBgOR9HMFhUW7RTzL2JtTp0rtCZPJ6ZB/HS0Cy27XhF4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(86362001)(5660300002)(83380400001)(4326008)(36756003)(186003)(66574015)(26005)(33656002)(2906002)(316002)(6666004)(478600001)(6486002)(38100700002)(38350700002)(6916009)(956004)(2616005)(7696005)(66946007)(8936002)(44832011)(66556008)(53546011)(66476007)(52116002)(54906003)(16526019)(8676002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?ajNtVWxLUGdOZFpFck9Zc01BaUNRVWU5R0toMjNRRC9oZHcvL0d5L1ozODgy?=
 =?utf-8?B?RXQ3VHBQMkxIejFQb1Ezcm0xaHlyQnR1RFpIZU1hMmN6YjdLcE1RTys5bWxz?=
 =?utf-8?B?dVRHaGNIaDNaUllxSTJ5TFNKLzlLZXJhUjF6NWw3aSsvT1ZSUGtGdGxLYTFv?=
 =?utf-8?B?RjNMcHBQcFEyczc4RjJjRGs4dDNVS0FneU9HaXE1eUtIc0Z6ZDZiaWh5aVpn?=
 =?utf-8?B?Y3liVjIyRWRrMW1uYVROLzlkemswR3BCRjZvWmpCRmx6S1NxSEpTZU11cnV0?=
 =?utf-8?B?M05GeFphZysxVkVXbTZxY0N1VlMvVVNjMVFhRjlnV2puV01EdURFaEpWaUhS?=
 =?utf-8?B?amFZZW93ZnZvUis4UlhrNWpKd25NRGxOTnV5enFVUDg4S2VHUjdFUjY3eWJt?=
 =?utf-8?B?dzRWeENqbkNVK0tnbmhuTWljR1Z6cjQwSEYxTTdNRUhtWUZwZmVzc2RnUzNu?=
 =?utf-8?B?RFFsTURkSTZ2OUVWS29vNnRIeG5tYXpiWUMyT0taOURraFVNL3p4dkJOSHov?=
 =?utf-8?B?NjcwMm5jWGUycGpjdUxadXZGMUpLMmowVXdsSEF0aUJRalN4UzQ1UE1iTU9z?=
 =?utf-8?B?aFR0VVRaWkZZVDY0TjRJZUx0NFNQNG5CMjh0S1Bad2huRGY5N1l3UTZadklE?=
 =?utf-8?B?eHM1aFJzQmRDNHR6Q2hUa1NNWGlsc2dwbW5HL0lnQlVOR3A5UFdRcUtqVGpZ?=
 =?utf-8?B?UWczaE1vRXlETXd3ZW5UdGszeTlpcWZmVmluRGkxM2V3bTFQL1h4V3BZdWZ5?=
 =?utf-8?B?UWY1NEUzQmptV0FNVGNYVVU5WVYzRElaTmU2dFY3Y3c0aGlSMnFYdGd5NDFQ?=
 =?utf-8?B?Mkw0bEduamNDTWVtVFduTzNLK0RrK0lIejZ2d29JSUVBVXhYZ3VqZGd3MnNR?=
 =?utf-8?B?d0U1UWxjVjBORk95dGMxRUZGSVkralo4ZjUwTmJOK0JSalJpajFIalU1K1lx?=
 =?utf-8?B?MnR0Ny9TSEhtRnlCdlhiS1FQOWVzTVVGcEFMV3pKaDM5UTc3WDZQZWNmenFu?=
 =?utf-8?B?TElHdzFwd2lnbHIwTm0zS2IvNzhhYUJ6bmpSWk94UURmL1BUdFgvYTg5ZmlI?=
 =?utf-8?B?UWNzcmxBT05xRmkyZlhadGYxcE1kcFU5Qmd0Y2JoYm5yTXVLdHcxYjhNWDFj?=
 =?utf-8?B?akdPS01NNzY3alp6M1NlMFRKVmFGa1VwcWg3ajltNS9VTTJYWVk5Mjd5a3ZK?=
 =?utf-8?B?OWlOVDE3Vno2bXZaMDFTZklRSTBmeFFBWXlZQXUxWGt5T2YzUkNEdHVuNEFG?=
 =?utf-8?B?WWg4TG05Mm5KalNzU1pGTnRWNFBoS1hUZDJuSGJLYkhubkZCaDgvcStySlE3?=
 =?utf-8?B?c09LdXk1VjFTU2dCVVI2WDVkSTUrcG9xNnN2QXNla0dlZ3lVajdSME1yQkw1?=
 =?utf-8?B?bmlMTzF3NHNZUGJjdVZUNnlmc3RXYTVvMmVXR2VKUjlVOXdHSy9wRit5UE01?=
 =?utf-8?B?ZE1GT3pocnN5cENFTHBvYnBMTjVoM3orQTh6S05lZjU2aThUZXZHL2FFWjds?=
 =?utf-8?B?dElLZmI2T1JoS2hrbUhvRlNyVkxNYS9tekVZNHVHUkVjWWYwODFRZVFGZ0sx?=
 =?utf-8?B?S3JSVTlrOGdpM0czaVBHeWhaS3lRQUEydUFUUXRHQzE2NFhRYjJlNWgzeVpo?=
 =?utf-8?B?OWVCNHhPaFZqSE9YRnZsMWxUcXpvTkhTdEY2c0dEN3AzSTBBTC9MZ2duZVda?=
 =?utf-8?B?ZUZPcDFlcnZjWlNLYkpUWDBFajFvVnpTZG5qMVZReTFnOXJSNEFYUGJ0L2dy?=
 =?utf-8?Q?dz/14qZK7Bk3Zu3Zbu65dLugCvVFeEfHNlqKr30?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1840
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34af11f9-41e5-40c9-c661-08d906261ed9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	upPkqIGrp0sSGcyFBjVQpUQ3h2iFaeB5ZdhyL2xUEsyi3+oUWWR6F/cCOdS/WeHWNA71z9gIoH4gC160fqyRxFVT4zhYvazSUjFiREYpMrhj7MjHIz15DhZhsdwI0WBGRNyK6DB1eskMpd8SdpS9ql/kFnumM+MWKkttw+YNeEIQetQ2LEP5NNnr40qRXlzVpj9TSCq2gc67/dLt9czV0X3pQm+FAPf7y1sufEN5ikZWrbJ68F2FTrr7QCjjY0Hfef9PUJUpA7PNHf3RKdwjibPf72+XsP1qBaFH/Yc56uGLfPAo1wwgt/wEBLyAB11ehwpqOBnTu98auM5WkkThgIFnstaEWXlQqy89aE5Egfj2ormpjq1SFN3QJIf6oloYtvp4KENcajYh++z0/TxURNM3HTzh4Oni1E7pEhoJDkyEQuhZzF6krxgtfLlSz6IP5qYSoXn6QICC3cUJKrfHvIZ1hbdcHT/ieilxpgyUZQb0XcWFXqepOv+PToqqtyjfjmHUw2K+HX9oWQlKc7Om+LJ1jEchTgsBWs9zAYqZkOYAJubICfPHuR2JrFT9se1XyOY+cmM4wZlBjP6+a8uecQzBkJmWFipdrDcjC8HLK11rHqWu+lvU5HFG812R7Rx57xADKA+8RryK2sxKS5vKuiScxKnWQMglZK58NErw4eWtb9nnG3gDfNFVBCjJykAQ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(36840700001)(46966006)(34020700004)(7696005)(86362001)(36860700001)(16526019)(186003)(478600001)(26005)(47076005)(70206006)(33656002)(83380400001)(6862004)(82310400003)(356005)(81166007)(70586007)(36756003)(82740400003)(6486002)(336012)(316002)(8936002)(5660300002)(66574015)(8676002)(6666004)(2906002)(956004)(44832011)(107886003)(4326008)(54906003)(53546011)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 07:05:18.4950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ca24ff-1399-4b89-6b14-08d90626273a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4043



> On 23 Apr 2021, at 08:00, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 23.04.21 08:55, Luca Fancellu wrote:
>>> On 23 Apr 2021, at 06:40, Juergen Gross <jgross@suse.com> wrote:
>>>=20
>>> Commit d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
>>> introduced an error in gntdev_mmap(): in case the call of
>>> mmu_interval_notifier_insert_locked() fails the exit path should not
>>> call mmu_interval_notifier_remove(), as this might result in NULL
>>> dereferences.
>>>=20
>>> One reason for failure is e.g. a signal pending for the running
>>> process.
>>>=20
>>> Fixes: d3eeb1d77c5d0af ("xen/gntdev: use mmu_interval_notifier_insert")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
>>> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> drivers/xen/gntdev.c | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
>>> index f01d58c7a042..a3e7be96527d 100644
>>> --- a/drivers/xen/gntdev.c
>>> +++ b/drivers/xen/gntdev.c
>>> @@ -1017,8 +1017,10 @@ static int gntdev_mmap(struct file *flip, struct=
 vm_area_struct *vma)
>>> 		err =3D mmu_interval_notifier_insert_locked(
>>> 			&map->notifier, vma->vm_mm, vma->vm_start,
>>> 			vma->vm_end - vma->vm_start, &gntdev_mmu_ops);
>>> -		if (err)
>>> +		if (err) {
>>> +			map->vma =3D NULL;
>>> 			goto out_unlock_put;
>>> +		}
>>> 	}
>>> 	mutex_unlock(&priv->lock);
>>>=20
>>> --=20
>>> 2.26.2
>>>=20
>>>=20
>> Hi Juergen,
>> I can see from the code that there is another path to out_unlock_put lab=
el some lines before:
>>         [=E2=80=A6]
>>         vma->vm_private_data =3D map;
>> 	if (map->flags) {
>> 		if ((vma->vm_flags & VM_WRITE) &&
>> 				(map->flags & GNTMAP_readonly))
>> 			goto out_unlock_put;
>> 	} else {
>> 		map->flags =3D GNTMAP_host_map;
>> 		if (!(vma->vm_flags & VM_WRITE))
>> 			map->flags |=3D GNTMAP_readonly;
>> 	}
>>         [=E2=80=A6]
>> Can be the case that use_ptemod is !=3D 0 also for that path?
>=20
> map->vma will be NULL in this case, so there will be no problem
> resulting from that path.
>=20

Right, thanks, seems good to me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


