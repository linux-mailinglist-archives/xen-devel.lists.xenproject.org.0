Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D39F6C86D8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514425.796643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfo1s-0005x6-0W; Fri, 24 Mar 2023 20:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514425.796643; Fri, 24 Mar 2023 20:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfo1r-0005uZ-TK; Fri, 24 Mar 2023 20:28:51 +0000
Received: by outflank-mailman (input) for mailman id 514425;
 Fri, 24 Mar 2023 20:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfo1q-0005uN-2u
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 20:28:50 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab93c18-ca82-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 21:28:48 +0100 (CET)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 16:28:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5112.namprd03.prod.outlook.com (2603:10b6:a03:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 20:28:40 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 20:28:40 +0000
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
X-Inumbo-ID: 7ab93c18-ca82-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679689728;
  h=message-id:date:subject:to:references:from:in-reply-to:
   mime-version;
  bh=/TAaY9WxArTpfKJQxeKHTFMGKh5DyGqTVG+IFn4FBpg=;
  b=eQGe3ZGS9CWeG6s39ie/YUbqeDC638Uc2g2FaGCuG/wY0Pij3/Zwcco9
   smv2KRS4jbUv5o+aOLQZ0mFVCd91pbedrdM7eH9nQUvzTEbiWB2WBhbXm
   E/0DDDkyE5UJ+6KOaCXO3C6hO7fyI3EmMCrn8WkiJpAglw7UlNqzHv/D/
   Q=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 102276783
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+3/4IayTnj0NVWuFYYt6t+cXxyrEfRIJ4+MujC+fZmUNrF6WrkUCm
 jcaUGGGOPqJN2Gjc40jOorn9koE7cDXytdkHlZu+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6wT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KThT6
 8wABG01VxOoqO3vzey6cLc1oMt2eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFMZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjAthNSuLorZaGhnWDyzErKU0pa2LlvPL6i0CaWu5Ed
 B0br39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOuMIzRBQr0
 EGIhNLjATFzsLyTRmmZ/73SpjS3URX5NkcHbC4ACA4aud/qpdhpigqVFoo8VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTxgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:pgokKK8b24E/esbk4chuk+AfI+orL9Y04lQ7vn2YSXRuA6qlfq
 GV/MjzsCWetN9/YhAdcLy7Scy9qBDnhOdICOsqTM+ftWDd0QPGQr2KhbGSuAEIcBeOktK1u5
 0QFJRWOZncN3U/q+DQiTPVLz8n+rO62ZHtv8vli11Kai5LRZ1axzpYLCHeKGFKLTM2ZqYRJd
 6S5s9KvTqydW5/VKmGL3MYRfXEo9HRtL+OW29lOyIa
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208,217";a="102276783"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNnfc5+AmYejjq2A/aPCVr93hXXXqSoh/FGAG2riFF6yWslOp9FSeMxnaerESS2/m+LH4Re9Q0sL55VVzBd/L73MiRbHyV3MkDuyqAQdpcFSoyWJttKel7UuesWrozIwkKur+7TcX5Fh6Xs67v8Ezp22BrorXbfmeg2Kla+75svmCyyrP8w+2kHeFzADxSMZrX6Ec5+hYZ+S0OAT2mOTGAEGO5M8obojtNe7Dk0U+IsSSMilMerOB5CrZAMenUQb8e0QFFhaC7sCZk1mqL7DUXk67Gim7oycAVFvFvMfF67hcC/ML5UZJoO14kbRsQ05O7BaQYIdlYUmyHRRC3wNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyU3Ooxw0kbyI8sGFA2A7Zw5E9gncTG7r71r9AkVX7g=;
 b=j3m4zf3bKRQm9Ke4OKoT27zIiYP1JXz5AIwb9T7a8eBedNLIu7bEqGVorGEROZtBSzoyyXYLO3W2/ikOe2cE7CzWIKgXNAzUROPrVL99mylgix2kxFwkVNThn2a/AwDzo24R+74xHSj17kiQKS6t3yhteLmA3FVcPucsxuAwvh93zJskKo2sP2rgXEvyYHetV3cZtQ5sJCO/jJ81CUB2ZEg19rRVXYr2dS0DiZSRy0zSavZRLm5GjCdgZ1tfiOm/gcflJHU+scjMhwM5HkY6wz4cBJpnUQ7ZXBa2TChU+FAitAOwU8XF1FoiqyFNLHKA75w2DW51v3KAW3R6KT718g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dyU3Ooxw0kbyI8sGFA2A7Zw5E9gncTG7r71r9AkVX7g=;
 b=N5RFCB4pGeqbaZ2y9FIaWA/tFuMjh+COuDZGhvCn1PD46uZ9CxayAJlaVjXbm8KiHX93zo6TFl09UCL+SDVSPN0xtTmokEZpoaFYgoZUuEP0V35zg5Qxoq++QKCP47EtOxyJ0cseFXAEV/jotd27R7N9fqVymSbMY+XwO1Qg/hE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/alternative;
 boundary="------------TW0g3T0loKFbWFgaRK4YD9Vb"
Message-ID: <fbe7ded7-47f6-caec-dabb-6978d9e2a192@citrix.com>
Date: Fri, 24 Mar 2023 20:28:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [xen-unstable-smoke test] 179929: regressions - trouble:
 blocked/fail/pass/starved
Content-Language: en-GB
To: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@citrix.com>, Demi Marie Obenour <demi@invisiblethingslab.com>
References: <osstest-179929-mainreport@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <osstest-179929-mainreport@xen.org>
X-ClientProxiedBy: LO2P265CA0335.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::35) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: 383cd192-fee7-4361-6740-08db2ca65acd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rm+f4kIE8Raw0qJBuermOQnQ9DSkFxLrYEzCZM/eLdo330EQliILjNN2ln2bMNop5bmZdV5jBeJ8OIU3HmLEJc49/LGap+irdWVxYizDZ8FKdcKqbz+pfLZ9JVODCyzyN4rTFVMS3JkTg3rKzUH0JoEDsRhYA+PCWiU+ChAC9Eh2wCCk0/OxFd6DtAVOcUNLk4sIs5qypHhmvWKzF23v9c8y9vkp7K/M9PUAlPEBtBAbHsTNEvbNowv+ChoGg0LZklfAkNwBXGmRpC/N4Ini0gd7u/an0IFctu02KJiYcCynZWwHd5bD7q5sIWN0XBOjsHvLRVZ5GVLUJOR2lPeua6pF9TmEZxpFw0JGhPMO9/lWrx+fuV2NA4+09KLJYrmae/9Ja6GRJRcrpU1Znps6ruVUue4ZMhyd4lMuXqlPj0b9Q4+IcqCVPrc33g4QZAoQ2OTYuMdG8i2LIfVL9tUhtPK4rlTnZrBa5gDu3ONsriQ2w9iui4YEe/SGbEs/b7+lJML0ls++nV2RXwgFGOZrdCy5gUeLsMzEC6oxM1uqsHiVjMVygVAkgZLLlr79UlDHAFrraQ+0OlCK1kE8nRS6KLeuO8w7lpHs8/MYY2VsKFT2hpZUjgL/BYM+O2XOrC3vRSc1d1DLySRnHs6SJNraCUnQJ1L0A/Nnbz60jcUntsxP11qTR9x/BnfrfFeyR4bRZj6OMNVSs0adNNYTahCLtqICH7E/JOrBFDJtFlrkrsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(31696002)(83380400001)(966005)(6486002)(2906002)(478600001)(6512007)(8936002)(6506007)(26005)(8676002)(86362001)(186003)(36756003)(2616005)(66556008)(38100700002)(33964004)(31686004)(166002)(6666004)(41300700001)(82960400001)(5660300002)(110136005)(66476007)(66946007)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkJMV0ZpSEtUUXU4N2FYUVNQOUdYaEkyU01RejFEeHJCV2VrdHFTM2UrYmUv?=
 =?utf-8?B?MWpmTXYyelk4MXdKZ0xGZ0p2VFpXMEpISzlUeE9zWUtUMlpoZ2ZPRjJibVBQ?=
 =?utf-8?B?WkNxL05iQTAyOXg3UGhmYlBSblVqbUNJK3IrYm9WVnRldGlCTEMvSkhpNXQw?=
 =?utf-8?B?VHZBbHdFNkEvWHR0NDhtYnBDZHBEV0NRL1VpVzdkSnplaXM4MkVMNzlKSWFO?=
 =?utf-8?B?N2gwRDBGOFpFNldyUXh6SUE5anpUU011TGpXMjhlOWFCeDg5bmQyQ0JZck5W?=
 =?utf-8?B?ZGxCMzQwTnJhSEp6VlVzQ1FYTS9ldHZlNEtwbmV2RHRyQXRTWEp6Nit3M3NM?=
 =?utf-8?B?WjAyaU1nM3lsb2F5cUJUTVlnVGpUS1hiamkwNTc5Qk5WU0cvbkJHNjdvUWRk?=
 =?utf-8?B?UStaZnJ0T2k4NDAzMTNmNVl4M0c2WUxmS1k1OEUwWlVJTUxySWNtb3lvbjhh?=
 =?utf-8?B?eS9mWk9HcU1pc2UvYTdZREY1cGI2UlV3bHBWNFNoN2VQMGZ0YVVrcVRqTEZU?=
 =?utf-8?B?NmpuekJnN3RsTUxTOVJ1UWhhZjhtZHNGZ3JFaWtuZWpueUhlM1U0NDRxV3ZN?=
 =?utf-8?B?ODBrcTJwTGNmNTc4WnQzWE5ONWJ3V3haNk0vVVM2R2RSZXlBVWw3UkxwbEhy?=
 =?utf-8?B?eEhvV2ZCYnJSODFpMGlPQkJQbVJJWkk5NWlZMUNaa3BqM24wUm1lQTN0UVh6?=
 =?utf-8?B?MGd3bHFsV1RWVjA4T1Z2bGpyb0RtZGtMWHRxL1k5SUtoMUxMZDZKTUF2bUk0?=
 =?utf-8?B?OEwzM1RjZU9LVjBXM1ZjNVlyMitUN3dJcU84ZWVjYm0vZjIxc3NKQ3d2UnhM?=
 =?utf-8?B?dlRVZnFHa0RmQXlJSkprTmZvZVVTZmJlUFlrTUFEeEF3ZkdVQkMxNzhSYm1w?=
 =?utf-8?B?QU5BNlI4VHY5ekd5WkpRbXJic3d1dWJsby84cEw5OU1tY1F1TEdCbDZuZkdS?=
 =?utf-8?B?V0RidER1Tkk0U0VySS9yUE1scW1vQnNzMGZzNVZQNEFZQm55K3hNcXd5Ynoy?=
 =?utf-8?B?b21FSzl1SzIxcVo5bnlDRXNxVEtKV3VSWFJiSVNaMGpFYWFadmVENWFjYTFt?=
 =?utf-8?B?dXBKTWVLUEpIYmZhU1hkWUlFT1VGNjVLSkhjRTByT1FRU1RWQ0Z4b1c4NXdF?=
 =?utf-8?B?d3Bhb0tKV0RkS1dlNDVKNXlFVVFxTmVNOTFzZkNIMUJXRTJTaGNzdnpmaUdW?=
 =?utf-8?B?ME83REpMWVZ1eUF5cHFzTkIrM2w1WG00SC9pamRlMXNPbXZQdEZjV1FqS0JS?=
 =?utf-8?B?c1dFNjU4eHd0eHJHOExLMjg0QTVRZE51UUczK0tDcWhjREV4ejV5Umk4dngx?=
 =?utf-8?B?MkpWaUl1UEU5a0ttbXdiVlpnY3NFcXhtUEoxUVdMdktsc295ZGdQR1I3L1d2?=
 =?utf-8?B?OTVuR2xCb29RWWZ6S05ZcjRIVml5MXVUcFZ4YlRuYy9QWE5Xb25kL25WODNZ?=
 =?utf-8?B?UlN5L1pDZjZ0bkFsRm1oMDlhUWV4b3E3ZmlxQ3BMMFFiMzBMWUxJb0Fna2gy?=
 =?utf-8?B?U2wreXA0anZTRFdKRmt5dDJHYkdEcGJDbXNNajZjWnNiREJ3K0pna3pKUHRF?=
 =?utf-8?B?akZ2Y0MzNm9DdkpGUWJYV21zY3R0TDN2Nkw5K25hTk45QmdUTmxXaFhqdWFD?=
 =?utf-8?B?Y1JwUzVGK1lQbWtQZHBneGZMYWl6RW02cGFINndjdUh2dHNvK0doYWozdVFy?=
 =?utf-8?B?UDl1QkV3ekszTE1EYzBzSFN6OHgvekluc2tiSGJ0Y3ZCU0Zmem5CUWwxUlZv?=
 =?utf-8?B?b00renEzREJFb0FrUUJCYnhyZDQ4a0E0dG1IVTl5ZS9XYUpUTTlZdmhlaHBp?=
 =?utf-8?B?emZ2QmlaT0lLWDBIdGhjUEd6STk0KzBvRERmR3NwaDYzV1Yzelg5NGFSSDN1?=
 =?utf-8?B?QjBobUxvVGpuR0ZpM2NLdWRncFlrbmx1ZHgyZDJhVkhkcWJnNmE3dHBjUUN4?=
 =?utf-8?B?Y0MxR2o1dkRjS3g0dHZpWjJ1bW00aEk4RFgwZVhFUjFoRlFUWE93UTl1N0tz?=
 =?utf-8?B?Tm45U0N0cUxUV1VzM1lEaTl5ZjRMakpLcjJ0dkg0VlRtVmJFMHR1b1Q3VGor?=
 =?utf-8?B?S3g4UWk3Ykw5bGc4MVQxb21EVzZtaHd4MzdxV1paQ3B6aHdtL21uVUtZdE43?=
 =?utf-8?B?b1pmdnVUVnBVLy9wSVBRNHpWajIvK2V3cUJDNzRIdUxsSUt1VFBuUnIyT01O?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7cp50LhQVvTP+hgC4SDGOSiQ9bbwGczP1KkMuWkO8GEL/xFWJaIUIIg4Jfa6K4yNJ1FNB+U0exq5vMB4bzT9jrsjToI0QDbhl29/YxX7TLWx6GQJPq9Tz5EhN6PR2tcuDH9jJ7PaYel80JjSVrSG2061mdewg0xvFyuihREYkNP3shDM9wrc4N14rk2YL9o6zbLjIWTjqtQlQPLgz0fDmb4esse6SZkBV9TMgK6PFXE7ap0/M/6vJ4g62QRBY7uB8Sp91Sy5LjA45kOUj3FqlCAXJlqMbjdrK91Z5WTCrJ6lYxICrNqGRlLG0ks7dMrMVDQwRsT2rniTVLvbyNU+M9IJYukyaroE/Xkxh3z10ntuCcv0+VO0q7cXi+iqtY9OdzfDdSiC29cYV6Z/FgwzG+kPw+QwzvhAeHRfip1hcR9yhr6C61nO/hbWUF6CiaEKa0HZ4J29uSF3d7wHKvTndxuU7xXkMEb2pV1gwFnau/GFeJNw95BYroZUSHtAP4TE4LIyIENQEfZUUN23X4f87pKkpfw3w/MkLPhp1o3RpUSqJIPKEOvRZH+XMmMlFhBNhUrtHkWUMnUPEFAoy87CCdWrdNDwhmF/9WevsP3twHeTh5AwpJDbTDAKxAsmTFT+Nv2Aufrr4hb26G+exe0iqPUZ3o8MNnbFBTuQZlY13fDO0sBrjjyXxG6YEd/DhG9PwwX8WRpFhKDit3BnZOSSpmPEw2OFtYpcgEd6fKtGpu93bUPWjQtT/nLora9UNbf3lE1+qPiJqvSelF1gznhw3NYYrk6efKexyeC9sT4QOL6sU+j/l/s91tjvawDo+J6mu3yeFXPVFCnDKJK7YYaICg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383cd192-fee7-4361-6740-08db2ca65acd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 20:28:40.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8cm3LQTyrt1qPXNJWxcEOFCUXHEj1OhrlGwA/1081eRZT6sY9Ko6t9Q+wj19P3BaIT4NbvD/jV+Qg4wrnEeo293Lh3VJKPu+fypPD2cAYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5112

