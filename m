Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514956BBE5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 16:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363462.594000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pBz-0004rz-9v; Fri, 08 Jul 2022 14:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363462.594000; Fri, 08 Jul 2022 14:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9pBz-0004qB-6o; Fri, 08 Jul 2022 14:42:51 +0000
Received: by outflank-mailman (input) for mailman id 363462;
 Fri, 08 Jul 2022 14:42:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CmV=XN=citrix.com=prvs=1817bcba8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1o9pBx-0004q3-N6
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 14:42:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ae8931c-fecc-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 16:42:48 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Jul 2022 10:42:44 -0400
Received: from DM5PR03MB3386.namprd03.prod.outlook.com (2603:10b6:4:46::36) by
 BLAPR03MB5538.namprd03.prod.outlook.com (2603:10b6:208:285::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.16; Fri, 8 Jul 2022 14:42:40 +0000
Received: from DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782]) by DM5PR03MB3386.namprd03.prod.outlook.com
 ([fe80::298d:4044:f235:c782%6]) with mapi id 15.20.5395.021; Fri, 8 Jul 2022
 14:42:40 +0000
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
X-Inumbo-ID: 3ae8931c-fecc-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657291368;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=09lwFhduaGm3TxU85OxKxjRrE0YOkhVWz+ZIHW4XzfM=;
  b=Q9ADp+8ZGl52uUmqL3amCph083NMebfuc1iNwSOhueDWmDqttFPnulOj
   IIGcbM0JEO5OBERq9iq9o9GYkUfCKbm/xv0c6xxiwOA5JNQWnjK5DU8v7
   xYmuw8zjTVjvLCMUxMg1od+ikRAxL1RAm1q946+1qJjdM+5MVS5E25m4R
   o=;
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 75377074
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QOI2qaJ15mA7NunCFE+RVpQlxSXFcZb7ZxGr2PjKsXjdYENS02YDn
 GodCD2Ob6vcZWvwett3Ooy18BwOuMTXzdc1SFdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3dY42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M1QtKa3GUQKAqiWpv0vVEBTCxBeAaITrdcrIVDn2SCS52vvViK2htlLUgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMGFGvqQjTNb9G5YasRmP//Ya
 ow8YD5maB3GbjVEO0sNCYJ4l+Ct7pX6W2IF8w3K/fVri4TV5DNq9YLBFvrzRv6te+dHgUTBv
 2XWoU2sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRRqjqmSDuR0ac9VVGuw+rgqKz8L8/AKxFmUCCDlbZ7QOttIyRDEs/
 k+EmZXuHzMHmKaOVXuX+7OQrDWzESsYN2kPYWkDVwRty9vsuoYolTrUU81uVqWyi7XdFTjuz
 hiQoSM5hrFVitQEv4254FaBhTuvr5rISwcd5wPLU2bj5QR8DKamapKp7x7H7P9GBIefUlSF+
 nMDnqCjAPsmCJiMkGmBRbsLFbTwvfKdamSD2xhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLIT7wJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:fEcVIqj5GryBv7XGura1DaS42XBQX3h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3z8FOgk/gIsKwC
 zgqUjU96+ju/a0xlv3zGnI9albn9Pn159qGNGMsM4IMT/h4zzYJLiJGofy/wzdktvfrWrCo+
 O85yvI+P4DrE85S1vF4ycFHTOQlgrGpUWSkGNwykGT3PARDAhKd/apw7gpPCcxonBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3/rFuG4O5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEXQI5tlluZEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.92,255,1650945600"; 
   d="scan'208";a="75377074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hkhsr7j68sevpnecGEkiI5rr1iPA3PEWVMO1K23ZCPfVL/7lw7t7blRmwrQNZTXBzXpROroGCU9SnyJNEOsAbzSZ399adrZVA8/8xQxbCMrjxVetkYe++/DjxFAfOhbiSJBULmAH1pE6QkeyNvRA/9+uoZZbfECYC4+klqbuRABi0BzP0es+bwceSTP8OrgNNMkESJ+ALAsTHxtRXDhdJhDDxOhZzFnwCjwqap1RkO0sE4lmTIIAmZskc4IkMWP4ENo2IEtjMPmj3P3kS+5DnsQVfrOTucfaKffowTKuPZYJEZUdT9c1o0eqFN1yNxZtuiqP6ILeZwGKuNyFqItNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09lwFhduaGm3TxU85OxKxjRrE0YOkhVWz+ZIHW4XzfM=;
 b=jNk6yr1En6dv/WORVDool8xdrS21u5OYOBRbjBblE5iHB6rfsMvwq/odLpNToFvezljs38U/L1bkM9qfkejNXZnTe/RfOV+8A04oYPu8m13IX6DMAeLUfTzXzWJ3MK68Qaw14cPqkTVpIszXLtLtrwExC+e24FQTVWNipQob2MYvB7Jjsn5aMXtcJkVISvvkxRjTt6Gn1fI9OI+aRsWXkXwNoS8qlTAJnKIqhkHg7XAdI3gu+s9vokjMANyBC9hYMEBYsHWq1/wSozsegZUUO37wT/qhox0Y+NGutUwtI6TGvOPsZqT/ks+6Vgv98/gmcfxCtrWlRlqWPRke6CPr/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09lwFhduaGm3TxU85OxKxjRrE0YOkhVWz+ZIHW4XzfM=;
 b=gqEONJcbrzGwzz7JOdaHSRq8qbBfByzN8R39KyVBjAgMJb23GPQplNz1hd6gJbJsD56cUMIwXfMRDxcI7E6D+hfuXtKlu4VjfDFuZbzzqu1dje6C9+i0vIjV8E2msO7g5wPkzeaVBrJA6Sf2m7i4/AaBMFNvwDhf0dTlslUxJvs=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, David Scott <dave@recoil.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH v11 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v11 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYktKDq8cM5FJ1YU2wVC8sy824sa10ic2AgAACfgA=
