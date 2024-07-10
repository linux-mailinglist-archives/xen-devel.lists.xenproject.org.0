Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C4C92CFDE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 12:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756792.1165537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUwv-0002hK-9k; Wed, 10 Jul 2024 10:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756792.1165537; Wed, 10 Jul 2024 10:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRUwv-0002eX-71; Wed, 10 Jul 2024 10:53:25 +0000
Received: by outflank-mailman (input) for mailman id 756792;
 Wed, 10 Jul 2024 10:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O6Uk=OK=epam.com=prvs=39211ffd58=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sRUwt-0002eR-T7
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 10:53:23 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f80e65c-3eaa-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 12:53:22 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A8JUKC004888;
 Wed, 10 Jul 2024 10:53:12 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 4094gf4m71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2024 10:53:12 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB7937.eurprd03.prod.outlook.com (2603:10a6:20b:424::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 10:52:57 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 10:52:57 +0000
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
X-Inumbo-ID: 9f80e65c-3eaa-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0jCNJIEgJlLWJy26pB7px49+0Kxd7G08ouZXf6J13PeJuemVeIqH3Tuqp4M6SqA4Oxlh4uahlLEX0TVpKKeZzgxvV5ononknlivF6ajCEZrE71rIZtV4SnY1JdhfcgL2MtHR9zl2X2IGOmCAF77dVzJhpfQBw/CDJ12SnX3pmTwV+h2pt9MsmC8iyAEUJZNKq17clPNpOb5XdZe2iEPhb+NapR+1SR22BZMwrPgyOIrCubj6ZzJ2XKDpAw76oNgrRfzFk0KEVIGITihBrDq7C1qVjQc1wgclf6AlQyA9qRXvu22DZrFDPJ4h2fnm1BxXEpXnk3X7lbmdrMFciWGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cG/hD0af7YzH9upcbHKU90yuP6G01ZfmKCvSFLO0jdo=;
 b=FhAfBpNg7TYm/cLm8bvg1nkvXaHEwYnRGX48hzTX5X1YVXVOSKWsfrWjnOxB6kDb/6cPDOU19qVVgb+8TwzyKa2vV7EZyM6APqAvLFD3qxNNyFKoHJ8520TUNthwBYSpFHKt8ViBFz9/YoNcepTY83vdP8IqGU61TOCUP4iG782Uu4ifsk90+qGlmVlHZnfASalcKzHv58+s5gEzoRlEy6UwWZGbHRVbTMJVwLh4U0WUgrrDwI96dXORODmReCUikZQJ/vliem+tWN1sUaYF5gD47IN5LR8Lt0w95DWtYZQFncbG/ZMeV/fl14VSJXfJtfi4sCSKooQI5MvjPMrT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cG/hD0af7YzH9upcbHKU90yuP6G01ZfmKCvSFLO0jdo=;
 b=WBTlE/AiNcKW4VJjZrMewTVKsZvE3lNarTl0sObAQ8NL1Jrza6zwK5UT4UQ/MLYmuFtI1iSbOL9MVdwf034jyhtDajp1+LfdmzDB5WBsgi5hsjtvrXvFhB1wAT2BwUzqjBIet38KyQCWTh4xM5Vqk9YHndfj0uxzM5rSL9vQo+V70JC5Vq7hWhBa7pRthFZd4eQAWm8jdv8Ii0tJ6zbZMVFdfuDCduXVU+6hBmpLV5uYEVpzxIs7m6PTcp2LDtPYp1BRVnyWMR/RDUDvN/s5rqb0/GirRZasR28CsL8KeaFSEFviBCYxi/FeFYnK8F6zEpR4KXwvjCFUQaNP7MttbA==
Message-ID: <fa9644fe-ae7e-482b-b83b-537c947e3cab@epam.com>
Date: Wed, 10 Jul 2024 13:52:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 01/14] x86: introduce AMD-V and Intel VT-x Kconfig
 options
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <f6bfed3cd9e9fff25cbe0c5e16d8d88541be212f.1720501197.git.Sergiy_Kibrik@epam.com>
 <1d3476db-019f-4e5e-ad5f-381fe1e5b1c6@suse.com>
 <7051c9cd-4db5-4f99-91f2-eebe480ec4b4@epam.com>
 <02e9e65c-0fa0-467f-aa60-159524dafaaa@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <02e9e65c-0fa0-467f-aa60-159524dafaaa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: c19ac8d9-9898-4bf7-f529-08dca0ce7543
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K1dXR0tjQjVWZ2xYWTJjdzRlQ3d4L2xZdU41Y1hBSVVZdnZlbDdTL3Z4V0hm?=
 =?utf-8?B?ckFYR3pqODdmRTY2WFJmOU1xYU5ZSzVGOTZkS05FcndJaWdCbXV1R1BOeEJj?=
 =?utf-8?B?QWFnMm9tVnVybHBpTEpBam1QdGI2a25XRy8zaXRVbTdGMjIzNkFnU24xaHVl?=
 =?utf-8?B?Njlqa2xEVFhsdEh0eW9Yb1BCMGhSOGlDZ2ZnTkJMeFlCYXIvbmxTYm9aVTV3?=
 =?utf-8?B?NHlsOXVkRkc5eTNGZEJXYkM1c3FzeVFyK1gybmRCMWt5T1IzVTZOeG04c2hD?=
 =?utf-8?B?TkdBN3UxN3lwcGUwTERBQnljNzBKT2VNN2ZCbVJxYmozWHMzY3hxT2E4OWJs?=
 =?utf-8?B?ZFJUUWRGQ1VzbjdpSFlZbEJKM1JjRUlncmM2cnM3Z1ZqdUlkY0twWlpTRXNz?=
 =?utf-8?B?Zjc2RTJDOUR3a0NENXpDaStVVUJFRC9NRkhMd25SUGZvd25KbmxXa0xtU2FW?=
 =?utf-8?B?R0tUNFVBNGdiSStWNFp3SGpKV0MrT1ROVldYMjc3cEpCcXVDU1RISHVEd01z?=
 =?utf-8?B?UDBWT0V0NTZYZCs4Zk9vM0ZsbGE4Ry9UYVhSOWpCS1JwWDRPeGo2Q2dvcWxF?=
 =?utf-8?B?RUtkak4wWnczWjdGRDBrS2xvbUo2eTNwVE5Ic3EvdkNMQ0VRK2FQVUZDbjM3?=
 =?utf-8?B?L1hwYWVSa3lXanVzV1JZd2VzSU1Qai82VkY3cndIN0ZKZWs5QWpacTBwdGhy?=
 =?utf-8?B?V09iVVc0R1dqQ2tMMG1leXcyc01hWXF4OU94MkpRcGZPMGlFVXVwSlBpRDdW?=
 =?utf-8?B?R0ZTeEszRExROXNNNFoxRERVWjZCMkNtOCs0eVRuS2pVVXhkMk9aRml3YThF?=
 =?utf-8?B?SFJON0xWdWYxemJZWDYxb3RlZXE5Y1YrSlZLVi9ydExnYktWUHR2MUhqZHBW?=
 =?utf-8?B?SjMwUXBpY2J6eDQ4OFp4K3czSVpSU0hGZTlxY040MUh4QndCWFNaSGwwZDYz?=
 =?utf-8?B?RVVtUlNubWh2OElHbS9ZSVpMODZaM2x5elRKdmlUMWtUYVBBZis3ZGhDbk9H?=
 =?utf-8?B?L0xSUERuRVp2NTlSb1ZPV0N6eEVROTBPY3JkSWZkclJuNERsM1o3cWovVUdz?=
 =?utf-8?B?eVFhSFp3NUQyckFGa0pzWjZGYmtNQzVZaC93RmhGR0JIVnJMUmpJNWdLa2NJ?=
 =?utf-8?B?VUhhTnJza2d6MFRXdnNkSFBDWS9VZ2xHRkRydFVqVnEvNDVUQldKNWtJVS9h?=
 =?utf-8?B?SDIxR3VHLzFSNndXSXQ2VENHcnNQZlpLd3Z5bzBpTmFYUW5RVmxRdXlBWDlB?=
 =?utf-8?B?dWYwMHU5dXhHMlpCQ2M4a2Yvd2Z5RUFwM1laWms3amMvSzhxSlM0dDFxOTZZ?=
 =?utf-8?B?Wm1LWWRLczE3V0NUbm1wOStmM0o3cktXZEpNMmtXOVBCYVNLMW96SERpSENX?=
 =?utf-8?B?dGpwLzRLampGOXFINzVWRmFGVGlxY1p6aHh3YjhhZzVYWGlmOGNiaWRVdW9y?=
 =?utf-8?B?ZTNsOCtWZmtzb1JaL0N0Z1hTSGp6dUl4aGF3VUdITmtqVlFhNkNyR0g4ZllK?=
 =?utf-8?B?OTdmY1VrUWtzcEVSTmVkSCtRSmt2TEcyTmJlVG02QmFxWEd4czRpRSt4ZEpw?=
 =?utf-8?B?VXhSSk81TTU4blZOYWhFWHN6eURObWJ4UFd3cnN0K3pXTFVGd0RHcjRuSURE?=
 =?utf-8?B?QlY5QjVld3RSdWZFbTNNOGxNRk5FMnVSTVcvdXdVREh5d2xhUkZXc015emp4?=
 =?utf-8?B?QzlZYzdzd3dlSmo2WU0wRG5WM25VU3g2UUZHOGJqTzVJTjdHNDEzdmRRbGhS?=
 =?utf-8?Q?Th4+2iaVCNUdVDwVAo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UXF3MjRCc0NVWmg1VFg0c0N2Z1F4TlZVYlcvMGpSamI0RzlSNFRSYTlSTWtk?=
 =?utf-8?B?eEJtMlpTWG9VU0FmSFhaYkRSa3NuV0JsQXJEemg0cDZGNEtVQUVkWjQ5QWpL?=
 =?utf-8?B?SHE4UjFHb3plSW02ZHlBQzIxVXFIMFZ2R09OVXVNd3pjZkpNUUtXbFdORnJG?=
 =?utf-8?B?cVRZSDVHSEJTVmZ2VkpjS01oRDM2Z0hxZEExUWdkUnZOZEJmMTc1ejI1NkVV?=
 =?utf-8?B?ZmxaKzNrNDVjM3REam5HR1pObFRWMlNTSWNqVHIyeEllaUlnd2xyOWpLSkxX?=
 =?utf-8?B?MU1iRWs3azVBRS8vR1hTb2pyNmZzYjBJRlZ3Y214eEllUXFiMFVrRXdpdjN5?=
 =?utf-8?B?Z0ZnYUhVVm5HOHRoN0hwUjU3UHFmWkFqbWdmOWJoNmIzdTdLL1ZXSGpsUGtK?=
 =?utf-8?B?L2JETklaUWROTWlBOHZLaWtTcm1sTFFQaU94bGRrOGpMSlptUFNzMVdSeThF?=
 =?utf-8?B?OFNTc2RtVUdieVRxbnNRQUFidHY2OEtsRDFkYm0vY2JlakxVZGYzT2dPTU93?=
 =?utf-8?B?Y2NpMFE1cllHa0NkL1BGMTZ4WkhJd2l6djE3TjNvM0ZKRVF5QnpmdFVUZW5i?=
 =?utf-8?B?RjViQm9xb2p6ZjZtbldrZ3FaNEpWZmFXWi82WDZPOEJvQW56SWlKeVF5R1Ru?=
 =?utf-8?B?QkpLV1I0WWJkQXBXSnVjdnl1b1l3TlBUb05yNDRRYVNRblFWcXJNZ3Z2R25U?=
 =?utf-8?B?NUF1RVpsNURrY1dhNUZURWQrT2V1OVJlQ1hBT3piV1FiOWFCMGRsREdESEFI?=
 =?utf-8?B?ZjUrUkFUdnczOXMzMEp0dUZNajdmZEpEemMvU0xLSjBUalFoaFFnUXIvWGpO?=
 =?utf-8?B?MWpqMitIVjhLZVNyZU5KeExXekNJNThDLzJOUFNmVlVrL3NqMmFrajRndlNB?=
 =?utf-8?B?TlZrMFpLZzRxSXMvS3lSTGV1ZnNjZVJPcWNpZXZFQmhINXVXcWY0T3NjMjEy?=
 =?utf-8?B?L09Od2NrQUtWOTJBT05xRTdYQ1RWNkVJbEZSclh1WVRLOHhsakE2Y05pN1h1?=
 =?utf-8?B?TmxraUlSMWlsMFFiY2dUVml0VmdFUjc1WTJzbng0MVdvVlZIcVNTSnA1Q3FU?=
 =?utf-8?B?dkF5WVl1Szl5V1pYWklXZEY3TmRnMjk2WnZhem9JdkZVNFFLNmdWamlhRzJS?=
 =?utf-8?B?QjUvbzY4OHl4ajc3VnNsT2VEOXlJaDFvSENMSnpocjJTQXFNdzV6L2RxdGJk?=
 =?utf-8?B?N0dGVE10Ny9yZjBxbmE4Y0R1M0dCZ2Y2Zk5vVFlSNzhnRncwWm04VFcrcUVq?=
 =?utf-8?B?aWlVSU1vU2luOWNubm85clB1L0h3S24vTmt5aVB0RExrbW9yZU5LZ1QzZFdM?=
 =?utf-8?B?QlpHRFVrVWhxR0dSZVNhNDFVR0hjOHRCdUhRM1dTMGhyUHZYNSsrQ1A1clBC?=
 =?utf-8?B?WlpWd2J4Tm92YUd2NWNSM0RaOEJuaE5seTJGSGZJWm56M0h6ZXBnL1psdHNJ?=
 =?utf-8?B?czE1WXQwVGk0SnNsTEw0VitKdHBQc1FvTUFLTU1KQ09yTFp1WXo5cVZlSVJt?=
 =?utf-8?B?ZTJtS0E0VXl0dThoell0SGR1YUdtNndiV1lQZ2JPTVRDczhRZ0kzTTJLenkr?=
 =?utf-8?B?ZkIrWVNLaC9ML0JieklkaFFVSE9lYjBrczE1ZDk3STF1RnlzQzlpRUNLVU1l?=
 =?utf-8?B?azgwNlY1QW1iS0gyQXpwQWlBQlB2TFl6MlYzYitYS1Zpd3hJU1JwTjdFdUsx?=
 =?utf-8?B?V1k0RC9xQUZhZGdYcUdzYVhUbjByd0RIcmtnV1lSclFnNFlnRVBIT3hsYzJv?=
 =?utf-8?B?dkUwbitNN0NjdFluNFdjM3gyekljMVJ5d3Mydi9sKzRrSklCSWg4c3k1SFpN?=
 =?utf-8?B?VDRiQkxvczhGdzlKT3YveGg5aUpjeE9DQS9MMk5lc2l5Sjk2aC8rb3NoVGFU?=
 =?utf-8?B?c0pOWGpVMWIzUEhESzYraGhDLzRycU03QXAzMDhVa0ZRWmxPbFUxRUFORGk1?=
 =?utf-8?B?TGVjSW84YWRXeVNVdm05RmlrOTJJdm1MMUQyTk5IMDAwM2xJQVlWMGZwWGdD?=
 =?utf-8?B?eXJvUlRqeTU4eTZSVVR0WVhxVFBlMXNQUGNyS3dwVWF6QnFUU0RzMDB0OG1H?=
 =?utf-8?B?L096V0oxY01ZQjdTTGE3K0VWVXRxZ2NmcHNIVncySjZJYjgyekFVT1F2dktG?=
 =?utf-8?Q?hAroEuqQS7PJQ1TuaT4i/Yhc7?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19ac8d9-9898-4bf7-f529-08dca0ce7543
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 10:52:57.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQaKIQcLmrdyqyqyvgMfmhvPt2h8GDlvVA2du1h5TfinS5oMDDi6s+0Biyj0jLAv+iaielibR9Rn+zTaKk54Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7937
X-Proofpoint-ORIG-GUID: ns-Qk1P_KR9ut_bhukw82gTh1PIlNsMM
X-Proofpoint-GUID: ns-Qk1P_KR9ut_bhukw82gTh1PIlNsMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_06,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100075