--------------TW0g3T0loKFbWFgaRK4YD9Vb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2023 6:58 pm, osstest service owner wrote:
> flight 179929 xen-unstable-smoke real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/179929/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-amd64                   6 xen-build                fail REGR. vs. 179926

Bah.

make[6]: Entering directory '/home/osstest/build.179929.build-amd64/xen/tools/firmware/etherboot'
set -e; if ! /usr/bin/wget -c -O _ipxe.tar.gz https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz; then \
	git clone file:////osstest/IPXE-GIT-FORBIDDEN ipxe.git; \
	(cd ipxe.git && git archive --format=tar --prefix=ipxe/ \
	3c040ad387099483102708bb1839110bc788cefb | gzip -n >../_ipxe.tar.gz); \
	rm -rf ipxe.git; \
fi
--2023-03-24 17:06:51--  https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz
Resolving cache (cache)... 172.16.148.6
Connecting to cache (cache)|172.16.148.6|:3128... connected.
ERROR: The certificate of 'xenbits.xen.org' is not trusted.
ERROR: The certificate of 'xenbits.xen.org' has expired.
Cloning into 'ipxe.git'...
fatal: '//osstest/IPXE-GIT-FORBIDDEN' does not appear to be a git repository
fatal: Could not read from remote repository.


That's OSSTest choking, apparently with the same LE root cert problem?