Date: Fri, 8 Jul 2022 14:42:40 +0000
Message-ID: <94eb45a6-7c84-6b6a-e5c1-e2ced336e675@citrix.com>
References: <20220708135559.30719-1-jane.malalane@citrix.com>
 <A226BF44-AE5A-4689-8D56-334A148D9075@citrix.com>
In-Reply-To: <A226BF44-AE5A-4689-8D56-334A148D9075@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f203ac8-4384-469c-91d9-08da60f01c14
x-ms-traffictypediagnostic: BLAPR03MB5538:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XuJjE40UOl9BLpmzvFmfCfUpmziaHrEH+pZCwVMQtnIj7Nf18MrVD+Jxi/TQTjB9pVfJC/p4t+aCxL6Tmw8H4q3RnRwjdRfEVR6IsD5C5RetK0yN+52HMZvz9MeVz1ikaCemuLQ387HeP1bjmCTWjlVSLTYAjBXhh4c9w6E0JBy/ZdI7cF8VquCJ6GggPOEG801TYETSOs9XsKUVGceN+q1zIHBhuXEoJIw3kCGa3sho/i7Qog4KBfp0pVkKD1eCHDLNGbGYoyfqs2kwbeDsv2wsB/gWDOO2utmnSJigw7qGj7NTMI5GtqrSXh6zgqApwwAoVdfA+PQilX6Vr+kCURYRpwBuXdCO06jnaMEjBKEY0JZyP2xMpOVHRMPSzC9DqE1Q0zOpwax59HOioGaRrMYWuWps9zAwghBdbhjzeHlmWhIUoZtdR/DqkEHA30WWbp/3UHvIu7l+xbR9z0EkbKdylYCu8llTYqzPMUN4aSyCARBbZJaN2p8OOLcX12IsVaxARMlQeu5+g6b0rUGlWODxPrHIbBipReA/En8Wbd4zd/Gog5YH0lJ0O61Ou4RLGg3U9zml8R/XexdcOL4o9OfxxvTAGoolCXJUTeo+sQmu7CN7xh/z2d80tqxHWXGrigLdDeWt2SieLWIuBlO4utYqltNs2dXHLka8myxTOmkCIkFQvRTb7onQfHUziMVxHEQdH82Au2saHCyj+slpJx2uHw6NfXz+e77c/ZBWkaRlc2Vf9mxGwccEzg98lmnpGHNF5mwSuLnxwH5BsYkcm/n5qw5rczySwoUpgt0KGGuTWdqkw8vyZJmfJVHO3liCsB6gyzYXCsIW9oW1ADuSEw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(2616005)(31696002)(26005)(6506007)(38070700005)(2906002)(4744005)(6512007)(66556008)(8936002)(86362001)(6486002)(41300700001)(478600001)(53546011)(7416002)(5660300002)(186003)(83380400001)(36756003)(54906003)(122000001)(38100700002)(91956017)(82960400001)(31686004)(64756008)(66446008)(8676002)(6916009)(66476007)(71200400001)(4326008)(316002)(76116006)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUtQUlJML25FSW5JcmRqU3FGK1VBblUyRmQ5UC85YmIvUlhZQlZqR0liK2lP?=
 =?utf-8?B?STlpMXRjbktndE43WkxXSi90TUh5V1IxbzRVNWk4R2xpZFpsRE5hdk1RbjdH?=
 =?utf-8?B?Q25nVGl0R3IwZ0Q1cDk2RUExQXphakptK3luUjdUZDFaNytDd1U2K1c3eTRY?=
 =?utf-8?B?VTZpeGFyYmwzRkhCMkNpanJLNHJCdk5XZmt4cmFnTW1vOWpLNGtOMnZNcjZw?=
 =?utf-8?B?VlM5SEVPdWFPL05qZUJDcWpBR1hXVHpDRENBWFd2WDFBYUw0UzcxMkgyUlVu?=
 =?utf-8?B?NWJienVJWUNqREQ0WFRkVURoUFBSQjYvQ0VNL05GejByeDhmVzlOS2tiUnhn?=
 =?utf-8?B?Y3dLdEJUVkFEQmN2cnlyYXMyU1hrOWZaMHJMRlpPbkZlZXFlNlYwaGJFeDVx?=
 =?utf-8?B?RzRHWVpxTEtPdmhvOWNkTXo3eHZFSFpZeG0yNHVLSjB6dCsvbTRqeCtmMlBZ?=
 =?utf-8?B?V2dWL1lFNnp0SURzMkhSMWRUWXJpUkpKUXFqcXFCUXNvWEZyNDY5TjdKRnNj?=
 =?utf-8?B?bjB3YmZCSkNQQVRZRExZRmJTUjUzSGRLZnhaUEU0SU9MSEowS2NTd1FsS0c2?=
 =?utf-8?B?ZUJJRUJtUGlYbktSRUw2MVlYc0hkZWphK28vUWRnSm44WFVab21MZTZybVpI?=
 =?utf-8?B?azV0OTlNRWF4S1lqMjNIWko1ME5yYlRvamFQdml3WVFmL3NtOEVzWmp2ejVv?=
 =?utf-8?B?WUs2SXJNOFNmdlFSTFlsNHcxUVE4N24rRys5cXplZW4yT0VPSFBJWExYZzMy?=
 =?utf-8?B?QnRSZHAxNWF1ZzZXVVJSOSs5dEFxZUp4bW1pY2FRZElTNE1kUzEzU2tGZ3Yw?=
 =?utf-8?B?UWI0UUZQY0h5US80MkljaU1IZmV4aGhvTnZEbXg1VGpzVFo2UnpjaTdhWnlk?=
 =?utf-8?B?dmRzUzR3K3Z6RTdrNzFlYTZRZ0EvQkNMaWtDRkQ5blJVMUhYWkE1cWJ0RTBJ?=
 =?utf-8?B?UzRjNU9uVUF2OUlINm5od2g3dzVBaU1SRysvZ0RLOS9kZVJEQWM3Zkc5N2FD?=
 =?utf-8?B?RlJobWNXSWZlRXhCZ3BRakJ3eXBhckhtZHVkM1paaXBwTjI0bDRXWUwyLzd2?=
 =?utf-8?B?U2p3VEswL1pwcDVGRVZBaTVQTmVuTVNZMFB5U05HQkQrV0FKeUZ6NVZRVk04?=
 =?utf-8?B?ZVdVa1lsMnlCVWN4bWxra3JORnVrbFhTUDJGRXBQZXZHR2VGa3ZGU2I0dnVC?=
 =?utf-8?B?WUhIMU9XTjJ4Tk11UFhLaE12eTlHRG40RG9SL0hGMVIyZDhOR1ovWCt5cVRS?=
 =?utf-8?B?OVlvdENneWZwREhTNjBGM0Qwck5LV3ZQb0tUUGhNRkM1NFRUV0lueXBIR2l3?=
 =?utf-8?B?YXhjSFAvdXVRaVA5UmxXT3RyYUxqT041YytiZWRadzFXaC9pMjNoMGZ2b2da?=
 =?utf-8?B?dlBxR1J6dmMwMVZzblRzRUpaM1pOSkR0Z0JiWUpqd3BRWEx6Z25Xc0F0dGFF?=
 =?utf-8?B?UmdUZ250S3dtenRFOXBialg3c0Q1Qi93bnM1QkE2em1NbGRBYXdKYTFsYnJh?=
 =?utf-8?B?WXlCbzVKNmc3K2laNjdCNStHMU50dDBuZmUxKzA0Yk9GcEVqOWFjaHFOcHlC?=
 =?utf-8?B?NWNvSEtVZzZwRTRaSTYwOVVqcXN4enNkUk5HaCtkWi9KbmxXdW5FMHo4MmdD?=
 =?utf-8?B?NitqdSs3c05iVU1sVkxXaXoxYnlmMEVpTUliRCtaaE9tQjBHbkJLVWQ3amE5?=
 =?utf-8?B?ZWQ4WmNnenREeFpFT2ZweWZhaERkWnBrZEliSUJKMWRab21yT1d6K1YxNWhr?=
 =?utf-8?B?dVE2b1BiY2hybnhtK05BL3kwL0F0YmN1bnU0a29KY1ZlbzdlRTRYYkZYZmwr?=
 =?utf-8?B?L1hqTXEzNVBzaU1qOHdYZ0k0WnYrWHVKR1RBRjEzT3h4TzVLajYzR3YyS2VF?=
 =?utf-8?B?VTcrT1VsTDBDQ3FSUDRhb1lndFhLc1NraUZTczUwOG9vUWRUclE1K29OT3lQ?=
 =?utf-8?B?c1oyZVhLd2JDRmVreHM1QnQ1VS84M3NSOGFjdFRaUmN3ZkgwU2F5T3BJSVNZ?=
 =?utf-8?B?bFNRN09sS1E4U2dOYjRhY3Y0cjFuSnp5M3lIOGhrcmpVTWtSVVh5clBOOTFD?=
 =?utf-8?B?MlQ5ZHg4RW9PcnE3aGV6VG1oOE5RNlJGU2ovTUEyZkZxbGNnTzF5Z3gvcUs4?=
 =?utf-8?B?M2F0ZzNmaFJlRkU4amw5cFlSaFJIYWdZZXFzQllmRk9aU0FPclRQOU9oU0ts?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C72174E6399044E899A55F6461326B0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f203ac8-4384-469c-91d9-08da60f01c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 14:42:40.5405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcJCK4+pMNuQQPdiIC/qmph1zbzOd0icHazoRA3g3NLeZxa4z4Ht7bMvr5qU4c1bYDS3z6xzHCfDMYSYvgp45ORBqSwq5DI7ONQgGpxr37I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5538

