Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC31833E0B4
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 22:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98484.186846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMHPy-0007jW-QB; Tue, 16 Mar 2021 21:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98484.186846; Tue, 16 Mar 2021 21:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMHPy-0007jA-MQ; Tue, 16 Mar 2021 21:39:58 +0000
Received: by outflank-mailman (input) for mailman id 98484;
 Tue, 16 Mar 2021 21:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyr7=IO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMHPw-0007j5-S0
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 21:39:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7b30479-ee19-4c55-a02b-8503332b00b9;
 Tue, 16 Mar 2021 21:39:54 +0000 (UTC)
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
X-Inumbo-ID: c7b30479-ee19-4c55-a02b-8503332b00b9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615930794;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=psAzulsjRhOdgca3K5DwGIP3hRqcLknZvmmtUbFh/S8=;
  b=BtEzG+UDJEie2pO37hlDIwOjO1O4dhGOEJt3m2wSw4CkvEpZ2Fftyb4k
   5wA/ZQ3nfESTxtqEdlPPJz81nl1He8D+J+h7JpmUZYrLsTcXJX9AXuINw
   +X8u6Sk/pNi/uZrWGKXlUgOZdl9MajXQAwunPP97WCYCQ0SfEAMwrNaPA
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2dxl6zPrUAz05Al3q24hHSMinsC0AoRo0Wf4DMR9QUpKgnoXc5jPUZgQRudmZj2d/GoZP4A3sZ
 Hpp0J3TOaiso8sQ728znVPUVhFfgUKBK5lDW6J49rdbCybHP+5G9P+4HG7xMMiVqSEoyhUs5cd
 qYgvpmt9fMcIdPA4CHZcWToIfhfyxu9WNJ4sgEmVQRnF+8laP6W1MAH+dC63NG+84JHZHlxxay
 51YFezH6fCZJlQHpv8C1gFDZEHSZ2WGx2wHVyWDsXivNzgUbhX1IhzhRS/1vEExJO2qHQfVlY/
 f7E=
X-SBRS: 5.2
X-MesageID: 39450767
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wNK8Qqmoby/K98HdIz1Y3IpbweDpDfOBj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW17LLA+E4
 eR4dcCgjKmd2geYMjTPAh7Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLw9n67Ek7G
 TDjkjF9ryu2svLtyP0+k3yy9BtmNXnwsZeH8DksKYoAxjllwrAXvUYZ5SspzYwydvfjmoCsN
 6JmBs4OtQ21nW5RBDOnTLI+y3NlAkj8GXjz1jwuwqRneXcSCghA8RMwaJ1GyGpknYIh9133K
 JV02/xjfM+Znmh7UeNkuTgbB1kmlG5pnAvi4co/htieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlZRrWG6dBkqp21VH/MahRTAaEBuAXyE5y7eo+gkTtnV4w0wE/dcYj3cN+bksIqM0lt
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XW50vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg17waVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDe65+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZIbFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89zQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PxE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU45b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 9M2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQButy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9iO+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt98TF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh8rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N9gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRIEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH28PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhxF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTdS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qKqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XvKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNsr3JupRd9llDs3YC64GDUWWF+WDep/Kl+bH10KXiHjc
 PM7O6C8m/yiQI1gaX+KA==
X-IronPort-AV: E=Sophos;i="5.81,254,1610427600"; 
   d="scan'208";a="39450767"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV+rIKrevz2HFu08pQ2uKr+ylkWn0XDBevc/HymYbt43XL/XiqYfWYsIPCh5P5d14wUjgPAJ5ZB6y2WvjnH258y1myfU1kx7MtEbbXF7gQ1FemgIvVDBec29XLFBlFyvy+0rMjTmeEnDzgj8BgjZkc23aglt3LAQta7QV+LSa1cLObaLP1xMJIGYwdvptI36Wvoh5DRMXXl05dLMl1rIfnZFHHVlxFulJkxPx0S8W66//6+cKDcZcN7W8zSkCcwvji4e8E4c2/equ2NfNVTPgLQsPtVVJw7HisyYlBewuibyVzqZ/mJqYMfpRJY26v3vBI+OqrkXpv4BonXTAC4eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XXqKxyPLYZ/kelmn64GroWCplbQONPCQMoe2hUTVcA=;
 b=I/SaScaB/XrBoEKdTbXBEdqjOspdhEDeoLCnm94Poi1GHsg1QqxmL1UKJ466EihAJ357mu35yoLglu3xBkw3Q1x5L6J8nTp2JoX00N8O0xwW0MGe6OCCWL1TrakmLBkRtoWq2wx24Tyh9S8YT6rdDc1+p85OEAlG8MPDMyGnyGONjS5EacYQTLVmotof/FSojUQBMlI2wAZZpAZ3mF6FGw184fCVkIYj9NZTcluN9PxOJjCtlDgj3iQjN2ZtJzMWMdeSaaqG8xOFQXQtEhTUCynaMMyJEYybOp2buwc/4s5zbwxQ4Sd0R+Br/B3SioI9/V85UNIW88JW+KVLYOE3/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XXqKxyPLYZ/kelmn64GroWCplbQONPCQMoe2hUTVcA=;
 b=EQLRpEYZOWca02foL6F2edNOqYpKULBvAo10iqT1KynvM0QF9BpOeSa0QdN+ovUt12JjM5gZZu20bVEt3yxyaFykQGP6FFRvid3KkDoH+P69855j6iMmPb8xp23zEDI2HwDvFvdpswFQAyF8UJgSc2o/bsRS6UFSFEedDVoo9Es=