~Andrew
--------------TW0g3T0loKFbWFgaRK4YD9Vb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 24/03/2023 6:58 pm, osstest service
      owner wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:osstest-179929-mainreport@xen.org">
      <pre class="moz-quote-pre" wrap="">flight 179929 xen-unstable-smoke real [real]
<a class="moz-txt-link-freetext" href="http://logs.test-lab.xenproject.org/osstest/logs/179929/">http://logs.test-lab.xenproject.org/osstest/logs/179929/</a>

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 179926</pre>
    </blockquote>
    <br>
    Bah.<br>
    <br>
    <pre>make[6]: Entering directory '/home/osstest/build.179929.build-amd64/xen/tools/firmware/etherboot'
set -e; if ! /usr/bin/wget -c -O _ipxe.tar.gz <a class="moz-txt-link-freetext" href="https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz">https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz</a>; then \
	git clone <a class="moz-txt-link-freetext" href="file:////osstest/IPXE-GIT-FORBIDDEN">file:////osstest/IPXE-GIT-FORBIDDEN</a> ipxe.git; \
	(cd ipxe.git &amp;&amp; git archive --format=tar --prefix=ipxe/ \
	3c040ad387099483102708bb1839110bc788cefb | gzip -n &gt;../_ipxe.tar.gz); \
	rm -rf ipxe.git; \
fi
--2023-03-24 17:06:51--  <a class="moz-txt-link-freetext" href="https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz">https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz</a>
Resolving cache (cache)... 172.16.148.6
Connecting to cache (cache)|172.16.148.6|:3128... connected.
ERROR: The certificate of 'xenbits.xen.org' is not trusted.
ERROR: The certificate of 'xenbits.xen.org' has expired.
Cloning into 'ipxe.git'...
fatal: '//osstest/IPXE-GIT-FORBIDDEN' does not appear to be a git repository
fatal: Could not read from remote repository.
</pre>
    <br>
    That's OSSTest choking, apparently with the same LE root cert
    problem?<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------TW0g3T0loKFbWFgaRK4YD9Vb--

