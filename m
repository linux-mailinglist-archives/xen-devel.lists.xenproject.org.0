Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FB293AF7F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 12:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764058.1174361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYma-0000KV-7b; Wed, 24 Jul 2024 09:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764058.1174361; Wed, 24 Jul 2024 09:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYma-0000He-4M; Wed, 24 Jul 2024 09:59:40 +0000
Received: by outflank-mailman (input) for mailman id 764058;
 Wed, 24 Jul 2024 09:59:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKCg=OY=epam.com=prvs=3935428134=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sWYmY-0000HW-GH
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 09:59:38 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e5047b2-49a3-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 11:59:36 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O83irx000824;
 Wed, 24 Jul 2024 09:59:25 GMT
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazlp17012031.outbound.protection.outlook.com [40.93.64.31])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 40jcwfmcme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jul 2024 09:59:25 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS4PR03MB8253.eurprd03.prod.outlook.com (2603:10a6:20b:4fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Wed, 24 Jul
 2024 09:59:21 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Wed, 24 Jul 2024
 09:59:21 +0000
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
X-Inumbo-ID: 6e5047b2-49a3-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVLRpJyeyMgo7JeAJa+GxuVnnNEL08r3QIsMII9z4JzhV/iJS8YfKqn6kP+9oU8fCje7KGKXck09vvceYlRbji1A4ADJsgZRotkOfjTi47+NIWWwcsMUcSQqZnrK6+sKqbPuR5/NMFj0S7XmOJmaIfqqu5v3CV2KdLzbaT2gTJItkC80gnSGbFcBpr7B1hG1Ijg2ItjFEm4kLxwgLPXEyG8fzpVe8Otqso/GcG+WLtsNjrxn7puQpfcWZpwTDLs/f/EvXONh6bYe4Vptd3RaVYexWXWYqkZwd8Pl+SkZaJYZh5hUlbkY4EeyVfRUaXm53Gv6i5hin8ndGaR3YwYSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOyDNu2XcsuudN+p+2nAkvBKhVQUirlp15vouzEOAaU=;
 b=RIm91mJ/fadPR6q8dT+k20ra5dWr4qRi2/OEfY6wRAXFc0izay3jqJbr1gsfGl+0EHrQZoBErd9yF5VoqmYDWZfTvE2aXJ6dNvDbrTe/gTWbihuoySzibg7qlilc4P8QFTr4Bbi+KFyGMcUSSly0fLJQADwghxJ6Z4aNx8zlVQpsR7o7Y/5yYtoyLvK3l51c+D44e9qZIemVinlvJMKl4X0VS+4CSfU6DIt6Jt8NaiM+tG/XSR/I5fX0GjgXF7nFcc2QdF+rJLJULvvWnc9XPpMczu3CNRTN/HXjD40e6cnExp/akCua85P5+rQ8ggms7gTiDMrMiek4xjj/7NEU+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOyDNu2XcsuudN+p+2nAkvBKhVQUirlp15vouzEOAaU=;
 b=Har48oTiwCyr9MQG845KyqY0+0XDxRWzSsmf/t560cbh/VxstI7fvtzbxfh8QVRwOaw5BX1lblFzJGmRfOlDhH/RiCN9AoSt3xD4GIp9J1OzVJuGzDAGqjGIXQV5rpf2NcdyaNXlqlxxhuWJSJe8f1nuxHN1UFaJfx6XVZuiGDVhJEEN//FqQgDR+b3weWV3YvUZV8i+xa1x3MVEG6ye5pSXMF5QoS6448kvz0QbC77tSDSvai8MHq9igBqEZiaF0NnaAvlXYqGXcWLrZn0BC5Bs1sgB30BZ/nb3n242Fl3Ufr7aez/8rgpvhKtpq0sWwyqrGqlgcVojwfgQz23oYQ==
Message-ID: <e0f86c3f-1d40-4e07-8e43-4806e3f89822@epam.com>
Date: Wed, 24 Jul 2024 12:59:19 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 10/14] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Paul Durrant <paul@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <668355271f01681070cb15f67af1538104bfc651.1720501197.git.Sergiy_Kibrik@epam.com>
 <a89c973e-035a-4e8f-b446-03bbcf724f86@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <a89c973e-035a-4e8f-b446-03bbcf724f86@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::7) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS4PR03MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: a47da188-508f-4867-ab24-08dcabc74a46
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTZMUnlKU0dneEVqc3NaR2J6bFl6bHpybWoycDQ4bzg2WitkWVZoaXdkUnJH?=
 =?utf-8?B?TGFMV09BSWtSMmFkdjFIeWZBRGprVGFCa0o3RnlSYXNLcW51NGVBeGxrRDNC?=
 =?utf-8?B?eTdWakVBZXpGTVZpNk82YVd2cDJOQUwxcVZZdzJ0NmJrWkd0QjUwejhvbkFF?=
 =?utf-8?B?cU5HUS9hdktobTdvNnIyMloyaDBNZzdXeldmcVMwem9tT0d5WFlZTy9mT3Fp?=
 =?utf-8?B?RzBtcVFPQk1GejdIZDR3MnJWaTV3NGFtdDRwY2NRWUp6TGVBR2U0b1IzSG12?=
 =?utf-8?B?Z1g4dno2b3I1dVFaWkdTK3J4dWdBaGhZcTFidXhZY0tpYmlYZHBGZUlISG5D?=
 =?utf-8?B?Qy94ajRWaWsvUjJpNy9leEZ4d01hOFNrRUFxbVk1MW9vd0ZBZjVVUk9iY1k4?=
 =?utf-8?B?ektKUWFSRXFZTXR5alUwTFBxUks0bjhZY05Kbmg2NnhaQW9ycW5vVXc5TG1p?=
 =?utf-8?B?alU3SW94YnpDWkZGeDRjRkluVVcwTE9pbXl6T05aZ3lnSXplbWlBc0RRdkVZ?=
 =?utf-8?B?YVIxTE5SUXZ4dVJPTFBLZElzY2RMYnJNN1MvYXBhdlZSUFJIaXF0N2JxTHF1?=
 =?utf-8?B?V0x6OXdYV0pUcGRpVlMxQTU2RGYyTnlheDJJSWdRdVJRb21MNTlzNUQ4Y1Ex?=
 =?utf-8?B?b0laZWh2bXZFYlBNUjZvbWlacmJHa0dEOEcwb040eldKU0UvYVFJWEk0cDZO?=
 =?utf-8?B?dGRlSnVuR3RlL0N1NzA4dGdkVjhsZ1RRZUtjY0lPUGw2MkpCRmNHSXhFVmp3?=
 =?utf-8?B?elFaSFZlVUw2bmVvUnMxR0l6NmFiRDJNTTJWL2krVm1PbkJXcWx6S293Nm5i?=
 =?utf-8?B?b3llbWd2eWlweTNLbnpzRHFWeXJtNndPWWN1V3ljYzhOTkxremRPMWc5emJG?=
 =?utf-8?B?eXBha21xbXEwZHhLdUp0cEl5Z21oWERzQWNXRzFob2VnOWZ1RVZNc1R4Rnkw?=
 =?utf-8?B?QjIwcXpVNHAzRnRmbkU5dnFSRlRTRlBXZDlVVmtBa1MvSGhpdnc2WDJjSm5m?=
 =?utf-8?B?OWM2MWNrVy9YcUV4TzVzdlVyNVdMWVBRT2x3MGt1TDhBWkdETE01SFJzSzFa?=
 =?utf-8?B?eEg3N0NxUmJlaVNPRnJJbEp3UHJ1MEZNMEpneEN3K2ptVGJpZnFFSGpDVUtL?=
 =?utf-8?B?RGt5YW1GcCsrL0p5Q01ETHI4ZTFSekZmb09xY1dHMWJCaTVnQXRuWUlkT0FG?=
 =?utf-8?B?V3B1VDJtL1ZPVytUU1lSeGVOQXREa3YyMzcreEN5S1NJODB5Qm1pOEs0eWhx?=
 =?utf-8?B?NzlHaUova0tHZldjdHFpNmtqME5iRnMybUc2ZDN0NkNVcWovRGtmZExXbklW?=
 =?utf-8?B?NzVEVnd2QTYzaGFkditEV291a3RTbjRRc0N6RzlzajQ5eE5OMFVrWXpsN3Jn?=
 =?utf-8?B?NDBoamN2RTBQUEt1cGJ2WGdCUkF4U0xXNWVZTXY1YW5QOXZkOWJxTENScVdW?=
 =?utf-8?B?T0pJVDFnd0dCaDJEUGVPVEJGK21UL2pVUmpPemx2M202Y2JGbm1RZ3dJTEM2?=
 =?utf-8?B?WG5FTU1pQ0FvZmVWQXJYcUhwQ3ZUQzlEWktkb1F0TkxWY3REWC93amlpNnpu?=
 =?utf-8?B?SXFyNWJRMGtUK3FqQzZqVzV3Skt3YUE2QnN0Qm1sN3VwQlZWN05HcmpsNEdh?=
 =?utf-8?B?enJJVXh0Wm54a09oOTBnZjFManloRnVBdTFMS1FIZFI0UDQ1TmZyQ1RPL1dP?=
 =?utf-8?B?dm56R0RUSU9zV2JFK2FZUzViWXRyQ0F3WllxNUFxcVQ5RmZBeVArM1dOb05W?=
 =?utf-8?B?Y3ArZVE1Sld4aUp2alFuMzcvclhsbUJFQ3lvWDNlZ0ZyRGpOdnNiYkkxOW1U?=
 =?utf-8?B?VVc4d2N6NWFUTFRRN05EUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUErRUVkVS9vL2JPUXR5Ym90SnBGaUIxT0tKZytHM041MWppUEl3aE5EREdv?=
 =?utf-8?B?eW5IandraWVYRHdYTU8wWjNNaStSRUpObzlHYkVQWk1aU1MrSUNad3BzYzRD?=
 =?utf-8?B?ak4vb2pWdUV1aGVLOTRzSU1CV0k5TTdERmxHb0pKeGdNcXU3VkI3YmFVM2FV?=
 =?utf-8?B?eE5LQURPWWxZMmV2L0liWk9jTkFLSG4vRW1rcG1NQ1p1a0t2QTdKRFlpYWJ3?=
 =?utf-8?B?cmwyRVk2OXFkamFOZm40RGFza0VPR2h3RTVhRTRDc1JjU3JKdllScTVVcENM?=
 =?utf-8?B?SDdWeVpsMjVkQTBSenM2VUJjdzAvRjVlZkRaZlFnUnFiVXk4V050ZGRNNzJi?=
 =?utf-8?B?Rzlsd21uaFZKNXY4MmN5QmNwTmFsSUVqdnp1cEd0OUhhdnF4OE9VUkVIUDFk?=
 =?utf-8?B?Vk96NWlpNU5adDhzYlJBN2RyZUxLWDgrdmxqS1VZMUxjaGdKMCtFRllJeDlv?=
 =?utf-8?B?U3NjUHBjZGZYRS83bFk3bVVZSERSUkpCVEd5Yy8yWlhpaFdmd1FMMUlpVVRW?=
 =?utf-8?B?ZG5YYy9GOFJWRVVUOVp2TWR5NjR4WXE5ZTZDdGkxWWZoeWI5bXAyZDZpdDBN?=
 =?utf-8?B?TThYTVJHMFZITmY5TGNhQlpncGtxQmVOSUZrZElpd0VwRVJpQUhMS0g1Yjcv?=
 =?utf-8?B?YUdzTTlnT1oycSs3U0s0Tm8yd1Zaazh6dURUaTlRZVFnM3hUUkgxZlYzUkx0?=
 =?utf-8?B?MlNNZnJWSXdiTUh5cWxqVWgyOUduMkJsSll0WXN4bGU0enFheksvVGdES1lZ?=
 =?utf-8?B?QjVtTGhIWDdHZnVZNmNGZDJLOW0raEc5TC9hT0tEcXBKaU4yTmg0Rkx6SnVv?=
 =?utf-8?B?MUF2SzJwNzdzMWx1TXUvSnAwMUlOOW1YaDRNOFNYelpuWDVhcmpieEUwQ3dE?=
 =?utf-8?B?dFg5TlZEVllDOGprRkhmNTUxWTRDczNyOHpUNnplcUEvbkM4MmgvZUtqYUVJ?=
 =?utf-8?B?bmx4UW4vTG5uNVppQlA0M2cxZjZrZnQySnJrbEpHMlFVbGlxQVhINllQUmJI?=
 =?utf-8?B?dVZuZjZCMGk1UStNMjFVbUR1ZkZVemFET2c2V21Ba1grcm9Mcmc1cWhvSkw3?=
 =?utf-8?B?ZVhkc2psMlR0eGxuUlNnaWFXYlcyQjM1YkViTFFHS1FaYUJDaER1VXN0SGp5?=
 =?utf-8?B?ZHIwSHAvMjQ3U2tML09yNitObWpMaHIvNTBRRmxaNTE4U25kSTdhb3JSWnNn?=
 =?utf-8?B?ZDY0aldDekFvZkx5Y1FlZEwzc1kycG1mUDBRaEZTaE9vZUNXZWJNdndHYldl?=
 =?utf-8?B?Smo5bGhhTGQ4L0NHUFZaYTRCbks1Z0VEMjlzTHg3TEYwUk9naGU2YzQzcjVZ?=
 =?utf-8?B?THJ2YkVUQkdSZUsxZmlPcjh4M1hoWFFIaEkxOWVhVDRMS010dlZQRGJDZkhq?=
 =?utf-8?B?TFA5WGlKbFlMTFNzUUs1WGpDRXRBaEJyUmUxL20yRW5DZDlwTU9HNUx2a2Rz?=
 =?utf-8?B?Mmdid2lBQnZPU0U3RXRucTJMdEZ6SnhxTnVXenFuV0JtMDFWNlJwOGQ1TVIv?=
 =?utf-8?B?WnFERnNZRCtOUnJjSDh2dnVNNFJDNzl1Ky9qZDBJdWRWT3IzdUYyaHZYWC9Z?=
 =?utf-8?B?TVo0YUdHTFJoTlVOOUI3bC9qQXMzKzViMUVnT0VSN2dvQXFHazJtQ3doNnF3?=
 =?utf-8?B?bytLdkJKaW1DcHlvQ3A0Y1o2TUxpUVhiK3ltbk5KekFJZUhTRDB1TE9JaWRl?=
 =?utf-8?B?eDJkWUZBUVV6VDJtVmhtTzJTOEhJcDBKcjlYUkpha0h4Vzc1TUdobjdsRTVS?=
 =?utf-8?B?RkFpclhmcEs4UEZHZVU1SGtrZG16dGcrdlUzaDlsRDRrSXNKSnVqbzRPalUv?=
 =?utf-8?B?eDFPOW1WQkJMZ1RjT0RhMjFYaFViU1MxOVpXWUJBclBrc3g3ai9ES29zMng2?=
 =?utf-8?B?L3VzeTFaaHpnZlk0ZktFQ3QxUWpBOUE4K2pmUUlqL09XanJ1QmRndjB5V1Mz?=
 =?utf-8?B?WTdPUDM3WndKdldqVEt5NjZWdm5NZ3l4d2h5UExvNk9SMnhlRklBTnF1Wkw5?=
 =?utf-8?B?VjN2aFp4djFacnh0bk1GRnZPVXh0QjlhdWZDNHY0WGFJcTN0Z3d6Mkhza0w4?=
 =?utf-8?B?Z0ZGQXlvUy8xUFBHb2NjMGxoLzZRWXJYVEd2OWliWGczMW9ISHZGZWY3Vmdy?=
 =?utf-8?B?ZEMrblRQTFBTKzVjVjVsTVBlenhOVUlQL21lMmhJelpTYlRjanl1ODhlMTQ0?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a47da188-508f-4867-ab24-08dcabc74a46
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:59:21.3906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfwBJZ/rUzM82zSmqjqRHcCBiPSEnB5EW1+yK1eLABi3/6gXpzfiwKY0qmp+wuaR7yKEarwZzCN1tUdnkm2Plw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8253
X-Proofpoint-ORIG-GUID: 6DJ9samPJuTIc_ylu0iLaw_3yee20FhH
X-Proofpoint-GUID: 6DJ9samPJuTIc_ylu0iLaw_3yee20FhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_07,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407240073