Subject: Re: Working Group for Secure Boot
To: Bob Eshleman <bobbyeshleman@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, <piotr.krol@3mdeb.com>, Olivier
 Lambert <olivier.lambert@vates.fr>, Trammell Hudson <hudson@trmm.net>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Roman Shaposhnik
	<roman@zededa.com>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com>
 <1039be05-cbf2-95aa-5eba-246fb06be8e5@gmail.com>
 <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f1312824-f3b7-56fa-d690-fd7a9c6f6b3c@citrix.com>
Date: Tue, 16 Mar 2021 21:39:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdcea5be-ef46-440d-2d28-08d8e8c3f95b
X-MS-TrafficTypeDiagnostic: BN6PR03MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB24188300C8D86861B53EF6EABA6B9@BN6PR03MB2418.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h0VkaHuZkgi26U1kwaySxe4k/eshKM5Dy8GV3gOaAwIxeY0FtqLFlat1zmu2tUVSG+kjrcRRKqXcxOczEDfDsb61+/X1JWHA/ZF5+pDOZTMnvblU5OcqM3nHfeJ6OTjbmLJkg+yfTfwccyC5tw7DtIP7tCZ8vF+cYjk9YQwcs9Qu2ah0wG4Pqa9YJyWJ1s4XWNOyPTNVnbHW+ZaL/9Q0TpzqEV1VQa2paHhOi9uZSN9q3ZnDoTloFVd6IK1tEhJDi7j5Ac3AKmkGY3TgC+Hk1D2rgAZlt1atbBZD3ivuLdyanCo2Hwc5VoeubOi0FM373p3bEZI8ezcPSpwAJVUKjf7JmdaAeMxCUBhMTPYY45Gp1JVMRSAjwqLYTK44eYnnlfWdABFmnJlWotIb1AhDqACYaU/ORwjMw9ao5pccwPR+us9z+5WN+uqMrVsy2Uv7Dvhn81wcNwYPmBmsmILUlwe2Gw0TjMcMFRwrQLo3+NQ19BXcRghvyCNtPxJvaa+LcJKqGfN0mncPZgHa4l/MCkdDh0vBK2QkP5AILPUTlJlz04RiCFMUUNp6HctyVqNqm2A+57QcRajiYWev3M3PVBCaVVqZsp7SEE9mCRPf/7yWYwEdsgH0YheQF/IucPktCFfc3Udl6wXJg/K4y98dxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39830400003)(396003)(136003)(8676002)(31696002)(2616005)(16576012)(66556008)(66476007)(86362001)(6666004)(36756003)(66946007)(31686004)(110136005)(6486002)(54906003)(53546011)(4326008)(558084003)(478600001)(26005)(186003)(16526019)(2906002)(8936002)(316002)(5660300002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dW02ajAwNUN5TGZEZjdxZFlIMFdsSm5KY0lwNzdFRHdCNVlRQy9UMEpJdWRL?=
 =?utf-8?B?T2VqSW9lby9nU1IybHJHRTZCNnRZVEF5MXBEUWUrdmtsQ09jYS92dmR1TmMv?=
 =?utf-8?B?ZmhBRm9JZVU3Sm91WDBoMEpROFBlbGZ2TVMzbWgrdnhtK1l5S0hySHNTSncz?=
 =?utf-8?B?bHI1TE4yZmlSdCtMTHhXbHJSOHJOOWlpN2RmblhYZVJ6WlE5cmlYZktoeGMz?=
 =?utf-8?B?UVZHUWxpN1NaYkZKSkNJZUV2c3dkNUJTS2ZLWlAxdTl4cUZRTnJEZlFGZ1FZ?=
 =?utf-8?B?OHNyV1ZISUhVb0wvUlowNGU0Ly9LMXdBMVNQY1ZDa0pxdHVXQ2U4T1dmNW9R?=
 =?utf-8?B?M2VBaXZVb2RFQXZZS2xSMkVQZVA4dUphZ0VNdkt4eEdudUo4bndPbWVxU2dV?=
 =?utf-8?B?OERIZ2tKUjQrTzJKV3lobHpMOWFFcnU0R2lhaTNzbXFTRi9ieHlCMDJPeFlQ?=
 =?utf-8?B?dUZvZzRaZ1l2bHMwVTVpVjZXcUVPQ3lScmw5WG9CUmNXek44akRSZFNRZjFx?=
 =?utf-8?B?aWkreXN2UEpYUFp5cEVSZ01jRjBFaXlFTko0UTRDRTU2RTdBTEt5bXZCZk5L?=
 =?utf-8?B?UmtER2t2Z1dsSkQxQmRnaUhCbzBJWXY1Y2lYQ2NOU0FKNEoxUnhqcWl0OWJN?=
 =?utf-8?B?TWROM3hSOHBzZkdqb0h6cVlsd3dpWWZJYU1sZWEzNEFNRTBIK3RJb3ZZV1lw?=
 =?utf-8?B?dFI1OWdidEMraFhmcEcwRU9oSDdDQVdEY0R5bkJQU2twbmt2dGJJTzlZZW1X?=
 =?utf-8?B?MWt1cjkrUVc3S1JKNXIxQTdhVzdONGtYRWtrcGgwVGNzYVg5dmNlQUZnRGJF?=
 =?utf-8?B?aTlRZ3REMW4rekc5alo5alIrL3N3YnVhRXhWd1JudmhMMlJXR3RJRUZ1U0ZN?=
 =?utf-8?B?Sk1PZjFoR3lhUk1XNFJneGdWa3JWemdVRzgzYnpGdmpXby9NWTE0WHNIMzJr?=
 =?utf-8?B?YkJydWNudFFYbEJoTFd1NGJ1amliSXlmangwNzlFbCtkWG4ya016eVBwdnBn?=
 =?utf-8?B?VjdLazArbldab1FTMlNrQnFKM3FKbzlZUDRjMVVGcFBnaTFNRWtERzNpd1Bo?=
 =?utf-8?B?cHhPeU1aMzlWU3oyTVNleGRFeENiVlQ3WkxWYUQ3bHduZDVaMVFIRjUydXhL?=
 =?utf-8?B?WHZUTFdIdFo3Uk1SN2ord2QwWmhCWnFaZTVSQzhKVGJueURjZ1FSWktHT0VD?=
 =?utf-8?B?Y0xwUjVBaS9OMm5qMmUwR3lsTDN5ZHRjVTJDZHZGeS9SOXljZUhCcGpNc0c5?=
 =?utf-8?B?aDFkU3JmYXpDK3E4RXFibThMQUNDOFI2ejZteWMxdXUrQU9FNTV0bVNmZzRU?=
 =?utf-8?B?cnRQTGhUL0VWMjdMR2JuWVVtUUp5ZU96UVZMaENwWm1JQmJOM0psL29qdis1?=
 =?utf-8?B?NmdXdE0zRWdHSXJtOTFhb0UyZWFKWmkvYzVwMWFNUlBlUGFiSWNBTTNYdk9G?=
 =?utf-8?B?L3FTQVlDMFlZekNMYlJkem1YMUhDa3hUblBHVUtRdXlKbE9FQXVrallScEpl?=
 =?utf-8?B?SXRGand5NU5UbWtHS3h3VGs3dDJOeTRFTzRpSXJ6dHFSNVBaYmxLT056MWRk?=
 =?utf-8?B?Tm5XaGR3czdESU9NMWJTRFFDWGp0U2x3aEZyZEI5UThpMUFYSzFGV3R3Vk9j?=
 =?utf-8?B?Nm1mU1BQMmttZ2dHM2xmVU90SUN6VjB0dnluVHoxaGEvNnpRd1Jrd21QNVlV?=
 =?utf-8?B?cFFsd2FlakdKSVBjcVpTRDNlNkhGSDdiRFpZSlA3bFdXODc5ekRVWWVXNDBa?=
 =?utf-8?Q?0Z8+dj2MHjkEJ/YPeKgyqtwtLc1I9A5fYr1Wemn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcea5be-ef46-440d-2d28-08d8e8c3f95b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 21:39:27.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3piA45U5vweTGYJlbEMBRqY5nCN4BjhRMYlfDM6RQeRgokfaaJAcvTZ9D6Hr9LJ4RVpQnZSSUNRO3So05dm1gJiEWF2P1FqlyV9FR/bH5dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2418
X-OriginatorOrg: citrix.com

On 16/03/2021 19:42, Bob Eshleman wrote:
> Which of these dates work best for you? Which absolutely
> do not work?
>
>   Mon. March 29th, 16:00 UTC
>   Wed. March 31st, 16:00 UTC
>   Mon. April  5th, 16:00 UTC

All fine by me.  Thanks,

~Andrew