T24gMDgvMDcvMjAyMiAxNTozMywgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToNCj4gDQo+IA0KPiBP
biA4IEp1bCAyMDIyLCBhdCAxNDo1NSwgSmFuZSBNYWxhbGFuZSA8amFuZS5tYWxhbGFuZUBjaXRy
aXguY29tPG1haWx0bzpqYW5lLm1hbGFsYW5lQGNpdHJpeC5jb20+PiB3cm90ZToNCj4gDQo+IHRv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAgICAgICB8ICA5ICsrKysrKysrKw0KPiB0b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICAgfCAgOCArKysrKysrKw0KPiB0b29scy9v
Y2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyAgfCAxOCArKysrKysrKysrKysrKysr4oCUDQo+
IA0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXgu
Y29tPG1haWx0bzpjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+Pg0KPiANCj4gDQpIZWxsbyBK
YW4sDQoNCkkgYmVsaWV2ZSBJIG5vdyBoYXZlIGFsbCB0aGUgYWNrcyBuZWVkZWQgZm9yIHRoaXMg
cGF0Y2ggc2VyaWVzLiANClJlZ2FyZGluZyB0aGUgY29tbWl0IG1lc3NhZ2Ugb2YgcGF0Y2ggMiwg
SSB0aG91Z2h0IHRoYXQgZXhwbGFuYXRpb24gbWFkZSANCml0IGNsZWFyZXIgYnV0IEkgY2FuIGFs
d2F5cyByZW1vdmUgaXQuDQoNClRoYW5rIHlvdSwNCg0KSmFuZS4=

