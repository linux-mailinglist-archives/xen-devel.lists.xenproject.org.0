Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE99D91A2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 07:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843349.1258963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFoeg-000398-OY; Tue, 26 Nov 2024 06:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843349.1258963; Tue, 26 Nov 2024 06:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFoeg-000368-Lo; Tue, 26 Nov 2024 06:02:34 +0000
Received: by outflank-mailman (input) for mailman id 843349;
 Tue, 26 Nov 2024 06:02:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/G6=SV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tFoef-000362-DQ
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 06:02:33 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20613.outbound.protection.outlook.com
 [2a01:111:f403:240a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03f7a432-abbc-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 07:02:28 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Tue, 26 Nov
 2024 06:02:21 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 06:02:15 +0000
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
X-Inumbo-ID: 03f7a432-abbc-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwYTo6NjEzIiwiaGVsbyI6Ik5BTTA0LU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjAzZjdhNDMyLWFiYmMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjAwOTQ4LjQ5NTE5NCwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=us4jKhQhoQTsh/fzNumeyx/XsUsVrh5uYPhu156IymuDEfAoAjw5EX0vvRTDvGhk05p5ICTqRmQNlr1hH/wk2EZ9it2DIhnxfX/YDBWi9Ixt+kaNJ1+JJh5DNKM8mmCIbd9QPzSLOb2O/C5p41VGqbJMqMKX2UoYB3OgRhzSaoGASx02DoVH1AyoBVvCRJKqiih56kHxQwQhfDPrKkqNdRFmNpO3xHQtLEZwHyc1cXdhdk7IKHXYPxSeKxc2WERx6uw9x4cGmYVmvUFcK16N3EUFlmpVkPPUgqLS4UyBJuf0btWeckZm1Qyp81VUvk60PzcrI1jcJJkZCUea8bkrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9k6LndSu4habBBfWJ6W15Wke6T4UEitBbqEMtaU284=;
 b=cBgtFjQejrZMWXkc7VyedohVEPaGOXsIgt6W0V0oF+vprac15cF+bXGceGFuHV67KHwnZHYRoBJ63uNXdyLeEzrnzyOG5X3iW3tFoU2ISMudN+IYz7UMrUbkvpxhKbW1Zymknnpwi5I1qgzWa4i6G9xJTRfYbHKHrijW8YwKt1bIdBDw/gQeAmmB7M4sKSXeraGkf4h/GIbnJ0TjMQKQlVLxvB58V0/GetYw2X0GzNMOwhoHuhNU9GHAASyUlOSBNOcf2vqbQCIfeG6QPqIpLgwDuD1QEGxx/Og9t7eItOpX5vj49xYi7AdD4nRBc7QXIKvz8n+wp5zLMKjCGDeYtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9k6LndSu4habBBfWJ6W15Wke6T4UEitBbqEMtaU284=;
 b=R4kPA/wqsOSxGdv3t/ac/d8FPtTiX11OZhRGmg7m2i6lTfCCmFyIygXIjPcSBQ5Yti4t9JaVUabsj2T5LRIERBfZdIoZFgQ7kjr8j/AzN3D5UBoBBxS8sDcvAcH2BRUNTM0982FSzLRSMnFs9ZACWSTuG6OXLB4cycRC2IQe7zA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index:
 AQHbNaIlMxf8mJcywkeNRFmHEai1qbK08gcAgACKfwD//4ZQAIABzRcAgAAfLACAAB0/gIABIxcAgAAMOoCABNwTAIABfwWAgAFxTQD//+JeAIABss4A///tiAAAzKybgAACnTYAADSCfYA=
Date: Tue, 26 Nov 2024 06:02:14 +0000
Message-ID:
 <BL1PR12MB5849B85C116A74D138FF65AAE72F2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz2lgkjgRoZ7Sr5Q@macbook>
 <BL1PR12MB5849F5382CF3A03C080C4CA4E7222@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Zz8Cwj3KJ1BIBEg_@macbook>
 <BL1PR12MB584977971D2C0A00443A1A79E72E2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z0Rx2IXqqvrLaIIq@macbook>
In-Reply-To: <Z0Rx2IXqqvrLaIIq@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8182.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB8826:EE_
x-ms-office365-filtering-correlation-id: be1b0a0f-0b98-46a4-fd32-08dd0ddfe05d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c3VSTkR1dU5MVHhzUzV0RUJYcDNWMDZ1NStiazhyZ1BIcnlIdllzWE9CTFhJ?=
 =?utf-8?B?YnJRNGxxMG12MkpYUHJDbkxZVUxrNXFWaHN6SGdLRFhXU2V5NFhXZ0VGSS9k?=
 =?utf-8?B?aFBRNVp4c2hzaUQ4OUpKUDhzNUMwdUVqZ3M0VHNLOEhFNW5MOWdXdjZHNlJY?=
 =?utf-8?B?elczQTAyTXkzSjRGekU4M1VBUko4OUJMWmVqbW9yRHV3YWFzNkdPcGFKeldO?=
 =?utf-8?B?QmhVMmNjTFo3ZTMwRGFUb1p2NStGVVRnRGhUcURFS2ptWW4xSzlaVEhXVzhW?=
 =?utf-8?B?eEhjNDVGV243em5PaFdBMlVGOHg1aVRQK3BXUkFnYTlkMnBWaGVqd1cvNW02?=
 =?utf-8?B?UzdBT3RuS0pPUkx6QnM2bEpjSFBiS3FVNmF3dG1lVmxjNFcxTTNzK2hFSFF1?=
 =?utf-8?B?UWk4YW5tWUZXTTE5amEzQWV1WDNhTXZseEhDTGduSzZxV3d2ZGFmT0JIei8z?=
 =?utf-8?B?OG9BOGsrMzdRbENJVmVHMklFZzlLWkN2ZDdCUENQOHBtR2tBV21WZzNrN3hD?=
 =?utf-8?B?SHpaZDlpTnozTVlmSWYvSm92MzVGR0RZcHU4UDVhazNjb0srYjMrNFQ2ZFNi?=
 =?utf-8?B?Y0tncWppOS9hTnA4Y3ZhUjYyK2V2dW9hSC8wTFBHQzJZWW5xRmRiTkFyN3Vq?=
 =?utf-8?B?WkNXWTB1cEo4QmJTMkdTWGt4K1dTdXVIakFobktaMlIxVE5MeEl5ZE0ydUdk?=
 =?utf-8?B?RzVoTDZ0YUxqOFF3M3lTRG1PNlF3U29BZTh6Uk9zUlM5d2cwYktudGFpeDNz?=
 =?utf-8?B?R3VJTjVFeWpyNzdhR3lJZm9FSi9FN244NGpVelo5VDRVVFhKazlmN3MraDkx?=
 =?utf-8?B?LzdTTmgyLytEV3FoalRER2xPRUhQY3FlWnJhNm9iaXpZZkk1ZVNlN1AzWldD?=
 =?utf-8?B?WjNLU1RMa1FFYUhneDI5cHhtdmwxOW05ZFdHZW11VjNZZk0rYzk0M0lqN09j?=
 =?utf-8?B?MUVtbmRhU2EvTDdqblFiSzk3d3RkZGZDREZ5WGdhQ3VwRmVqYm9jWE5OUmZF?=
 =?utf-8?B?STVEYm8vZHZuQjNTajFkK0xSTWU0Umd3ZGl0bGx4S283RktrcWNxSGt3emFs?=
 =?utf-8?B?UUM5Qk9kQnNEczVmdHR2cmwya3hkQ1Z6eW5PTWI2QnVYcEZmUk9rdXp1cDg0?=
 =?utf-8?B?NUNrKzJkSE9iYklUS3hnT3JmNzJHL0ZWYnBGcGpZRjJueFQ1MlJoVE8rVjlD?=
 =?utf-8?B?OU1MSnBxR25MMHlpOXVFc1F5b004dkFCYjR5T2ZCbk50T0tDbnFmbmdDNjdt?=
 =?utf-8?B?ME53d0xuMVFBNHk4YVhHNTJMMXlFTXFiazJxNm8xdG5WbzR4U2FtOFJ4aGNY?=
 =?utf-8?B?RzhmN014a3FOMTNUeHdFQ25jb2taTGhUQTV4cVcxazVNYWpYQkszU3BBWk1h?=
 =?utf-8?B?YzIyMGdMNnYrQmw5U2tocTg4d2RHVGFoM0Y3ODNQazRXTlRjWHpnSUJDSFlj?=
 =?utf-8?B?Y0hnQ2VqWTA5RmhZVGRTS2NjQnYzeDZWRk9wV1JwOEM4aDFmUHNGcElzMjY3?=
 =?utf-8?B?UVYyTHA1Tlk2N0RpUHBjeERJcmVxenp4clRHYjZnaFN1RUd6RWlhVlg0YVlt?=
 =?utf-8?B?cU16eEVteTl4QWlkVTIzSzFqVFN4Zmx3WUN3WHE2R2J1RElWTWFOUlF5RWRv?=
 =?utf-8?B?UmVRWmVPNFhBV1g0djNuTDFNZ3RLUkdaRG1jeFJWc3JZNk9xNHpRNDdCNFlR?=
 =?utf-8?B?cnpyeE0vOCtjSmZpRitJTGEwTjZNcG53SUFQb1hBNWo5UTJBOHFTMXcvWEVC?=
 =?utf-8?B?UWhzY1g3MmcrNEFjakJKU1JSM1EwQjdENE4rL2JLcm1IQ3E4OGp0Qk9kNTF4?=
 =?utf-8?B?VTl0VVFHT3cwcW8zRlBNWmFuWXRXa25aSDhDMU11Qlg5UmtxNml2RjYzNVNl?=
 =?utf-8?B?QUN2eVd6aHFKTkVlVU81R3U2MXZUNmVydHd2WGg4UnAyc3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RE1WY1Ixamd5OXk2aGRuWmpyZGdYM05za1lqanc5MUhPaG9EUWNKNGp5MUxq?=
 =?utf-8?B?MUxOMk94ZlZ5S1MrdmdaSWpnNmZWRjBxamJwNmJWMHZYM1RDQXFVSU4rMDdj?=
 =?utf-8?B?U1o2b3ZJUFZvWE9ldytIMGQ5N0srSTFJQkVEaVhoOXg5aTlPL1Q4VGtyVnRq?=
 =?utf-8?B?Q1ZGZ1dFZzJYcmxCRzR3dVIrQ1FRQ2NuVjJBTm5sQlkyU0p5Z0ZwOWhQTkxz?=
 =?utf-8?B?dHhYbHFHRVJuTENxdThJQTZHaWEwbTRwYWl0TytINDdQRjBENHE3Y3JwY3Zz?=
 =?utf-8?B?ejRyWWgrZGZ4dUhOMmNKSHc1RWQ5ZS95bkRNVGdXNDZtdWJNUXRWQk1XZTND?=
 =?utf-8?B?Skw3NlltZVRmWVhIU2dTbEVONVZTaDVVM2xMODlFZEF6a1lHblF5T0VuS2pW?=
 =?utf-8?B?NXhaOUd3dEhmRHpVd1ZWTEFrNExlMmRWYXhBK3E0Y1hBQitiNHFmeEY2dXVp?=
 =?utf-8?B?Wml6VXovaEMra1kxa0lPUi8wYUhIbDlmZGhrazgvTGdmYkJmdk92bVhKUm9p?=
 =?utf-8?B?VlNla2tlQjhXOFNtcXBsR3kwTURhWnlMWFJMRS9XRlpCL1IwYVN1V2hvY2hU?=
 =?utf-8?B?UmJDcDQyQXJkZUpLOHpzS2xIWG5NdU42cUlkRTNkNWxpV3pmbWxCM0k5S0hv?=
 =?utf-8?B?UGhzZmNuYzdXS3JTSTRuck5WTXBwRDB1bWVHdmt0Mm9qd21TRXRBNHliMjZz?=
 =?utf-8?B?eDhPTHgvT3FrZEtsOTJqT2h5WmZpc2M0eHIycGJNcVEyTEVJZmpBYStvcCsw?=
 =?utf-8?B?c254MDRURzdFNGpuc0RmcGFmWm81N3pKamJScXkySUgwU1pOeExkRFBZRkcy?=
 =?utf-8?B?UDZhZTBkcTdIcEVWWDhybWZzY0Q0Vkl2RThNMVp5aHBHMXczUTFLcER2RjBG?=
 =?utf-8?B?dnhWS25vVEZpcjUyQW1aanVZTHArWVFURHM0eHl5Q2lJL1BEaUJXaFZ4aE0y?=
 =?utf-8?B?L1hBSHV2U2FVNU5WUEo0SXFpWTQ2WFo0SlQybm1KbGlWTElPMHJETWZzbFdk?=
 =?utf-8?B?YmUzVkJISmxEaWtzL0M3Q3lhVUMvbGdZQnhiMjEramdYRnQ1Q2lhOG9PRVlC?=
 =?utf-8?B?UHkzNFBROG1GOWpzOE9LcUhvSTJzbzgvRjJlUDgzL0lReFA3VFZCMXJzWkhC?=
 =?utf-8?B?clM4YWJCc29PYkxUWWJCSVNmSHBlcFlOQjVUZkNsTWE2bWwzRnZ3SFhhbzRU?=
 =?utf-8?B?YXl5NWppaWhQMkJwbldmQTR3enUrcjYrWUxGQy9TcnJkaGRKMHpWclJ6QzBz?=
 =?utf-8?B?QmtSeDl6Vk5HN0tybHRCNEs3a1lEVzA1a0NZY2Nza3NiQmhzNTJoRGFUdWE3?=
 =?utf-8?B?SWtZZ2xCaEFvMVpxOC80RldCa2JiZnFya2krQ0IwdGpyVjRDTkNQVWV3NzBa?=
 =?utf-8?B?YnFQWS9vMXBrK25STWRaOVF5MWp0QW83Mms2NjVDK0JMV3I5MW9OZ09hSmRM?=
 =?utf-8?B?Qk9GUDhORlV5cmx2TFZKNllaYm5TYnNjU2lPbDBkd3dRdGlndmtqTW5UdXk2?=
 =?utf-8?B?QXdtbC9IeG9rSlB5a0g0Uk5SNEpCOWloUFppVjl3R2RnZXVDci9BbmxLS2oy?=
 =?utf-8?B?RTZERWhFNWtEaGFWaW9mb1dmMm8yMnB4bEZvUVJIZlZpVm8raFhEandlbW5y?=
 =?utf-8?B?UU5TMHhuZ2dlcUVLOHc2SjdUTXkxZWNncTNSM2ZYWng5WUQxNnZNd0V0ME11?=
 =?utf-8?B?U0ovd29XOGZKS1hrc3pKUlMvdWdyV2lmOE1XZ29maGtXa0ZsS1RDa1R5enA2?=
 =?utf-8?B?eXhGcnppZWhmK1ppc05SZENveDlkczZnY1V3WkN4Sk93NGs2TU5QbEtZeEhj?=
 =?utf-8?B?VGpHUWtsT1RpdGNYNkh1azVLZDY1d2U2a216ZC82bE1neUpTQmpJd3c4V2tn?=
 =?utf-8?B?RkFBdmFyQkRCVHpVWUNpMEt2UzdGd0c1UjdVUVIvVkljY0xMOFJKU3lFRjV6?=
 =?utf-8?B?bDZ6WlR4aU9rM3k4YlYxaGxJMEg5U1h0NnA5VGNhK1NCWHFmeG1ZemRUWmw4?=
 =?utf-8?B?OFJRM1VZRWkwaGtUNkJPd3VLRFpaK3VTbHYrclpOZCtIZno3SXhGOXRZRjZN?=
 =?utf-8?B?ZjhaaVdzU0h0WmhFSWxGVlV3Sk5BR0U4eGlVbnMvNFA1N1lmSUQ2SzNCVWFj?=
 =?utf-8?Q?/iGQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C506A226D31844E890A3B906186B77E@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1b0a0f-0b98-46a4-fd32-08dd0ddfe05d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 06:02:14.9024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrhlfGTxB9ngQWVFkVGor1mYdRJNE8m7pzagebiBMi3q1blblGKzVEy3hzntxdD2KOiM+2T1h8PczIUEd8meQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826

T24gMjAyNC8xMS8yNSAyMDo0NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBO
b3YgMjUsIDIwMjQgYXQgMDM6NDQ6NTJBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4g
T24gMjAyNC8xMS8yMSAxNzo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUaHUs
IE5vdiAyMSwgMjAyNCBhdCAwMzowNToxNEFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+
Pj4+IE9uIDIwMjQvMTEvMjAgMTc6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBP
biBXZWQsIE5vdiAyMCwgMjAyNCBhdCAwMzowMTo1N0FNICswMDAwLCBDaGVuLCBKaXFpYW4gd3Jv
dGU6DQo+Pj4+Pj4gVGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIG91ciBtZXRob2RzIGlzIHRo
ZSB0aW1pbmcgb2YgdXBkYXRpbmcgdGhlIHNpemUuDQo+Pj4+Pj4gWW91cnMgaXMgbGF0ZXIgdGhh
biBtaW5lIGJlY2F1c2UgeW91IHVwZGF0ZWQgdGhlIHNpemUgd2hlbiB0aGUgZHJpdmVyIHJlLWVu
YWJsZWQgbWVtb3J5IGRlY29kaW5nLCB3aGlsZSBJIHVwZGF0ZWQgdGhlIHNpemUgaW4gdGltZSB3
aGVuIGRyaXZlciByZXNpemUgaXQuDQo+Pj4+Pg0KPj4+Pj4gSW5kZWVkLCBteSBsYXN0IGd1ZXNz
IGlzIHRoZSBzdGFsZSBjYWNoZWQgc2l6ZSBpcyBzb21laG93IHVzZWQgaW4gbXkNCj4+Pj4+IGFw
cHJvYWNoLCBhbmQgdGhhdCBsZWFkcyB0byB0aGUgZmFpbHVyZXMuICBPbmUgbGFzdCAocG9zc2li
bHkgZHVtbXk/KQ0KPj4+Pj4gdGhpbmcgdG8gdHJ5IG1pZ2h0IGJlIHRvIHVzZSB5b3VyIHBhdGNo
IHRvIGRldGVjdCB3cml0ZXMgdG8gdGhlIHJlc2l6ZQ0KPj4+Pj4gY29udHJvbCByZWdpc3Rlciwg
YnV0IHVwZGF0ZSB0aGUgQkFSIHNpemVzIGluIG1vZGlmeV9iYXJzKCksIHdoaWxlDQo+Pj4+PiBr
ZWVwaW5nIHRoZSB0cmFjZXMgb2Ygd2hlbiB0aGUgb3BlcmF0aW9ucyBoYXBwZW4uDQo+Pj4+Pg0K
Pj4+PiBUaGlzIGNhbiB3b3JrLCBjb21iaW5lIG91ciBtZXRob2QsIHVzZSBteSBwYXRjaCB0byBk
ZXRlY3QgYW5kIHdyaXRlIHRoZSBzaXplIGludG8gaGFyZHdhcmUgcmVnaXN0ZXIsIGFuZCB1c2Ug
eW91ciBwYXRjaCB0byB1cGRhdGUgYmFyW2ldLnNpemUgaW4gbW9kaWZ5X2JhcnMoKS4NCj4+Pj4g
QXR0YWNoZWQgdGhlIGNvbWJpbmVkIHBhdGNoIGFuZCB0aGUgeGwgZG1lc2cuDQo+Pj4NCj4+PiBU
aGlzIGlzIGV2ZW4gd2VpcmRlciwgc28gdGhlIGF0dGFjaGVkIHBhdGNoIHdvcmtzIGZpbmU/ICBU
aGUgb25seQ0KPj4+IGRpZmZlcmVuY2Ugd2l0aCBteSBwcm9wb3NhbCBpcyB0aGF0IHlvdSB0cmFw
IHRoZSBDVFJMIHJlZ2lzdGVycywgYnV0DQo+Pj4gdGhlIHNpemluZyBpcyBzdGlsbCBkb25lIGlu
IG1vZGlmeV9iYXJzKCkuDQo+Pj4NCj4+PiBXaGF0IGhhcHBlbnMgaWYgKGJhc2VkIG9uIHRoZSBh
dHRhY2hlZCBwYXRjaCkgeW91IGNoYW5nZQ0KPj4+IHJlYmFyX2N0cmxfd3JpdGUoKSB0bzoNCj4+
Pg0KPj4+IHN0YXRpYyB2b2lkIGNmX2NoZWNrIHJlYmFyX2N0cmxfd3JpdGUoY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYsDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWludDMyX3QgdmFsLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqZGF0YSkNCj4+PiB7DQo+Pj4gICAgIHBjaV9jb25mX3dyaXRlMzIocGRldi0+
c2JkZiwgcmVnLCB2YWwpOw0KPj4+IH0NCj4+Pg0KPj4gSWYgSSBjaGFuZ2UgcmViYXJfY3RybF93
cml0ZSgpIHRvOg0KPj4gc3RhdGljIHZvaWQgY2ZfY2hlY2sgcmViYXJfY3RybF93cml0ZShjb25z
dCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IHJlZywNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgdmFsLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkYXRhKQ0KPj4gew0KPj4gICAgIHByaW50aygiY2pxX2RlYnVnICVw
cDogYmFyIGN0cmwgd3JpdGUgcmVnICV1LCB2YWwgJXhcbiIsICZwZGV2LT5zYmRmLCByZWcsIHZh
bCk7DQo+PiAgICAgcGNpX2NvbmZfd3JpdGUzMihwZGV2LT5zYmRmLCByZWcsIHZhbCk7DQo+PiB9
DQo+Pg0KPj4gSSBjYW4gc2VlIHRocmVlIHRpbWUgcHJpbnRzLCBpdCBjYW4ndCB3b3JrLg0KPj4g
KFhFTikgY2pxX2RlYnVnIDAwMDA6MDM6MDAuMDogYmFyIGN0cmwgd3JpdGUgcmVnIDUyMCwgdmFs
IGQ0MA0KPj4gKFhFTikgY2pxX2RlYnVnIDAwMDA6MDM6MDAuMDogYmFyIGN0cmwgd3JpdGUgcmVn
IDUyMCwgdmFsIGQ0MA0KPj4gKFhFTikgY2pxX2RlYnVnIDAwMDA6MDM6MDAuMDogYmFyIGN0cmwg
d3JpdGUgcmVnIDUyOCwgdmFsIDEwMg0KPj4NCj4+IElmIEkgY2hhbmdlIHJlYmFyX2N0cmxfd3Jp
dGUoKSB0bzoNCj4+IHN0YXRpYyB2b2lkIGNmX2NoZWNrIHJlYmFyX2N0cmxfd3JpdGUoY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCByZWcsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQzMl90IHZhbCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdm9pZCAqZGF0YSkNCj4+IHsNCj4+ICAgICBpZiAoIHBjaV9jb25mX3JlYWQxNihw
ZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCkgJiBQQ0lfQ09NTUFORF9NRU1PUlkgKQ0KPj4gICAgICAg
ICByZXR1cm47DQo+PiAgICAgcHJpbnRrKCJjanFfZGVidWcgJXBwOiBiYXIgY3RybCB3cml0ZSBy
ZWcgJXUsIHZhbCAleFxuIiwgJnBkZXYtPnNiZGYsIHJlZywgdmFsKTsNCj4+ICAgICBwY2lfY29u
Zl93cml0ZTMyKHBkZXYtPnNiZGYsIHJlZywgdmFsKTsNCj4+IH0gDQo+Pg0KPj4gSSBjYW4gb25s
eSBzZWUgb25lIHRpbWUgcHJpbnQ6DQo+PiAoWEVOKSBjanFfZGVidWcgMDAwMDowMzowMC4wOiBi
YXIgY3RybCB3cml0ZSByZWcgNTIwLCB2YWwgZDQwDQo+Pg0KPj4gVGhlIGNoZWNrIHByZXZlbnRl
ZCB0aGUgdHdvIHRpbWVzIGluY29ycmVjdCB3cml0ZSBhY3Rpb25zLg0KPj4gICAgIGlmICggcGNp
X2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIFBDSV9DT01NQU5EKSAmIFBDSV9DT01NQU5EX01FTU9S
WSApDQo+PiAgICAgICAgIHJldHVybjsNCj4+DQo+PiBBbmQgd2h5IG15IG9yaWdpbmFsIHBhdGNo
IGNhbiB3b3JrIHRvbywgdGhlIGNoZWNrOg0KPj4gKyAgICBjdHJsID0gcGNpX2NvbmZfcmVhZDMy
KHBkZXYtPnNiZGYsIHJlZyk7DQo+PiArICAgIGlmICggY3RybCA9PSB2YWwgKQ0KPj4gKyAgICAg
ICAgcmV0dXJuOw0KPj4gaGFwcGVuZWQgdG8gcGxheSB0aGUgc2FtZSByb2xlIGFzIFBDSV9DT01N
QU5EX01FTU9SWSBjaGVjay4NCj4gDQo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIGZpZ3VyaW5n
IHRoaXMgb3V0LiAgU28gaW4gdGhlIGVuZCBpdCdzIGEgYnVnDQo+IGluIHRoZSBkcml2ZXIgdGhh
dCBwbGF5cyB3aXRoIFBDSV9SRUJBUl9DVFJMIHdpdGggbWVtb3J5IGRlY29kaW5nDQo+IGVuYWJs
ZWQuDQpZZXMsIEkgdGhpbmsuDQpEdXJpbmcgZHJpdmVyIGluaXRpYXRpb24sIGl0IGNhbGxzIHBj
aV9yZWJhcl9zZXRfc2l6ZSB0byByZXNpemUgQkFScywNCmFmdGVyIHRoYXQsIGl0IGNhbGxzIHBj
aV9yZXN0b3JlX3N0YXRlLT5wY2lfcmVzdG9yZV9yZWJhcl9zdGF0ZSB0byByZXN0b3JlIEJBUnMs
DQp0aGUgcHJvYmxlbSBpcyB3aGVuIGNhbGxpbmcgcGNpX3Jlc3RvcmVfcmViYXJfc3RhdGUsIG1l
bW9yeSBkZW9kaW5nIGlzIGVuYWJsZWQgc3RhdGUuDQpJIHdpbGwgZGlzY3VzcyB3aXRoIG15IGNv
bGxlYWd1ZXMgaW50ZXJuYWxseSB3aGV0aGVyIHRoaXMgbmVlZHMgdG8gYmUgbW9kaWZpZWQgaW4g
YW1kZ3B1IGRyaXZlci4NCg0KPiANCj4gV29uJ3QgdGhpcyBhbHNvIGNhdXNlIGlzc3VlcyB3aGVu
IHJ1bm5pbmcgbmF0aXZlbHkgd2l0aG91dCBYZW4/DQpOYXRpdmUgbGludXggd29ya3MgZmluZSwg
ZG9uJ3Qga25vdyB3aHkuIA0KDQo+IA0KPiBJIHRoaW5rIHdlIGhhdmUgbm8gb3RoZXIgb3B0aW9u
IGJ1dCB0byB0cmFwIGFjY2Vzc2VzIHRvIHRoZSBjYXBhYmlsaXR5DQo+IHJlZ2lzdGVycyB0aGVt
c2VsdmVzIGluIG9yZGVyIHRvIGVuc3VyZSBhIG1pbmltdW0gYW1vdW50IG9mIHNhbml0eQ0KPiAo
aW93OiBubyB3cml0ZXMgdG8gdGhlIFJlQkFSIGNvbnRyb2wgcmVnaXN0ZXJzIGRlY29kaW5nIGlz
IGVuYWJsZWQpLg0KR290IGl0LCBJIHdpbGwgc2VuZCBhIFYyIHRoYXQga2VlcHMgdXNpbmcgbXkg
bWV0aG9kLg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkpp
cWlhbiBDaGVuLg0K