22.07.24 14:43, Jan Beulich:
> On 09.07.2024 08:05, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -5197,7 +5197,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
>>       {
>>           case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
>>           case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
>> -            if ( !cpu_has_monitor_trap_flag )
>> +            if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_monitor_trap_flag )
>>                   return -EOPNOTSUPP;
>>               break;
> 
> Why at the use site here and ...
> 
>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>> @@ -196,7 +196,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>           res->a = CPUID4A_RELAX_TIMER_INT;
>>           if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>>               res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
>> -        if ( !cpu_has_vmx_apic_reg_virt )
>> +        if ( !IS_ENABLED(CONFIG_VMX) || !cpu_has_vmx_apic_reg_virt )
>>               res->a |= CPUID4A_MSR_BASED_APIC;
>>           if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
>>               res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
>> @@ -236,7 +236,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>   
>>       case 6:
>>           /* Detected and in use hardware features. */
>> -        if ( cpu_has_vmx_virtualize_apic_accesses )
>> +        if ( IS_ENABLED(CONFIG_VMX) && cpu_has_vmx_virtualize_apic_accesses )
>>               res->a |= CPUID6A_APIC_OVERLAY;
>>           if ( cpu_has_vmx_msr_bitmap || (read_efer() & EFER_SVME) )
>>               res->a |= CPUID6A_MSR_BITMAPS;
> 
> ... here (and in yet a few more places), but ...
> 
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> @@ -306,7 +306,8 @@ extern u64 vmx_ept_vpid_cap;
>>   #define cpu_has_vmx_vnmi \
>>       (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
>>   #define cpu_has_vmx_msr_bitmap \
>> -    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
>> +    (IS_ENABLED(CONFIG_VMX) && \
>> +     vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
> 
> ... for others right in the definitions, as was suggested before? Yet then
> not consistently for all of them? Looks like if you did this consistently
> here, you'd have no need at all to fiddle with any .c file.
> 

these modifications in .c files are made mainly to track places where 
build fails and to highlight where global variables are causing a trouble.
cpu_has_monitor_trap_flag and fellow macros are used within VMX code 
mostly and don't need these checks inside of them most of the time -- at 
least so I felt.

As for those cpu_has_vmx_* macros that are modified in header -- these 
are being checked in a bit more tricky way, so instead of making complex 
conditionals even more complicated, I've integrated CONFIG_VMX condition 
check inside these macros instead.

Ofc we can proceed with only .h files modifications, if this is more 
consistent with what is planned for cpu_has_vmx_* checks in future.

   -Sergiy

