Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8B9EC52E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853426.1267185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGfc-0005vj-QD; Wed, 11 Dec 2024 06:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853426.1267185; Wed, 11 Dec 2024 06:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGfc-0005th-NG; Wed, 11 Dec 2024 06:58:04 +0000
Received: by outflank-mailman (input) for mailman id 853426;
 Tue, 10 Dec 2024 23:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sqMP=TD=oss.qualcomm.com=jeff.johnson@srs-se1.protection.inumbo.net>)
 id 1tL9R4-0001CY-Td
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 23:14:34 +0000
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82ced2c6-b74c-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 00:14:32 +0100 (CET)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAHIhS3002489
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:14:30 GMT
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw45tda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:14:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ef728e36d5so4354188a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 15:14:30 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net.
 [73.202.227.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef779bace5sm7621993a91.31.2024.12.10.15.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 15:14:27 -0800 (PST)
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
X-Inumbo-ID: 82ced2c6-b74c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PS7l0d33ZO6FBTryro+pjfe77l6D5X7/u/fq40BAyts=; b=lHLPUz2eKaNKUox1
	Ub5dhzdNAOoET8wh+maovCNDPMy6t9eby0VQUopQ/MZLa6olLQwy25+UgpQb8ro5
	VlaMWxZAETVnPKvlzO71jszhSUnevwYHdclz20ywMSlVphBPRa3l4C1hylijowi6
	Bk3QIOrIkCQ+2EOFX/Sdw0b2IpZEpF1kH2IJP81FgU3tYlzhsESrVAf/9ob9ocEp
	ghZvyaVc4lOYnIZDKgvxAUu3jssYTEMSXzRSX3MWUGVMwFilQ0CtwOxrY/ufjUY6
	/bXYCyJGZj10oYxR+tKJcKdW/M9cw92yDO1a0dD+j2PcKvi8rQ2zfcQIOo+BmC3o
	GqzWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733872469; x=1734477269;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PS7l0d33ZO6FBTryro+pjfe77l6D5X7/u/fq40BAyts=;
        b=fnwtslGc3hza3fbFTdjpf1jGYgJxtCKEFX2mzHCcDlvejNLlyKCFGerWVCNof+mmBv
         qHGQ7BmmXupa8HSPWwZm7vSmhpuSNqSAoBls++cU0g69Mw9pWyXs1G1+P4QHnLZtSN61
         LXl1jTjDq/GdTpaeYYUv2QHoRvmb+i+Ik84/JnS2wWk3D86+h3NPsKnlb7g3Z4xsMC50
         YXgPINl1bF0CWN2bDe008CepPOy7ObUbaMI+Sm5mvooFcYDUByDl/vdYvvWpPYooYTcf
         yI/E4xDLFVwMZqY/fDuUKGWFozmUDtJn/DWq5pMRs1w3vDlkoXoWqiFeiIGamze4p94I
         tnBA==
X-Forwarded-Encrypted: i=1; AJvYcCXrOPQMjXF/Um+VYnBFOZhuLj4z3PcU2sTDjxZFMETEm2zf52C84q6hGohNzVACEJNAIlQ8rNBZ93Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKSL0sWJXj1Lva0zlP1tYRCQzpFOA4cYAhqCxNqXNMPQq8NBMg
	NGp+OxHRJRXviGIJmArDvoZT4IfpkTldQVP8kaeUUCUmIqO/qA6YYrOnRHM7oPA1vsaZzGlQ0q3
	BjJdvVfWzbnY3POZe0GE3sdJLpz6EeKuiNLT5IUfGd4NCXVYKXKUkycgPCiDhCLNz6w==
X-Gm-Gg: ASbGncvNj/XyVLai9ypWryiknZHIcOItaLde5FAmm/HBPvACxriMUVQnTePm9vldMdR
	9oEYKcbayBFgyN7eURsRcv+WyMNVtDGodO5LQUUbbLU6CofDpxtO3E7WVw60DsrmWBW4OupUamw
	FVlVy9HDtV5dP7z1KcLFdw2LVZxNTlHHyf1Nw+ygmXT1CZJn+EVKoR5kgrNnELllAXt6VuCDGAf
	qC45zflbtV40QFkPVQlw/QvSXQJIlx5geA/yWv+VR0KW7NzFlMbAL/wmxNSNBJdik/ZgcOCgNjR
	gwYWppUnCB9cRjT/PAUzV7g8RzMAEbq2cYzQAcU90TcnlA4=
X-Received: by 2002:a17:90b:2d81:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2f127fc6f84mr1521927a91.12.1733872468889;
        Tue, 10 Dec 2024 15:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBBY7t9Ty+FaaMWRfRUoSNUm5Sp5vin1MZzPlySUpMdXEhND47a5JS9XP+rCTHee3d0P0EmA==
X-Received: by 2002:a17:90b:2d81:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2f127fc6f84mr1521809a91.12.1733872468344;
        Tue, 10 Dec 2024 15:14:28 -0800 (PST)
Message-ID: <315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
Date: Tue, 10 Dec 2024 15:14:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King
 <linux@armlinux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
        Oded Gabbay <ogabbay@kernel.org>,
        Lucas De Marchi
 <lucas.demarchi@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Louis Peens <louis.peens@corigine.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-mm@kvack.org,
        linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
        live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
        oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
        Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8mKxYhmoWNru6SgfjUCI1JA-0MeTRAsn
X-Proofpoint-GUID: 8mKxYhmoWNru6SgfjUCI1JA-0MeTRAsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=895
 clxscore=1011 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100166

On 12/10/2024 2:02 PM, Easwar Hariharan wrote:
> This is a series that follows up on my previous series to introduce
> secs_to_jiffies() and convert a few initial users.[1] In the review for
> that series, Anna-Maria requested converting other users with
> Coccinelle. [2] This is part 1 that converts users of msecs_to_jiffies()
> that use the multiply pattern of either of:
> - msecs_to_jiffies(N*1000), or
> - msecs_to_jiffies(N*MSEC_PER_SEC)
> 
> where N is a constant, to avoid the multiplication.
> 
> The entire conversion is made with Coccinelle in the script added in
> patch 2. Some changes suggested by Coccinelle have been deferred to
> later parts that will address other possible variant patterns.
> 
> CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

I have the same question as before: How do you expect these to land?
Do you now have a maintainer who will take all of them?
Or do you want individual maintainers to take the ones applicable to them?

/jeff

