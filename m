Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55862C27B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 16:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444335.699426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovKJh-0005Yc-GE; Wed, 16 Nov 2022 15:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444335.699426; Wed, 16 Nov 2022 15:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovKJh-0005VA-CV; Wed, 16 Nov 2022 15:27:09 +0000
Received: by outflank-mailman (input) for mailman id 444335;
 Wed, 16 Nov 2022 15:27:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JCFo=3Q=citrix.com=prvs=3126b6494=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovKJf-0005V4-H9
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 15:27:07 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fdff963-65c3-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 16:27:06 +0100 (CET)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Nov 2022 10:26:52 -0500
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by MW5PR03MB7008.namprd03.prod.outlook.com (2603:10b6:303:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Wed, 16 Nov
 2022 15:26:49 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::c98c:5b85:6d10:4860%5]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 15:26:49 +0000
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
X-Inumbo-ID: 1fdff963-65c3-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668612426;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5qvE2/yZGFCn28tmqkqGx9hXU6pc2poFPRL+ZATTm2w=;
  b=DPwQNlecmvWU+G64pEi/ixYTI1ZanLaTByuFwBbztIAbVvxMYRa6qfoB
   ad1PsD3voqVh/PbN/QxP5tnwXonxon8J5/gZaX9vrDKwiAxzssUGMudSl
   Fu+GQbc5RM9FzbVhI+9RClKzTrvLhDFAcVS/Dkq1BgTbzb9dgZ4vTTNGR
   w=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 84536199
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:aOISWaJ681eXBPRdFE+RN5QlxSXFcZb7ZxGr2PjKsXjdYENS1WEAy
 DMcXT+PPfuMamr8Ltx1boyzpx4Ev5CEy9ExSVdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5NPF9N/
 +MJOAoHazfdieiJ0om4cPlV05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMk2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX+mA9xLRezQGvhC2FbU/2xMMB4vcRicr6ift1GAUdNjJ
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqTS0ZSQoI5fHzrYd1iQjAJv5hGqOoitz+GRnr3
 iuH6iM5gt07rcMNzbT9wlnBjBqlvJ2PRQkwjjg7RUqg5wJ9IYWiPoqh7AGC6e4addnGCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m8wWirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:DFUMqKDeN+UiT6HlHeiEsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX252oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD6nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZJB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3M4iFQJuYdI99RDBmcca+d
 pVfYfhDTFtAAqnhkXizy1SKRqXLywO91m9MxM/U4euokVrdThCvjclLYok7zc9HdsGOud5D6
 6vCNUWqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOFl3fb2sRD2AiRQu1/8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/uSUfsuhDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbXMeTMoWsNAmXE/mmLOCFqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YN5N60i6M0WI9CQ5m0mdD3AX0agAY5QypdJjubTlHrc8wjQ9mBC++tyBLyFEv+g/YF
 Z+SYmX4J+GmQ==
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="84536199"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDevdKvUHOBKgmkk7m5mTnxnO2IDaPFbX/CVU9MYeQsFqJSeg82vR/I3Vsn2bFjLVUnObGgnbJYsg8ntpkkmCsdduIN9ahno08R4qI+1rvzLK/8tYuUshNQkiZbWIIBdhM3Idn+Iiny0cxeBvRNRCZxmwt7fMr6a/5PdwMjMQzogUJ+myJHCPfO1foCFypIoXxMq7xDp1HqME2fpYcGBPGwJs6q/i0CXX3pmaDJFPZET2MvYYS4isUQdE8uPL2t3G/Ffo6kujLHtR5RDo7ZM6SIywl8aVWa3Z374kdefDvDX+GCODu2cBjgnrRdlHSVA042Y4xJuzxZ5SJB+a0BNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qvE2/yZGFCn28tmqkqGx9hXU6pc2poFPRL+ZATTm2w=;
 b=AryvJCg3D3dhC5k3sZkuWBCn3VKZBamOz7KgV3z7Hc3AakRTZ0V84hIT9vJwuX6B5YqRAEoPmm2WeqDUPyyjTiDgt/EKxEjZn9E1wo5kgevWdaWmjHc69mwqwVIqcwL2cAE9GgzkBMqXDS4QV+GA9iy0ZuSgnDcu9Ny7a/anrQ57i0/xMukziOfnpPqh2xmmYTXA6QcxTFjWdyySnt1xNlgGzLVUjE6c+21LEiR4bV/N8AM7XKV4Di+JMAr1QZeoEZJ0jK7zMCzYndaNGH0Pf0e9PCLlpPSMyKc5Cipb/VgnDHZ70UUy1IU/MxzCueaT+C9AgvDO4MnxK+c/upo6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qvE2/yZGFCn28tmqkqGx9hXU6pc2poFPRL+ZATTm2w=;
 b=hqGP1xoPHO51SYDev9/o1tp4r//dmL6w8KIbBOZ8xU35489bRFjDSaR4eKPeotvHUfr35qgwnV67meP5qHhoihvhQsOK2tU187pzAwdjn7Heq/Vpi5YGauv86lRXKfNV8a3E59hMhmV9s9naaflx8Sii408Msqo5SDNeX9wzfdE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH for-4.17 v2 5/6] Rework COPYING installed in
 /usr/include/xen/, due to several licences
