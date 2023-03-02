Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BF6A83F1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504946.777413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjWT-0006vX-2y; Thu, 02 Mar 2023 14:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504946.777413; Thu, 02 Mar 2023 14:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjWS-0006sT-V1; Thu, 02 Mar 2023 14:03:04 +0000
Received: by outflank-mailman (input) for mailman id 504946;
 Thu, 02 Mar 2023 14:03:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aytp=62=citrix.com=prvs=418692924=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXjWR-0006sN-AA
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:03:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eee89301-b902-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 15:02:59 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Mar 2023 09:02:54 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB7065.namprd03.prod.outlook.com (2603:10b6:510:29b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 14:02:52 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 14:02:52 +0000
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
X-Inumbo-ID: eee89301-b902-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677765779;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0clz4Se25xflZTnPDdFzIlbcLjpx7XBwIG6+Y9TWI/o=;
  b=ITvWc9ki6DR7sEr7J2eaFsuLB9+4tDRtdlrVRZukpZ6/9emFx8qX0wcv
   L/k4CmWKi0QaopsjEu9+nRNkdGL39V9NlgmOorklNmg8TtpzjsStiX7by
   tVzEg0CIug1dxpJWTitaQs1izHRQB23ibzvmqaP5704WvdnArvIKF5SvY
   g=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 99186332
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fPucw6P8lknZjX/vrR0QlsFynXyQoLVcMsEvi/4bfWQNrUorhTYFx
 2IdWDqPMqyON2OgLohwbYm/8ElSuZfQyddlGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5gZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sBSB2Bot
 vUjEh4qQDOC3NCEzJSGa8A506zPLOGzVG8ekldJ6GiBSNwAHtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vJxujCCpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eezHqrBtlJTtVU8NZbmGzOnVYNByYIVFKmg9+azV6OSet2f
 hl8Fi0G6PJaGFaQZt75Uh6joX/CvQMGXNFQEOoS5wSEy66S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx750cjMcN07iw9HjdgiyrvZnPRUg+4QC/dmii5AloaZWlY4Gt4F7z4vNJLYLfRV6E1
 FANn8mF8OkPF9eDjiWLS+QWNK6l7LCONzi0qVVoGZ8m9Tik5X+4VY9V6TB6YkxuN645lSTBZ
 UbSvUZb4sBVNX7zNatvOdvpWoIt0LTqEsnjWrbMdN1Sb5NtdQiBuiZzeUqX2GOrm08p+U0iB
 aqmnQ+XJS5yIcxaIPCeG4/xDZdDKvgC+F7u
IronPort-HdrOrdr: A9a23:hbTgLKqmXTwcvNxyZbdUXVkaV5tNLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwOE80hqQFhrX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YET0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dNT2CA5sQkDuRYTzrdnGeKjM2Y6bRWK
 DshPau8FGbCAgqh4mAdzA4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiLuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjXf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W/AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABunRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1qol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSOvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdN2Gyj2MSaAtAnWu4NjD8ATgMy4eFOrC1zNdLkWqbrhnx1FaferH8
 paO/ptcorexCXVaMF0NjbFKupvwEklIbwoU+kAKiKzS+LwW/rXX7/gAYDuDYuoNwoYcUXCJV
 ZGdATPBax7nzKWsznD8VTsZ08=
X-IronPort-AV: E=Sophos;i="5.98,227,1673931600"; 
   d="scan'208";a="99186332"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCwuhjeAKZfijH6hzmzZUQdCWPQEeErE8oz7T2DF3NqBuX7EKO526evXegLYcFbj0MYYn7IDlPZ7kIDpx5noiXfK05COUVXfUHE0rkev/Hvp0Qh1n55tpHjEmyF0fGOI2iP4jH0A8ZrAJqJ4uZpqeue2j/6lATFp8jS1CIGZqVvbqUq9vuAevspgxW5Va75Qb7oBX2vYNMAhv+QtVRA0km2JeAanj5Ebvg943/psyD7WG61qQ7PkRz91YcmXSCHsUPIolhoY2v/ShYuWXwDZVsX2Q4/eX3QNrab7xi0VgSyRzPu6oMoTOQerS7NOiB4NRCZvn4OEbowzxAl7vdrawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvqA6WQT2Yeg9LN8RGiebZ8QHXq/FrR2euFGk1faUqQ=;
 b=IQ4Jk41R2AyHykmthc1WhulpftpLnfKIgbNwuNz3MbpLmE/Eu2Gup3v82JLrAPGi13gH13NtkPyM3x9GoFa2/C1u/xYXJH8Ddz0kD3TwxdqkuW1G7C59orxtFZW95nnLnQht7BOTqNzpyBDctR6LDVZuasb8MrzaJM0gyIxN7N42aIV/MDgbTKcB0i5NyvQ+ahj0cafQ1/A+w9M6SUP4WAtDzNUuSAVwNOp1M5zn/SU2Cqut36UlS/fRc0v21+S1Wba18DfYEe0Rs5rqu7HZ0F/Hox6vbIOIF9dgDtd+7+W2LMMQwzbNo1JAh8PiYUercIoh6FuOWZ/VyfNbpml7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvqA6WQT2Yeg9LN8RGiebZ8QHXq/FrR2euFGk1faUqQ=;
 b=XvIhhBDefwkHuWDYmCoVLTTNOGWEeBSzdX5CQHY9jgeqYPwckig/lu3MNTr2hg/S+3EHUCOHC9wH0RnwJg2f6GFUwCje2xBsyyLqDKLAAy5xDHRT9VDdzSy6WO405OXyyKEFo51KMLPp+KTFGR8J8Myua8NsylqHFSC5onYJRDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <881fd332-91c1-fea2-d1a2-3a5444a6f272@citrix.com>
Date: Thu, 2 Mar 2023 14:02:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: read/save hart_id and dtb_base passed
 by bootloader
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
 <3edbb40e86e480b2b71d596ff61c05336004b14c.1677762812.git.oleksii.kurochko@gmail.com>
In-Reply-To: <3edbb40e86e480b2b71d596ff61c05336004b14c.1677762812.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 941c8c90-8682-403d-fa17-08db1b26ce82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ScBVQ6vFYZ/Q25GvRzOLkJb1ZWA7YRzEMzH0I5FwVaICQrH8pM9TvJOC4n1ApvBMf56A+EGzCb6JkeKtRKHjWxqkOXcMgqk7g6Xvnb1ZrSTJwqOiL9rhUsjcxpC2NKINbGdDbnj792fHM19497rkV9a/ODvy/VNEfRgsYrkA4z6OLBfN3lykX50g4cO6tLSzBVgpFEry/4+6agEh5onMxMzMagZ4MqLfWgBQwAm+M4/ScLeh0PHzlxCso1eQZmmOywxlg1Mx7MHwuQmU0qaQ4aOfMRhMAAFVizwSLIG6JBG3jLV5NCicSgHQxANYcYKMDm3a+lR8L1REvY7ca3rDEpnkck2qN19xnLuKEeUQRTpR0mRPMv+EU8TPjSnTVkC94mf1NgZcqEwaudJiBx2ujnrPolPa5HefzgOzEhe4mPOLv9wdS2VMD5UcDkpGh/Lqp6GK+Fl1VyY5GrayQRqZrmk9l4IqDvcSkswvCf1YwGJ2fwS+/LN9fYihgPmiLCuQeO0gLrVaQoFPn6K8R9LmoIgG6uHZ/+QBSP5hf3UvYF1uXbyBhrG9ZKsFLKP+8e/AbpHhg9HFuhxBxwzg3t7VOngvQeKN1cJqgSF0Wj4hF1YS+RDT3ZLhz+igB670zGB02GF8rK0Dcd9k5JZw8S9HY8CYumjGEzZMwMPaLpKbhu/OOVtOr5RGLzC3Um+QuINSakKhdjwo8j8uGGOx4Bl8vhG9UcJ9OWh62L4+qj2nCZw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(451199018)(5660300002)(54906003)(36756003)(8936002)(31696002)(86362001)(6666004)(83380400001)(478600001)(2616005)(6486002)(6512007)(6506007)(53546011)(66476007)(8676002)(4326008)(186003)(26005)(66946007)(38100700002)(41300700001)(82960400001)(316002)(66556008)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDFKdnpBTmRiZlI0YVJuaW16YTZETFFLb24vMllhRDFxVGtpb1FwVm9yQ1FU?=
 =?utf-8?B?bktPbnpsRG4wVnpuWm1Hem9lNkFsOHlycUJzYTJxUnhocUJEc3VBNFBSOTZx?=
 =?utf-8?B?TXRpb1lreDV5WjBhT2FnejZGS0NRQWxvQkpLbEpqYW8wV0ZDWmhZRmJ3RSty?=
 =?utf-8?B?bkg5U2h0TDVlcGc0WGVVOHFLYXJ6ajcvNEhnY05FaU1TR0l2T0ZPT21idDEr?=
 =?utf-8?B?NHpPMzdMUWNUN0daTDhVY2N5VEhSK0JhZW9KcXJhQVV5WVdxYi9PWTlrT29a?=
 =?utf-8?B?aEpTRUxSdHFVRDcyRXVNR0szZ1FmdEd0NktUZUZYYzg1amF4SGdtV1VsUHlN?=
 =?utf-8?B?aUpmQmpDanVmMlZLbjN5NlJrUm9TZU00bGgxUWRtNk91Q2xVS1JCVitIZ0dy?=
 =?utf-8?B?STZCdXM4UTFFT2tQZGNqNmhVV2sxT0xNeE05L08vWnpHdC9SRzlFUHVSMFh1?=
 =?utf-8?B?ZUpMQjdHUmk3aDBhMkpoSmROeWtuYnREVEg3dS9YckRIbHZRMDU4MWJqYkgx?=
 =?utf-8?B?bTZLTTFlT1BJdVk5ODh6Rzd2Q3BUdFpyK0JZQU84c0hBVndNa1h6MUY5YkhJ?=
 =?utf-8?B?Umt6Q21rbytkNXVYMkxkcHc0bTV4cmxGM3o0S3hicnpOT0V2aHJwQjIwaVNZ?=
 =?utf-8?B?alRZbDJxL0l6ZVI4VW43WGc4VndXQ2o1SE1Jd25peGFPSHNhMmdlTXUvVkNm?=
 =?utf-8?B?T3BYeDlIVVZKa2JUV1drTzJ2djBPc1dlQ0svR24wSUNCNm9UNjdEWUgwaytI?=
 =?utf-8?B?R05WeCs5amRtWk50ZlhLSmNscEd0UHEwR29xUitDMUpKbGFHNlZjNjA5Rlhj?=
 =?utf-8?B?WXFHQmp1WGU4cEVNck5KZjdyREVLZ2tpWGoyd1pqRmhzVG03ekdzR0xQaDZj?=
 =?utf-8?B?UDFOSndYbnFCZHBSMXRuSW5jOGRRU0dZUmsvRUNsVWE1MWVDMUlTeWVUemxU?=
 =?utf-8?B?Z29wd1RPZGwwL0RWbXYybjN3NGhXYzZNQlNQWGxIaWgvVCtYd29NRFUzQjNu?=
 =?utf-8?B?TzFOd3dJUlQ3UlFQSU4xTno0b1RZWUVwWlAzSzI1Q0hLWkhuWlh5a2dCcG0x?=
 =?utf-8?B?eldCc3YyOFFwNHBJem03MEJQdThoaVBaWUFmMzA1eFkxR2tzSmVTcjZsZHNE?=
 =?utf-8?B?Um9wcVl4OW5nUWd0ZVZKbzBpaTE3VGJIZkdtczh2M0VlS1p4TEpkY3NMMzBL?=
 =?utf-8?B?QmZ3MVZrR3hxWWorSVRMVjFOdE9VVW5PQ1Fia0wrenFVZjhRdCtkcnVWNkQ0?=
 =?utf-8?B?azdvU005T3NkVG5MbmQ0S24remZEREUyUnFiSXo2OXlaZXVWM3JJL3FTb0RK?=
 =?utf-8?B?RGZxYUphZWdITExYTUZnc0FDbU44NUtja0dmTDQzQ1MyS3RGNVF2UjlIL3pO?=
 =?utf-8?B?U3hEa2lZK0ZlaG04ZUpoUzVBNGkzOXc4VnJTNDY4SCtCYW00OXZjWUtiRWV5?=
 =?utf-8?B?bUU0Q0o2cDYyanVHeEFKd2Z0Mko5c1ZZQkNKTW1iZEoxK2V0b0Rib2pmaGtH?=
 =?utf-8?B?U0VLVkRqaDZxRlVZdTNSMDA5VHdQZ2Z4MzB1cHlOenAva3JodjkrQmhHdTBR?=
 =?utf-8?B?akI1YnRrdjN2NXE2ZVVxZmsrSkIxRHExQWV3VWs1R2lBSnd3WVlTZHkzYWk2?=
 =?utf-8?B?Y2NldEFZbjJla2NNcGtWMVlFOUsxSlpHTjM1Q3hvelZFeGltdjlRYVBPbnUy?=
 =?utf-8?B?cE1vUkduQkpZWmdLRmwwckIyekhqUHhocVhsOUwvdThCaHNoSFludmFQME9u?=
 =?utf-8?B?Wm5KUVdVVElmZVlGYzdkTEdoaEZLMWR4SEgvR0Z2UTg2R011VG4vL0kvTG9s?=
 =?utf-8?B?ZFp4ck9IcEpCNmQrdExIZHhlaGV6SHVoWm1CQ29QTXFod1Y1cnV2Q0lOWVlO?=
 =?utf-8?B?MUhvSkc0aXFhVkFSeTdzaW5jYVBFMFYrK0F3akpsOTVoNDdLZ09rYW9rNUc2?=
 =?utf-8?B?ZUt4ODlWN1hGMU5tSTh4elRPUU5iZkVZSCsrRldiY0RETExPSUdsK3FZU1RN?=
 =?utf-8?B?Sjh0TCtvWVZqekRlR1Q4dDlFZkhtWHhSZ1BlMlpEa3ZHL0RPaVV2Vk5xZG9G?=
 =?utf-8?B?WDN1L2Q4ekUrc1V6b2RzQTNoSFg0cHIyYlQ5VFUrd2hnSkRFenY3R3hVQkw1?=
 =?utf-8?B?N3lNUkh2Z1dQeldPYVBHVE9pd3Y5ZkxkUWFnb0NYRU4vQjRhNUN2U1RGREVw?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NhBY55Unqj+DwlNKkn4q3ZwJQIrbwPrXVs+q96nTgMiAOpGGKeEPPOWmjonUmivV0MnTzFyT8L/kGtHJ52q/yi/ZvlEgdP8GbyFsEiMPUViW9gmBKWi1G8NduAv0PwmBhEG2gH0dGbvRo7ECfiBsosVGDvF2YrkU8UKfkofk+Az2X+CL6OyfddeZvWafAPn0oo0qoVlJpVBC4Borv3V0nF81N5CIbLYq6NLj56gG9oNKg0onE+FhnDmN67Zru8SnD3Pi95iok8RlIFqyx34FZYYP+xDATYGAthECsrTfxl2Ik+/61CDrGaYpBUsvdIuy9pGJKHbw/TgLoDIorDLtMcx/ODZuIO3qJTvb0iRgmvL8q0UtACf/LVsLb7xz8XT9cyyatsq988vcBgEU1/co8bfQdbQDZgcL6mGjZIG1wJ/CPp716zHe3YgQRZFjUYdPIG4oaE40EDJByKdc3Rhl6imFklWn0YlWhc6Wt35+Q47+xsORXT3MG6AUTut3hnu0HhiLsfDkZz7qm3MkaVOZa4BRp5laYTHbqCOgui86a3JHq8IKnGLyjzuzY/Zm7PfWSkUiuxrHScD9uPnrzxS+2/ZrkIHyns05Du+ju+A4+vnsA5XyBHCFe9n6m2rEeOD4IF9c8Ax/NjtE+qg5hqUpZESyGnCaXS+FdlUixHsEZBUDs0bBNf9KHOXTswnRFXlJXO2lYfzpIVBmcoCrg/xvhRKz7HqHo4IO9CHtwiJz/BqBmIjTi2eKGXzk+vO8yaIhXWoMS9HhMBvypsE3TF3kmWwCf0C6c4Qfd/c/ybYTIRyoncjsnjDavFn2hpg/YgDIssCAYP/C80BrOitlLMYrt5DfpQwMnf1m0LmdVyRHRgP187NmvzOBn2jFE5lCM49bhPmwdVyw/Zy5LYv3fde8fSIzrnE+SCMg0wHkQQ2eb6A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941c8c90-8682-403d-fa17-08db1b26ce82
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 14:02:52.0139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DND2/tJv45MwV0HATxhC+cP0CfDzTSYb6J9YrwvgZoJS04KHuwVjGYdO9eQ/J2GbAWk+fmG1Cln9io3ox9uTuh5ZWjKnH0jzayLWPcrkn5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7065

On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index ffd95f9f89..851b4691a5 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -6,8 +7,31 @@ ENTRY(start)
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>  
> +        /* Save HART ID and DTB base */
> +        lla     a6, _bootcpu_id
> +        REG_S   a0, (a6)
> +        lla     a6, _dtb_base
> +        REG_S   a1, (a6)
> +
>          la      sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
>  
> +        lla     a6, _bootcpu_id
> +        REG_L   a0, (a6)
> +        lla     a6, _dtb_base
> +        REG_L   a1, (a6)

This is overkill.

Put a comment at start identifying which parameters are in which
registers, and just make sure not to clobber them - RISCV has plenty of
registers.

Right now, we don't touch the a registers at all, which is why your v1
patch worked.  (a0 and a1 still have the same value when we get into C).

If we do need to start calling more complex things here (and I'm not
sure that we do), we could either store the parameters in s2-11, or
spill them onto the stack; both of which are preferable to spilling to
global variables like this.

> +
>          tail    start_xen
> +
> +        /*
> +         * Boot cpu id is passed by a bootloader
> +         */
> +_bootcpu_id:
> +        RISCV_PTR 0x0

Just a note (as you want to delete this anyway), this isn't a PTR, it's
a LONG.

> +
> +        /*
> +         * DTB base is passed by a bootloader
> +         */
> +_dtb_base:
> +        RISCV_PTR 0x0
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 1c87899e8e..d9723fe1c0 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -7,7 +7,8 @@
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
> -void __init noreturn start_xen(void)
> +void __init noreturn start_xen(unsigned long bootcpu_id,
> +                               unsigned long dtb_base)

To be clear, this change should be this hunk exactly as it is, and a
comment immediately ahead of ENTRY(start) describing the entry ABI.

There is no need currently to change any of the asm code.

~Andrew