10.07.24 13:28, Jan Beulich:
> On 10.07.2024 12:21, Sergiy Kibrik wrote:
>> 09.07.24 10:11, Jan Beulich:
>>> On 09.07.2024 07:45, Sergiy Kibrik wrote:
>>>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>
>>>> Introduce two new Kconfig options, SVM and VMX, to allow code
>>>> specific to each virtualization technology to be separated and, when not
>>>> required, stripped.
>>>> CONFIG_SVM will be used to enable virtual machine extensions on platforms that
>>>> implement the AMD Virtualization Technology (AMD-V).
>>>> CONFIG_VMX will be used to enable virtual machine extensions on platforms that
>>>> implement the Intel Virtualization Technology (Intel VT-x).
>>>>
>>>> Both features depend on HVM support.
>>>>
>>>> Since, at this point, disabling any of them would cause Xen to not compile,
>>>> the options are enabled by default if HVM and are not selectable by the user.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>> ---
>>>> changes in v3:
>>>>    - tag added
>>>
>>> And then removed again in v4? My prior ack stands, but - as before - conditional
>>> upon us being certain that we want to go with the ambiguous ...
>>>
>>>> changes in v2:
>>>>    - simplify kconfig expression to def_bool HVM
>>>>    - keep file list in Makefile in alphabetical order
>>>> changes in v1:
>>>>    - change kconfig option name AMD_SVM/INTEL_VMX -> SVM/VMX
>>>
>>> ... result of this change (firmly ambiguous for SVM, latently for VMX).
>>
>> I've put my thoughts about naming in the series' cover letter, however
>> I'm not strongly preferring current naming and if it finds no advocates
>> I'll rename it in next series.
> 
> Just to clarify: Did anyone ask for the name change done in v1? If so,
> maybe that request cam with some justification?
> 

yes, that request came from you:

https://lore.kernel.org/xen-devel/e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com/

Though I understand that a lot has changed since v1 was published, so 
original concerns about vendor names may not be valid anymore..

   -Sergiy