Thread-Topic: [XEN PATCH for-4.17 v2 5/6] Rework COPYING installed in
 /usr/include/xen/, due to several licences
Thread-Index: AQHY73rOgdQ+1dfJGU6Fms0w6mCdf65BwLkA
Date: Wed, 16 Nov 2022 15:26:48 +0000
Message-ID: <fb59dc5e-74fe-15fb-0899-d2f5bfd8343c@citrix.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <20221103115204.49610-6-anthony.perard@citrix.com>
In-Reply-To: <20221103115204.49610-6-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR03MB3618:EE_|MW5PR03MB7008:EE_
x-ms-office365-filtering-correlation-id: 3fbf2eb5-3314-498a-fa14-08dac7e6faca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 m7moKWxQXxcGyHnpKqZPAMJOqmIfZsK6Mk6Rf81IRX/FJJUloi7E+RAj7nUJG+JWrcF4kL9kIDDk6m2XBgOhL213MYE6cyXqHFnqKmIoX6EYnXgNumwyZnFPGw05DXGTpoE9Iok3b3b8lfWTjP3Iq3avTipVCgzmg2phMyr5wDFxgXFq0WntNIgudRoBXDN0BPvAefBkZtXVTJWkEB2B/0mTSM2Jc4tfqPP9ipwNLTyTV+x4Q+tcx3di8nYqC+q6odsql/nb4dpWeEi4Ya/Xqn6+S1GiE3sj0CcBIzmmxclM1Pt745gEsS2ay6+zeV2cjJLlWFMi1CHlf/t3qem/2JizBOGkj6dnTsnDvqLVBYc43E791/z6YwloBRQGstoxEw3ATjmSQ/8HB3E4ck87NwM2RzZfYw+od3cBMNmWLxt74k6MHIX4kzIFZ+X3RMEOvYgO3ZBTA0XGBxvgQOIR9STqhVEHwxuAGSsVDd9yS7kPAKO7yky78UmuRQoev0yYbfPxn6/2nkUbLKXF/jPW/XhT27zqnMJBy07Nplqh+kWVYHiYXV/8Jqf+2e8WBopAmcwjPTVqDSnNNM5bLv2xpEJuNSYY5nfg7oJuspxbz7lCQAC5S9GUT+cIPRtKz7i3IOmsdvod82k667iXpezJqhg8MrzBWYj2v3YBqHj4qVpZzTrEG4R3N7uwWvEilYSLs6V0Vyxwr+ctX/JrwFRL5w4a2owelSx+BVHt1lHFtP4nHqWPqMYnF111xvtXH5ta+5dBPAG8almyI649sC5bMtgo2gjOFo5DvATcBRhBXHcUz8TIt3+rNF98fASud6uzOZw2fjmExRil2EUAsLlA6Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199015)(8936002)(4744005)(2906002)(5660300002)(31686004)(41300700001)(54906003)(8676002)(76116006)(91956017)(4326008)(71200400001)(66946007)(82960400001)(478600001)(66476007)(66556008)(66446008)(316002)(6486002)(36756003)(186003)(26005)(86362001)(6506007)(53546011)(31696002)(2616005)(6512007)(110136005)(38070700005)(83380400001)(64756008)(38100700002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXBrbFUxTFlZQmlXNVRTWThIY2dKVDRHSWViWDdmSGtaSGp4WFhDY0RCN0VH?=
 =?utf-8?B?MDBaQ01mOTFOVmtya3FuSkNmZ3lIY2YvMFF5LytGaDBLZXIvekpuRitXdTA5?=
 =?utf-8?B?U3F0OUVmREF1YW9iUFFkZUdqRGV3Umx0TTJBWVBzUW0xQnhTV0VUYUE3cFBx?=
 =?utf-8?B?amR2NnhyRGt6WXU4R0cwc0lOUE5yZWtNQWtlc0JqcGVHNW9XYlZ1Z0dKSUZq?=
 =?utf-8?B?SzNWc3orM1pNMGpoS3l3SEx3QlBNN1FabEtjenFKY0t2RXQ3ckxtMXFwUFJI?=
 =?utf-8?B?RWU4VG4rUUxRSTVCTUZjMnBGVHlRdkVTOGFMSnVZYTFaQWV0ZGU5M1BMcnlX?=
 =?utf-8?B?ZW9IRTA5N09zNE5CS3FWNXdvNXZWQXBGYXVWNHFaNWFXOTgvclFtVmNjZlJn?=
 =?utf-8?B?SFRYSXhUbWJ5d1kvSndwTnZZcXBJMkZ3MTFyUlpOcnFFdkcwMXFmRkI4OWpY?=
 =?utf-8?B?ZFlDR1RaY3lobEM5OTdXMWg5bGdKa0tzTGxtWkdubDBtc0NwZXNOS1krS2tI?=
 =?utf-8?B?a1pzWmdZTThLeWhMcDBhMU9hR2R0WTZibW9YdzBUU3M4TlVUV3oyTTB0YU5F?=
 =?utf-8?B?VG45ZjdBdFFYQi9ZUllkZHdUblU2OEpxMVlOTWRkVUk0V1I0US9rRFhTeEVX?=
 =?utf-8?B?Z3NVbGpuanNzNVZnaDhwSEZ6Z0JuQVQyUXQ0TG9vTk9lVnNhdTJqR2taRFVX?=
 =?utf-8?B?alJtRk41WkgyZ1J0ODZBRjRYMUN6bHBVZGtjeWkvNFVuVk45VGViREdnZE9L?=
 =?utf-8?B?anJsK0JmTjBVL0J1ZCtUM1RVRlFUKzBMT1htSU14ME5qaHJmUFJITXE0U3Iz?=
 =?utf-8?B?RG5hYTlJQlVLYUdGUUpuanREN1pYaFltdmpWdEJ4TlB1RjNzbXkvekp3cjJu?=
 =?utf-8?B?ZmQ4T0JFOVI1dVZ0RWtqd0c4bkk5ZkdnYktEL2xGZk1KMS9qU3BCYjc0MWNY?=
 =?utf-8?B?UFNibjhlZjBmTWRIT3ZrOFNPTWhQR2xESm5KL2JVdmhleEhhS1piTzhaeHd2?=
 =?utf-8?B?Y0V4bWtpd2JDY3dSbkpJMDFTUy96UHhscEQyTkl0Z0lBRmZHUTdKNkRDZ0RE?=
 =?utf-8?B?dVpHd1oybDJSbTdiTGpWejdISUhVK3VNZVoxMVVNZjFlUmVkRFJoNTExN0k2?=
 =?utf-8?B?ZEIybXI4Y1RvdnNUQkREdWpXOEIrdTZlSFZPa2Nja25uNmxXRkdEQ2J1cm0y?=
 =?utf-8?B?VHlXbVFmUkk5ZCtVanZIMzVYdmthTkxGNENhQVBEQ282eURxUkJMSEUrMGwr?=
 =?utf-8?B?WTAxQXNOM2FqZ1YyL2NtS0Fjc3l6VFNtRnlvZXZxZWMyNnFKeEJuNWlUb0d0?=
 =?utf-8?B?Q1Rnb3JRNHVUSWgxaHdZRjBTVWtlVE1QSkVkanhzZ3RmdkFSU3J5cHRCTVhu?=
 =?utf-8?B?QzA3ei9yZG1kMVpGakJleER1cFdSenMySWVVN09HNE9sTE9oMHhadFgrVVJp?=
 =?utf-8?B?dHlORHg2K0V1SEt2VWVGakpYc2tHYU1oUkhpeUpZbDRRVkhUcGRrL2Z0anVp?=
 =?utf-8?B?aDBsY0RNbFN3MVBNQ1orYmlObEhYQTRzdjJOdUc4bTFaaVFob3IybXVyQnVJ?=
 =?utf-8?B?T3c0ZDFJS1V0cXJOY0xjY1F5U3lETWRZUDJaZE9rOElEeStSRjB0eXhZbmZv?=
 =?utf-8?B?MVhaVTZtL2Q3Z1Z3UmlEMmVERm03b2RHMy9obnFaTUlZRFU3YTVDaU1WdEh4?=
 =?utf-8?B?S2pvVG1pem90SVNQdUJheThrZVp2L2RPb2VsVUh3YkdyWnNuMUwzT2o2c2U0?=
 =?utf-8?B?WVRidjN2VXZhTmZjSUhrMjlVSi9sRVUyQXVZNHVCd05Ddmw2WTQvaHVLQld4?=
 =?utf-8?B?WnpDeG5aMzVhWDlIS3ptMlpjQlVwNHVINCtpbTNWZG5jcGRWVW5xL2hxaldq?=
 =?utf-8?B?RVFFWXl1K3kxaE1FbUhOVlF1R0FSbVc2cGdMMVJxZlNxQm1DdCtYTjIvVTlH?=
 =?utf-8?B?QWNST1g5bWJUTjV4Z2Myb2krVFlqT3dpMFpGcmd2QUVXMGZyOG9iUEJZbVp5?=
 =?utf-8?B?bUx4dHd1TkhmRFVRZHd2OFFCR2JnblFFSTEzU25HYkVPM2ZQOUlnbmgzcmtQ?=
 =?utf-8?B?L3JaR216RHBUL05WMnY5U0REdU14ZlFkYlR2R25vUXJvRXV2b3dHZmdSRlpt?=
 =?utf-8?Q?pN6whNsS3xohYpn7Cs4ijiPPQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D34641DA7324FD47B85A1E5EBCB9C538@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yZ8qE7WwCs1IIIseRLCUdbj/nqg9IJdkUUcVkHrGDMdFzLswbjVSzPDGySaXl/jiINBHUrRhsgSu2jFF4V3vnOZmK3UtgoJ8icFUm2XtvR5iEAiqkE+x95wG7+y2yyB8YtpaSQwEewXsTSwfiJn5n1UNjdvrIOEzeYyG07zdkzB7bPgPZNM9zEmKgDXl5Y5pztOq5AUFkD+u89mMxpX8pkmb4vdppHCANbnoFL62bsAa+9CtEkrGwrrnaMX9+GiXgvpD86XDscBLjsP0+BMx4u5vecrsaJwB5xDmIx7hWJV3zBOWOD9Zt6nGYEUkjaJaXlW01fkvXFsgbHQ5M3M04evdSrzcJn9Uj1EZH2O8MT0EFzQ2whgaTLQ7t876denqHyGMQQVvzM2KgsdCtPdPE3ZPL4fBD84s8votCoBK7vj1aQq/f0SNXNomgIXaMasM5MLNbOmFxJwVR+fVdVdkR/t+pCK8SUj+sZdvcDIxHx6gXqmizMuoGC5sR+Ph1wfsqL8QiCQGufu/qU6ExuccTkL6T59x2RBN7XyPMIuUpFRtcxZEaeU27bs1Oi7ODbkw6n66elluQyvWIlSYX2DP4pbzTGVaaiQLnfNQ2ECgYfoOtJbW5D9tTy0lOirmncPfWdO46ExZ7xdEPiW0rnA1uCW36mi+YHHjd8JecvW4NhBl90NBbiqQ4ElkmSMCLLOLxIRPTQc8Q54vdQE3xCsnoc6S05bDN07LbxOuF4YEXXOAHUIounRT9huucaEFlbKT37hUrJEa/GJiRmc4JFf0U9rbTfTSUCizDK7fw85jpe8I/5l5PSHjP4mYYOO/qrQBt4pccbIL/HXX3knwIvo4LzLOGmWm4Dw7aJnuj1EJtwIOEeQZY+mvIgHPOxHv8CbVMfJbMMnAqGzEJiqMzNJasw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbf2eb5-3314-498a-fa14-08dac7e6faca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 15:26:48.9889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +mBWA57l8bWM67+DD2CMAAZn6dCl94OLoA1XQob3V/oQP2p1QD7Bv+2U44/MsGtGb5M0WNiFgLGb2c7dDpIH5wdXM5ZmeNJ1GmeLt3xppi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB7008

T24gMDMvMTEvMjAyMiAxMTo1MiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IGRpZmYgLS1naXQg
YS90b29scy9pbmNsdWRlL3hlbi9DT1BZSU5HIGIvdG9vbHMvaW5jbHVkZS94ZW4vQ09QWUlORw0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5mZTNmOWI3NTU3DQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdG9vbHMvaW5jbHVkZS94ZW4vQ09QWUlORw0KPiBAQCAt
MCwwICsxLDI2IEBADQo+ICtYRU4gTk9USUNFDQo+ICs9PT09PT09PT09DQo+ICsNCj4gK1RoaXMg
bGljZW5jZSBhcHBsaWVzIHRvIGFsbCBmaWxlcyB3aXRoaW4gdGhpcyBzdWJkaXJlY3RvcnkgKCIv
dXNyL2luY2x1ZGUveGVuIikNCg0KVGhpcyB3YW50cyB0byBiZSAkaW5jbHVkZWRpciwgd2hpY2gg
bWVhbnMgdGhlIGZpbGUgbmVlZHMgdG8gYmUNCkNPUFlJTkcuaW4gYW5kIHByb2Nlc3NlZCBieSAu
L2NvbmZpZ3VyZQ0KDQpJJ2xsIHNlZSBhYm91dCBzcGlubmluZyBhIG5ldyBwYXRjaC4NCg0KfkFu
ZHJldw0K

